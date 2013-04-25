using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using meis007Model;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class ApplicationWebService : System.Web.Services.WebService {

    public ApplicationWebService () {
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<FormattedClass> SearchBooking(string q)
    {
        var userId = CurrentUser.Id();
        meis007Entities _meis007Entities = new meis007Entities();
        _meis007Entities = new meis007Entities();
        var data = from pm in _meis007Entities.ProductMasters
                   join bm in _meis007Entities.BkgMasters
                   on pm.ProductID equals bm.ProductID
                   where bm.ProductID != null && bm.CustConsultantID == userId && pm.ProductName.Contains(q)
                   orderby bm.BkgID descending
                   select new { bookingId = bm.BkgID, HotelName = pm.ProductName, BookingDate = bm.BkgDate };
        var list = new List<FormattedClass>();
        FormattedClass obj;
        foreach (var x in data)
        {
            obj = new FormattedClass { Id = x.bookingId.ToString(), Text = x.HotelName + " " + DateTimeHelper.ConvertToString(x.BookingDate.ToString()) };
            list.Add(obj);
        }
        return list;
    }
    
}
