using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

/// <summary>
/// Summary description for BasketWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class BasketWebService : System.Web.Services.WebService {

    public BasketWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string RemoveItem(string id)
    {
        var basketHelper = (BasketHelper)(Session["Basket"]);
        var hasBasketItems = false;
        var count = 0;
        if (basketHelper != null && basketHelper.hotelDetails != null)
        {
            var hotelDetail = basketHelper.hotelDetails.Where(x => x.hotelInfoId == long.Parse(id)).FirstOrDefault();
            if (hotelDetail != null)
            {
                basketHelper.hotelDetails.Remove(hotelDetail);
            }
            count = basketHelper.hotelDetails.Count;
            hasBasketItems = count != 0;
        }
        return hasBasketItems.ToString() + "#" + count.ToString();
    }
    
}
