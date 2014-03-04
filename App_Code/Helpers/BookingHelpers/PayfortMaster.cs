using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

public class PayfortMaster : PublicApplicationPage
{
	public PayfortMaster()
	{

	}

    protected string GetPSPID()
    {
        return ConfigurationManager.AppSettings["PSPID"];
    }

    protected string GetUserId()
    {
        return ConfigurationManager.AppSettings["API_USERID"];
    }

    protected string GetPassword()
    {
        return ConfigurationManager.AppSettings["API_PWD"];
    }

    protected string GetOperType(string type)
    {
        var oper = string.Empty;
        if (type == "sale")
        {
          oper = ConfigurationManager.AppSettings["SALE_OPERATION"];
        }
        else if (type == "refund")
        {
            oper = ConfigurationManager.AppSettings["REFUND_OPERATION"];
        }
        return oper;
    }

    protected string GetDirectLinkUrl()
    {
        return ConfigurationManager.AppSettings["DIRECT_LINK_URL"];
    }

    protected string GetRefundUrl()
    {
        return ConfigurationManager.AppSettings["REFUND_LINK_URL"];
    }

}