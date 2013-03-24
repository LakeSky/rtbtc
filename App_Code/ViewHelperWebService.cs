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
    public List<string> CitySearch(string q)
    {
        meis007Entities _meis007Entities = new meis007Entities();
        var data = from city in _meis007Entities.CityMasters join country in _meis007Entities.CountryMasters on city.CountryID equals country.CountryID where city.CityName.Contains(q) select new { text = city.CityName + ", " + country.CountryName, Id = city.CityID };
        List<string> list = new List<string>();
        foreach (var x in data)
        {
            list.Add(x.text);
        }
        return list;
    }
    
}
