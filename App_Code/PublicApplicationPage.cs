using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Dynamic;

/// <summary>
/// Summary description for PublicApplicationPage
/// </summary>
public class PublicApplicationPage : System.Web.UI.Page
{

    protected int? CheckAndGetCurrentUserId() {
        if (!User.Identity.IsAuthenticated) {
            return null;
        }
        return CurrentUser.Id();
    }

    protected ShoppingHelper GetShoppingHelperObject(bool returnNew = false)
    {
        var shoppingHelper = (ShoppingHelper)(Session["StoredShopping"]);
        if (shoppingHelper == null && returnNew) { 
            return new ShoppingHelper();
        }
        return (ShoppingHelper)(Session["StoredShopping"]);
    }

    protected dynamic GetShoppingHotelDetailsObject()
    {
        dynamic expando = new ExpandoObject();
        var shoppingHelper = GetShoppingHelperObject();
        if (shoppingHelper == null || shoppingHelper.HotelDetails == null) {
            expando.valid = false;
            return expando;
        }
        expando.valid = true;
        expando.shoppingHotelDetails = shoppingHelper.HotelDetails;
        return expando;
    }

    protected BasketHelper GetBasketHelperObject(bool returnNew = false) {
        var basketHelper = (BasketHelper)(Session["Basket"]);
        if (basketHelper == null && returnNew) {
            return new BasketHelper();
        }
        return basketHelper;
    }

    protected bool hasBasketItems(BasketHelper basketHelper){
        if (basketHelper == null) {
            return false;
        }
        return countHotelsInBasket(basketHelper) > 0;
    }

    protected bool hasHotelsInBasket(BasketHelper basketHelper){
        if (basketHelper == null){
            return false;
        }
        return countHotelsInBasket(basketHelper) > 0;
    }

    protected int countHotelsInBasket(BasketHelper basketHelper) {
        return basketHelper.hotelDetails.Count;
    }

    protected void DisposeHotelDetails(){
        var shoppingHelper = GetShoppingHelperObject();
        shoppingHelper.HotelDetails = null;
        Session["StoredShopping"] = shoppingHelper;
    }

}