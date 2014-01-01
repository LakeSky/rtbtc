using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using meis007Model;
using System.Web.Script.Services;

/// <summary>
/// Summary description for ViewHelperWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ViewHelperWebService : System.Web.Services.WebService {

    public ViewHelperWebService () {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<FormattedClass> CitySearch(string q)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        var data = from city in _meis007Entities.CityMasters join country in _meis007Entities.CountryMasters on city.CountryID equals country.CountryID where city.CityName.Contains(q) select new { text = city.CityName + ", " + country.CountryName, Id = city.CityID };
        var list = new List<FormattedClass>();
        FormattedClass obj;
        foreach (var x in data)
        {
            obj = new FormattedClass { Id = x.Id, Text = x.text };
            list.Add(obj);
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<FormattedClass> AmadeusSearch(string q)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        var data = _meis007Entities.AmadeusTables.Where(x => x.CityName.Contains(q)).ToList();
        var list = new List<FormattedClass>();
        FormattedClass obj;
        foreach (var x in data)
        {
            obj = new FormattedClass { Id = x.AirportCode, Text = x.CityName + " - " + x.StateName + " - " + x.CountryName };
            list.Add(obj);
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<FormattedClass> HotelSearch(string q, string cityId)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        var serviceId = DbParameter.GetServiceId("HOTELS");
        var data = _meis007Entities.ProductMasters.Where(x => x.ServiceID == serviceId && x.CityID == cityId && x.ProductName.Contains(q)).ToList();
        var list = new List<FormattedClass>();
        FormattedClass obj;
        foreach (var x in data)
        {
            obj = new FormattedClass { Id = x.ProductID.ToString(), Text = x.ProductName };
            list.Add(obj);
        }
        return list;
    }
}

public class FormattedClass {
    public string Id { get; set; }
    public string Text { get; set; }
}
