using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using RTCDataModel.RTCEntities;
using RTCModel.Models;
using RTCEntities.ENUMS;
using System.Data;
using System.Globalization;
using System.Configuration;

public partial class Orders_checkout : PaymentGatewayHelper
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    public List<TextValue> monthsList;
    public List<TextValue> yearList;
    TextValue textValObj;
    protected void Page_Load(object sender, EventArgs e)
    {
        basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper))
        {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(Route.GetRootPath("home.aspx"));
            return;
        }
        if (!IsPostBack)
        {
            BuildInitialVariables();
            btnConfirmOrder.PostBackUrl = AliasUrl();
            BuildDDLExpirationMonths(_meis007Entities);
            BuildDDLExpirationYear(_meis007Entities);
        }
    }

    private void BindCategories(object sender, EventArgs e)
    {
    }

    protected void BuildDDLExpirationMonths(meis007Entities _meis007Entities)
    {
        monthsList = new List<TextValue>();
        var months = CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames;
        for (int i = 0; i < 12; i++)
        {
            textValObj = new TextValue
            {
                Text = months[i],
                Value = (i + 1).ToString().PadLeft(2, '0')
            };
            monthsList.Add(textValObj);
        }
    }

    protected void BuildDDLExpirationYear(meis007Entities _meis007Entities)
    {
        yearList = new List<TextValue>();
        var startYear = DateTime.Now.Year;
        var endYear = DateTime.Now.Year + 5;
        for (int i = startYear; i <= endYear; i++)
        {
            textValObj = new TextValue
            {
                Text = i.ToString(),
                Value = i.ToString()
            };
            yearList.Add(textValObj);
        }
    }

    protected void ShowError(string message)
    {
        Session["ErrorMessage"] = message;
    }
}