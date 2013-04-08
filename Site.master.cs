using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    public bool hasBasketItems;
    public int basketItemsCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        hasBasketItems = false;
        basketItemsCount = 0;
        var basketHelper = (BasketHelper)(Session["Basket"]);
        if (basketHelper != null && basketHelper.hotelDetails != null && basketHelper.hotelDetails.Count > 0) {
            hasBasketItems = true;
            basketItemsCount = basketHelper.hotelDetails.Count();
        }
    }

}
