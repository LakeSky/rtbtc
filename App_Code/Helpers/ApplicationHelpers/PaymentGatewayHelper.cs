using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;


public class PaymentGatewayHelper : PublicApplicationPage
{
    protected Payfort_Response obj;
    public string orderId, sha, pspId, acceptUrl, exceptionUrl, passPhrase, aliasUrl, errorMessage;
    protected void BuildInitialVariables()
    {
        obj = Session["Payfort_Response"] as Payfort_Response;
        if (obj != null)
        {
            orderId = obj.OrderId;
            errorMessage = obj.ErrorMessage;
            Session["Payfort_Response"] = null;
        }
        else
        {
            orderId = GetOrderId();
        }
        acceptUrl = GetSuccessUrl();
        exceptionUrl = GetErrorUrl();
        passPhrase = ConfigurationManager.AppSettings["PASS_PHRASE"];
        pspId = ConfigurationManager.AppSettings["PSPID"];
        aliasUrl = ConfigurationManager.AppSettings["ALIAS_URL"];
        string data = "ACCEPTURL=" + acceptUrl + passPhrase + "EXCEPTIONURL=" + exceptionUrl + passPhrase + "ORDERID=" + orderId
          + passPhrase + "PSPID=" + pspId + passPhrase;
        sha = GetHashString(data);
    }

    byte[] GetHash(string inputString)
    {
        HashAlgorithm algorithm = SHA1.Create();
        return algorithm.ComputeHash(Encoding.UTF8.GetBytes(inputString));
    }

    string GetHashString(string inputString)
    {
        StringBuilder sb = new StringBuilder();
        foreach (byte b in GetHash(inputString))
            sb.Append(b.ToString("X2"));

        return sb.ToString();
    }

    string GetOrderId()
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, 5)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());
        return result;
    }

    string GetBaseUrl()
    {
        return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath;
    }

    string GetSuccessUrl()
    {
        //return GetBaseUrl() + "/success.aspx";
        return GetBaseUrl() + "/sms.aspx";
    }

    string GetErrorUrl()
    {
        return GetBaseUrl() + "/error.aspx";
    }
}