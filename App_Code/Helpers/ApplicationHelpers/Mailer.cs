using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using meis007Model;

public class Mailer
{
    public static void SendMailMessage(string to, string bcc, string cc, string subject, string body)
    {
 
        MailMessage mMailMessage = new MailMessage();
        mMailMessage.From = new MailAddress("noreply@riyadhtravel.com.sa");
        mMailMessage.To.Add(new MailAddress(to));
        if ((bcc != null) && (bcc != string.Empty))
        {
            mMailMessage.Bcc.Add(new MailAddress(bcc));
        }
        if ((cc != null) && (cc != string.Empty))
        {
         
            mMailMessage.CC.Add(new MailAddress(cc));
        }
        mMailMessage.Subject = subject;
        mMailMessage.Body = body;
        mMailMessage.IsBodyHtml = true;
        mMailMessage.Priority = MailPriority.Normal;
        SmtpClient mSmtpClient = new SmtpClient {
               Host = "smtp.gmail.com",
               Port = 587,
               EnableSsl = true,
               DeliveryMethod = SmtpDeliveryMethod.Network,
               UseDefaultCredentials = false,
               Credentials = new NetworkCredential("rayssyteminfo@gmail.com", "samsungs4")
           };
        mSmtpClient.Send(mMailMessage);
    }

    public static void SendRegistrationEmail(B2CCustomerinfo _B2CCustomerinfo, string host) {
        var href = host + Route.GetRootPath("/account/confirm.aspx?id=" + _B2CCustomerinfo.authenicationcode);
        var body = "Hi " + _B2CCustomerinfo.PaxFirstName + "<br/>. Please <a href='"+href+"'>Confirm Account</a>";
        SendMailMessage(_B2CCustomerinfo.PaxEmail, "", "", "Confirm Account", body);
    }

    public static void SendPasswordEmail(B2CCustomerinfo _B2CCustomerinfo, string host){
        var href = host + Route.GetRootPath("/account/login.aspx");
        string _decryptPassword = StringHelper.Decrypt(_B2CCustomerinfo.PaxPassword);
        var body = "Hi " + _B2CCustomerinfo.PaxFirstName + " your password is "+_decryptPassword  +"<br/>. <a href='" + href + "'>Login</a>";
        SendMailMessage(_B2CCustomerinfo.PaxEmail, "", "", "Password", body);
    }

    public static void SendBookingFailedEmail(BasketHelper basket, Payfort_Response obj)
    {
        var email = "ubaidkhan88@gmail.com"; //DbParameter.GetManagerEmail();
        var body = BuildBookingFailedText(basket, obj);
        SendMailMessage(email, "", "", "Booking Error", body);
    }

    public static void SendBookingSuccessEmail(BasketHelper basket, Payfort_Response obj)
    {
        var email = "ubaidkhan88@gmail.com";//DbParameter.GetManagerEmail();
        var body = BuildBookingSuccessText(basket, obj);
        SendMailMessage(email, "", "", "Booking Success", body);
    }

    public static void SendRefundSuccessEmail(BasketHelper basket, Payfort_Response obj)
    {
        var email = "ubaidkhan88@gmail.com"; //DbParameter.GetManagerEmail();
        var body = BuildRefundSuccessText(basket, obj);
        SendMailMessage(email, "", "", "Refund Success", body);
    }

    public static void SendRefundFailedEmail(BasketHelper basket, Payfort_Response obj)
    {
        var email = "ubaidkhan88@gmail.com"; //DbParameter.GetManagerEmail();
        var body = BuildRefundFailedText(basket, obj);
        SendMailMessage(email, "", "", "Refund Failed", body);
    }

    static string BuildBookingFailedText(BasketHelper basket, Payfort_Response obj)
    {
        var text = string.Empty;
        text += "Unable to do bookings with BASKET ID as " + basket.BasketSequenceNumber;
        text += "\n";
        text += "Payfort PAYID is " + obj.PayId + " ACCEPTANCE CODE is "  + obj.Acceptence + " ORDER ID is " + obj.OrderId ;
        text += "\n";
        if(basket.hotelDetails != null && basket.hotelDetails.Count > 0)
        {
            text += "Following are the hotels for which bookings failed:";
            text += "\n";
            foreach (var x in basket.hotelDetails)
            {
                text += ("Hotel Info ID: " + x.hotelInfoId + " Supplier: " + x.SupplierName + " Session ID: " + x.sessionId);
                text += "\n";
            }
        }
        if (basket.packageDetails != null && basket.packageDetails.Count > 0)
        {
            text += "Following are the packages for which bookings failed:";
            text += "\n";
            foreach (var x in basket.packageDetails)
            {
                text += ("Package ID: " + x.PackageId + " Package Name: " + x.PackageName);
                text += "\n";
            }
        }
        return text;
    }

    static string BuildBookingSuccessText(BasketHelper basket, Payfort_Response obj)
    {
        var text = string.Empty;
        text += ("Successfully done Bookings with BASKET ID as " + basket.BasketSequenceNumber);
        text += "\n";
        text += "Payfort PAYID is " + obj.PayId + " ACCEPTANCE CODE is " + obj.Acceptence + " ORDER ID is " + obj.OrderId;
        text += "\n";
        return text;
    }

    static string BuildRefundFailedText(BasketHelper basket, Payfort_Response obj)
    {
        var text = string.Empty;
        text += "Unable to do refund with BASKET ID as " + basket.BasketSequenceNumber;
        text += "\n";
        text += "Total Amount: " + obj.TotalAmount + " To be Refund Amount " + obj.TotalRefundAmount;
        text += "\n";
        if (basket.hotelDetails != null && basket.hotelDetails.Count > 0)
        {
            text += "Following are the hotels for which refund failed:";
            text += "\n";
            foreach (var x in basket.hotelDetails)
            {
                text += ("Hotel Info ID: " + x.hotelInfoId + " Supplier: " + x.SupplierName + " Session ID: " + x.sessionId);
                text += "\n";
            }
        }
        if (basket.packageDetails != null && basket.packageDetails.Count > 0)
        {
            text += "Following are the packages for which refund failed:";
            text += "\n";
            foreach (var x in basket.packageDetails)
            {
                text += ("Package ID: " + x.PackageId + " Package Name: " + x.PackageName);
                text += "\n";
            }
        }
        return text;
    }

    static string BuildRefundSuccessText(BasketHelper basket, Payfort_Response obj)
    {
        var text = string.Empty;
        text += "Refund Success with BASKET ID as " + basket.BasketSequenceNumber;
        text += "\n";
        text += "Total Amount: " + obj.TotalAmount + " Refunded Amount " + obj.TotalRefundAmount;
        text += "\n";
        text += "Payfort PAYID is " + obj.PayId + " ACCEPTANCE CODE is " + obj.Acceptence + " ORDER ID is " + obj.OrderId;
        text += "\n";
        if (basket.hotelDetails != null && basket.hotelDetails.Count > 0)
        {
            text += "Following are the hotels for which refund is done:";
            text += "\n";
            foreach (var x in basket.hotelDetails)
            {
                text += ("Hotel Info ID: " + x.hotelInfoId + " Supplier: " + x.SupplierName + " Session ID: " + x.sessionId);
                text += "\n";
            }
        }
        if (basket.packageDetails != null && basket.packageDetails.Count > 0)
        {
            text += "Following are the packages for which refund is done:";
            text += "\n";
            foreach (var x in basket.packageDetails)
            {
                text += ("Package ID: " + x.PackageId + " Package Name: " + x.PackageName);
                text += "\n";
            }
        }
        return text;
    }
}