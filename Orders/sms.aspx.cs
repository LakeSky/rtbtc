using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using meis007Model;

public partial class Orders_sms : PayfortMaster
{
    string pspid, userId, pwd, amnt, currrency, alias, orderId, data, operation, smsc, acpt, userAgent, wind, acceptUrl, exceptionUrl;
    string responseFromServer, language, encodedString, html, message, respAmnt;
    string responseStatus, responseErrorDes, ncStatus, ncError, acceptenceCode, payId, currency, cityCode;
    bool status, withoutSms;
    protected void Page_Load(object sender, EventArgs e)
    {
        basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper))
        {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
            return;
        }
        InitializeVariables();
        BuildPostData();
        PostData();
        if (!status)
        {
            obj.ErrorMessage = message;
            RedirectToCheckOut();
            return;
        }
        ReadResponse();
        if (!status)
        {
            obj.ErrorMessage = message;
            RedirectToCheckOut();
            return;
        }
        if (withoutSms)
        {
            obj.Status = true;
            DoBooking();
            return;
        }
        decodeHtml();
        smsHtml.InnerHtml = html;
        //4000000000000002
    }

    void DoBooking()
    {
        cityCode = Session["cityCode"] == null ? string.Empty : Session["cityCode"].ToString();
        _createBooking = new CreateBooking(_entity, basketHelper, obj, cityCode);
        _createBookingBasket = _createBooking.Create();
        SaveTransaction();
        if ((_createBookingBasket.hotelDetails != null && _createBookingBasket.hotelDetails.Count > 0) ||
            (_createBookingBasket.packageDetails != null && _createBookingBasket.packageDetails.Count > 0))
        {
            rfndObj = new RefundBooking(basketHelper, orderId, obj.PayId);
            objRefund = rfndObj.Refund();
            objRefund.TotalAmount = basketHelper.totalPrice.ToString();
            Mailer.SendBookingFailedEmail(_createBookingBasket, obj);
            if (objRefund.Status)
            {
                Mailer.SendRefundSuccessEmail(_createBookingBasket, objRefund);
                message = "Successfully created few bookings. Some bookings were not done for which refund is done.";
            }
            else
            {
                Mailer.SendRefundFailedEmail(_createBookingBasket, objRefund);
                message = "Successfully created few bookings. Some bookings were not done please contact support.";
            }
            Session["NoticeMessage"] = message;
        }
        else
        {
            Mailer.SendBookingSuccessEmail(_createBookingBasket, obj);
            Session["NoticeMessage"] = "Successfully created booking.";
        }
        Response.Redirect(Route.GetRootPath("home.aspx"));
    }

    void SaveTransaction()
    {
        _entity = GetEntity();
        pgTrans = new PGTransaction();
        pgTrans.BasketId = basketHelper.BasketSequenceNumber;
        pgTrans.ConfirmationID = payId;
        pgTrans.Status = responseStatus;
        pgTrans.CreatedAt = DateTime.Now;
        pgTrans.RawData = responseFromServer;
        pgTrans.TransType = operation;
        pgTrans.Field1 = acceptenceCode;
        pgTrans.Field2 = orderId;
        pgTrans.UserId = CurrentUser.Id();
        pgTrans.TotalAmount = double.Parse(basketHelper.totalPrice.ToString());
        pgTrans.ResponseAmount = double.Parse(respAmnt);
        _entity.AddToPGTransactions(pgTrans);
        _entity.SaveChanges();
    }

    void InitializeVariables()
    {
        pspid = GetPSPID();
        userId = GetUserId();
        pwd = GetPassword();
        operation = GetOperType("sale");
        obj = new Payfort_Response();
        obj.Status = false;
        amnt = (int.Parse((basketHelper.totalPrice.ToString().Split('.')[0])) * 100).ToString(); //since payfort takes 1000 as 10
        //currrency = ApplicationObject.GetBaseCurrency();
        currrency = "USD";
        alias = Request.QueryString["Alias"];
        orderId = Request.QueryString["OrderID"];
        smsc = "Y";
        wind = "MAINW";
        acpt = Request.Headers["Accept"];
        userAgent = Request.ServerVariables["HTTP_USER_AGENT"];
        language = "en-US";
    }

    void decodeHtml()
    {
        status = true;
        try
        {
            byte[] data = Convert.FromBase64String(encodedString);
            html = Encoding.UTF8.GetString(data);
        }
        catch (Exception e)
        {
            status = false;
            message = e.Message;
        }
    }

    void BuildPostData()
    {
        data = "PSPID={0}&USERID={1}&PSWD={2}&AMOUNT={3}&CURRENCY={4}" +
            "&ORDERID={5}&OPERATION={6}&ALIAS={7}&FLAG3D={8}&HTTP_ACCEPT={9}&HTTP_USER_AGENT={10}&WIN3DS={11}&LANGUAGE={12}";
        data = string.Format(data, pspid, userId, pwd, amnt, currrency, orderId, operation, alias, smsc, acpt, userAgent, wind, language);
        //data = string.Format(data, pspid, userId, pwd, amnt, currrency, orderId, operation, "xx", smsc, acpt, userAgent, wind, language);
    }

    void PostData()
    {
        status = true;
        try
        {
            request = WebRequest.Create(GetDirectLinkUrl());
            request.Method = "POST";
            byte[] byteArray = Encoding.UTF8.GetBytes(data);
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = byteArray.Length;

            dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();
        }
        catch (Exception e)
        {
            status = false;
            message = e.Message;
        }
    }

    void ReadResponse()
    {
        status = true;
        try
        {
            webResponse = request.GetResponse();
            dataStream = webResponse.GetResponseStream();

            reader = new StreamReader(dataStream);
            responseFromServer = reader.ReadToEnd();

            xml = new XmlDocument();
            xml.LoadXml(responseFromServer);
            xmlResponse = xml.GetElementsByTagName("ncresponse");
            ncresponseTag = xmlResponse.Item(0);

            ReadVariables();

            if (ncError != "0")
            {
                status = false;
                message = responseErrorDes;
                return;
            }
            else if (ncStatus == "0")
            {
                withoutSms = true;
                message = "Successfully charged";
                return;
            }
            withoutSms = false;
            htmlResponse = xml.GetElementsByTagName("HTML_ANSWER");
            encodedString = htmlResponse.Item(0).InnerText;
            message = "Please enter SMS code in below text box.";
        }
        catch (Exception e)
        {
            status = false;
            message = e.Message;
        }
    }

    void ReadVariables()
    {
        responseErrorDes = ncresponseTag.Attributes["NCERRORPLUS"].Value;
        responseStatus = ncresponseTag.Attributes["STATUS"].Value;
        ncStatus = ncresponseTag.Attributes["NCSTATUS"].Value;
        ncError = ncresponseTag.Attributes["NCERROR"].Value;
        acceptenceCode = ncresponseTag.Attributes["ACCEPTANCE"].Value;
        respAmnt = ncresponseTag.Attributes["amount"].Value;
        payId = ncresponseTag.Attributes["PAYID"].Value;
        obj.Acceptence = acceptenceCode;
        obj.PayId = payId;
        obj.OrderId = orderId;
        obj.Xml = ncresponseTag.ToString();
    }

    void RedirectToCheckOut()
    {
        Session["Payfort_Response"] = obj;
        Response.Redirect("checkout.aspx");
    }
}