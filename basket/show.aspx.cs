﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class basket_show : PublicApplicationPage
{
    public BasketHelper basketHelper;
    protected void Page_Load(object sender, EventArgs e)
    {
        basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(CurrentUser.GetRootPath("home.aspx"));
        }
        rptrHotels.DataSource = basketHelper.hotelDetails;
        rptrHotels.DataBind();
    }
}