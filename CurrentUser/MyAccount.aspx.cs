using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Account_MyAccount : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    public B2CCustomerinfo b2CCustomerinfo;
    public string cityName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated) {
            Session["ErrorMessage"] = "Please login!";
            Response.Redirect("Login.aspx");
        }
        _meis007Entities = new meis007Entities();
        var _currentUserId = CurrentUser.Id();
        b2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First();
        var city = _meis007Entities.CityMasters.Where(x => x.CityID == b2CCustomerinfo.PaxCity).FirstOrDefault();
        cityName = "";
        if (city != null) {
            cityName = city.CityName;
        }
    }
}