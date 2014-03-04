using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using meis007Model;

public class RefundBooking : PayfortMaster
{
    double amnt, respAmnt;
    string pspid, userId, pwd, orderId, data, operation, postUrl;
    string responseFromServer, message, samnt;
    string responseStatus, responseErrorDes, ncStatus, ncError, acceptenceCode, payId, paySubId;
    bool status, readVariab;
    public RefundBooking(BasketHelper _basket, string _orderId, string _payId)
    {
        basketHelper = _basket;
        orderId = _orderId;
        payId = _payId;
    }

    public Payfort_Response Refund()
    {
        AssignVariables();
        BuildPostData();
        PostData();
        if (!status)
        {
            return obj;
        }
        readVariab = false;
        ReadResponse();
        if (!status && !readVariab)
        {
            return obj;
        }
        SaveTransaction();
        return obj;
    }

    void AssignVariables()
    {
        pspid = GetPSPID();
        userId = GetUserId();
        pwd = GetPassword();
        operation = GetOperType("refund");
        postUrl = GetRefundUrl();
        obj = new Payfort_Response { Status = false };
        amnt = 0;
        if (basketHelper.hotelDetails != null && basketHelper.hotelDetails.Count > 0)
        {
            foreach (var x in basketHelper.hotelDetails)
            {
                amnt += double.Parse(x.totalPrice.ToString());
            }
        }
        if (basketHelper.packageDetails != null && basketHelper.packageDetails.Count > 0)
        {
            foreach (var x in basketHelper.packageDetails)
            {
                amnt += double.Parse(x.TotalPrice.ToString());
            }
        }
        samnt = amnt.ToString().Split('.')[0].ToString();
        obj.TotalRefundAmount = samnt;
        samnt = (int.Parse(samnt) * 100).ToString();
    }

    void BuildPostData()
    {
        data = "PSPID={0}&USERID={1}&PSWD={2}&PAYID={3}&AMOUNT={4}&OPERATION={5}";
        data = string.Format(data, pspid, userId, pwd, payId, samnt, operation);
    }

    void PostData()
    {
        status = true;
        try
        {
            request = WebRequest.Create(postUrl);
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
            obj.Status = false;
            obj.ErrorMessage = e.Message;
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
                message = "Successfully charged";
                return;
            }
            message = "Please enter SMS code in below text box.";
        }
        catch (Exception e)
        {
            obj.Status = false;
            obj.ErrorMessage = e.Message;
            status = false;
            message = e.Message;
        }
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
        pgTrans.Field3 = paySubId;
        pgTrans.UserId = CurrentUser.Id();
        pgTrans.RefundAmount = amnt;
        pgTrans.ResponseRefundAmount = respAmnt;
        _entity.AddToPGTransactions(pgTrans);
        _entity.SaveChanges();
        obj.Status = status;
    }

    void ReadVariables()
    {
        responseErrorDes = ncresponseTag.Attributes["NCERRORPLUS"].Value;
        responseStatus = ncresponseTag.Attributes["STATUS"].Value;
        ncStatus = ncresponseTag.Attributes["NCSTATUS"].Value;
        ncError = ncresponseTag.Attributes["NCERROR"].Value;
        acceptenceCode = ncresponseTag.Attributes["ACCEPTANCE"].Value;
        payId = ncresponseTag.Attributes["PAYID"].Value;
        paySubId = ncresponseTag.Attributes["PAYIDSUB"].Value;
        respAmnt = 0;
        if (ncresponseTag.Attributes["amount"] != null && ncresponseTag.Attributes["amount"].Value != null && ncresponseTag.Attributes["amount"].Value != "")
        {
            respAmnt = double.Parse(ncresponseTag.Attributes["amount"].Value);
        }
        obj.Acceptence = acceptenceCode;
        obj.PayId = payId;
        obj.OrderId = orderId;
        obj.Xml = ncresponseTag.ToString();
        obj.PayIdSub = paySubId;
        readVariab = true;
    }
}