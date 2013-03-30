using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PublicApplicationPage
/// </summary>
public class PublicApplicationPage : System.Web.UI.Page
{
    protected ShoppingHelper GetShoppingHelperObject(bool return_new = false)
    {
        var shoppingHelper = (ShoppingHelper)(Session["StoredShopping"]);
        if (shoppingHelper == null && return_new) { 
            return new ShoppingHelper();
        }
        return (ShoppingHelper)(Session["StoredShopping"]);
    }
}