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
               Port = 25,
               EnableSsl = true,
               DeliveryMethod = SmtpDeliveryMethod.Network,
               UseDefaultCredentials = false,
               Credentials = new NetworkCredential("rayssyteminfo@gmail.com", "samsungs4")
           };
        mSmtpClient.Send(mMailMessage);
    }

    public static void SendRegistrationEmail(B2CCustomerinfo _B2CCustomerinfo, string host) {
        var href = host + CurrentUser.GetRootPath("/Account/Confirm.aspx?id=" + _B2CCustomerinfo.authenicationcode);
        var body = "Hi " + _B2CCustomerinfo.PaxFirstName + "<br/>. Please <a href='"+href+"'>Confirm Account</a>";
        SendMailMessage(_B2CCustomerinfo.PaxEmail, "", "", "Confirm Account", body);
    }

    public static void SendPasswordEmail(B2CCustomerinfo _B2CCustomerinfo, string host){
        var href = host + CurrentUser.GetRootPath("/Account/Login.aspx");
        string _decryptPassword = StringHelper.Decrypt(_B2CCustomerinfo.PaxPassword);
        var body = "Hi " + _B2CCustomerinfo.PaxFirstName + " your password is "+_decryptPassword  +"<br/>. <a href='" + href + "'>Login</a>";
        SendMailMessage(_B2CCustomerinfo.PaxEmail, "", "", "Password", body);
    }
}