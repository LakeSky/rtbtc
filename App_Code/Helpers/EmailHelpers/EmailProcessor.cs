using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using notifier;

public class EmailProcessor
{
    public static void Create(meis007Entities _meis007Entities, string type, object obj, string field1 = "", string field2 = "")
    {
        CommunicationChannel ch = new CommunicationChannel();
        switch (type)
        {
            case "bookingConfirmed":
                var bkg = (BkgMaster)(obj);
                SendBookingConfirmedMail(_meis007Entities, bkg, field1, field2);
                break;
            case "bookingCancelled":
                var bk = (BkgMaster)(obj);
                SendBookingCancelledMail(_meis007Entities, bk, field1, field2);
                break;
        }
    }

    public static void SendBookingConfirmedMail(meis007Entities _meis007Entities, BkgMaster bkg, string serviceName, string paxName)
    {
        CommunicationChannel ch = new CommunicationChannel();
        var customerId = DbParameter.GetCustomerId();
        var user = DbParameter.GetInternalCnsultant(_meis007Entities);
        var name = string.Empty;
        var body = string.Empty;
        var id = long.Parse(bkg.ProductID.ToString());
        if(serviceName == "hotel"){
            name =  _meis007Entities.ProductMasters.Where(x => x.ProductID == id).First().ProductName;
        }
        else
        {
            name = _meis007Entities.PackageHeaders.Where(x => x.PacId == id).First().PacName;
        }
        body += "Booking Confirmed for Service Name ";
        body += name;
        body += ". Pax Name is " + paxName;
        body += ". Customer ID is " + customerId;
        body += ". Client ID is " + bkg.UserID.ToString();
        if (serviceName == "hotel")
        {
           body += ". Suplier Name is " +  DbParameter.GetSupplierName(bkg.SupplierID.ToString());
        }
        ch.Create(bkg.BkgID, user.emailID, "E", body, "BOOKED NEW", string.Empty, string.Empty, string.Empty);
    }

    public static void SendBookingCancelledMail(meis007Entities _meis007Entities, BkgMaster bkg, string serviceName, string paxName)
    {
        CommunicationChannel ch = new CommunicationChannel();
        var customerId = DbParameter.GetCustomerId();
        var user = DbParameter.GetInternalCnsultant(_meis007Entities);
        var name = string.Empty;
        var body = string.Empty;
        var id = long.Parse(bkg.ProductID.ToString());
        if (serviceName == "hotel")
        {
            name = _meis007Entities.ProductMasters.Where(x => x.ProductID == id).First().ProductName;
        }
        else
        {
            name = _meis007Entities.PackageHeaders.Where(x => x.PacId == id).First().PacName;
        }
        body += "Booking Cancelled for Service Name ";
        body += name;
        body += ". Customer ID is " + customerId;
        body += ". Client ID is " + bkg.UserID.ToString();
        if (serviceName == "hotel")
        {
            body += ". Suplier Name is " + DbParameter.GetSupplierName(bkg.SupplierID.ToString());
        }
        ch.Create(bkg.BkgID, user.emailID, "E", body, "CANCELLED - CONFIRMED BKG", string.Empty, string.Empty, string.Empty);
    }
}