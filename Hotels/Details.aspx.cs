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
    public string cityName;
    public string countryName;
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