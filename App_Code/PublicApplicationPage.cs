using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PublicApplicationPage
/// </summary>
public class PublicApplicationPage : System.Web.UI.Page
{
    protected ShoppingHelper GetShoppingHelperObject(bool returnNew = false)
    {
        var shoppingHelper = (ShoppingHelper)(Session["StoredShopping"]);
        if (shoppingHelper == null && returnNew) { 
            return new ShoppingHelper();
        }
        return (ShoppingHelper)(Session["StoredShopping"]);
    }

    protected BasketHelper GetBasketHelperObject(bool returnNew = false) {
        var basketHelper = (BasketHelper)(Session["Basket"]);
        if (basketHelper == null && returnNew) {
            return new BasketHelper();
        }
        return basketHelper;
    }

    protected void DisposeHotelDetails() {
        var shoppingHelper = GetShoppingHelperObject();
        shoppingHelper.HotelDetails = null;
        Session["StoredShopping"] = shoppingHelper;
    }

}