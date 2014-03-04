using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using meis007Model;

public class PayfortMaster : PublicApplicationPage
{
    protected WebRequest request;
    protected Stream dataStream;
    protected WebResponse webResponse;
    protected StreamReader reader;
    protected XmlDocument xml;
    protected XmlNodeList xmlResponse, htmlResponse;
    protected XmlNode ncresponseTag;
    protected Payfort_Response obj, objRefund;
    protected BasketHelper basketHelper, _createBookingBasket;
    protected CreateBooking _createBooking;
    protected PGTransaction pgTrans;
    protected RefundBooking rfndObj;
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