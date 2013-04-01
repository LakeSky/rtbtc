using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Hotels_Details : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    public ProductMaster productMaster;
    public string address;
    public string cityName;
    public string countryName;
    public string latitude;
    public string longitude;
    public string hotelName;
    public string starsImagePath;
    protected void Page_Load(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var id = (string)(Request.QueryString["id"]);
        var found = false;
        if (id != null){
            var productId = int.Parse(id);
            productMaster = _meis007Entities.ProductMasters.Where(x => x.ProductID == productId).FirstOrDefault();
            if (productMaster != null){
                cityName = QueryHelper.GetCityName(_meis007Entities, productMaster.CityID);
                countryName = QueryHelper.GetCountryName(_meis007Entities, productMaster.CountryID);
                address = productMaster.Address;
                latitude = string.IsNullOrEmpty(productMaster.Latitude) ? "24.711666" : productMaster.Latitude;
                longitude = string.IsNullOrEmpty(productMaster.Longitude) ? "46.724166" : productMaster.Longitude;
                hotelName = productMaster.ProductName;
                if (productMaster.ClsID == null){
                    var classification = _meis007Entities.Classifications.Where(x => x.ClsName == "1").First();
                    starsImagePath = classification.ImagePath;
                }else {
                    starsImagePath = productMaster.Classification.ImagePath;
                }
                found = true;
            }
        }
        if (!found) {
            Session["ErrorMessage"] = "Hotel not found";
            Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
            return;
        }
    }
}