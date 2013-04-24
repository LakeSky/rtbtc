using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class basket_show : PublicApplicationPage
{
    public BasketHelper basketHelper;
    public decimal totalPrice;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
        }
        rptrHotels.DataSource = basketHelper.hotelDetails;
        rptrHotels.DataBind();
        rptrPackages.DataSource = basketHelper.packageDetails;
        rptrPackages.DataBind();
        basketHelper.calculateTotalPrice();
        totalPrice = basketHelper.totalPrice;
    }
}