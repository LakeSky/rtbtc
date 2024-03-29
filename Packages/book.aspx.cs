﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Packages_book : PublicApplicationPage
{
    meis007Entities _meis007Entities;
    PackageHeader packageHeader;
    DateTime currentDate;
    public string minDate;
    public string maxDate;
    string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        currentDate = DateTime.Now;
        long id;
        if (Request.QueryString["id"] == null || !long.TryParse(Request.QueryString["id"], out id))
        {
            ErrorRedirect("You are not authorized to access that package!");
            return;
        }
        _entity = GetEntity();
        _meis007Entities = new meis007Entities();
        packageHeader = _meis007Entities.PackageHeaders.Where(x => x.PacId == id && x.InService == true && x.Validto >= currentDate).FirstOrDefault();
        if (packageHeader == null)
        {
            ErrorRedirect("You are not authorized to access that package!");
            return;
        }
        rootPath = Route.GetRootPath("");
        minDate = packageHeader.Validfrom.ToString("dd-MM-yyyy");
        maxDate = packageHeader.Validto.ToString("dd-MM-yyyy");
        hdnFldPackageId.Value = id.ToString();
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        diplayImage.Src = packageHeader.DisplayImage;
        lblPacName.Text = packageHeader.PacName;
        lblPacPrice.Text = "Price Per Person&nbsp;" +
            ApplicationObject.GetMasterCurrency(masterCurrencyValue) + "&nbsp;" +
            ApplicationObject.FormattedCurrencyDisplayPrice(packageHeader.PacValueB2C, masterCurrencyValue);
        lblStartDate.Text = "Package Start Date " + packageHeader.Validfrom.ToString("dd MMM yyyy");
        lblEndDate.Text =  "Package End Date " + packageHeader.Validto.ToString("dd MMM yyyy");
        if (User.Identity.IsAuthenticated)
        {
            divLoggedIn.Visible = true;
            divNotLogin.Visible = false;
        }
        else
        {
            divLoggedIn.Visible = false;
            divNotLogin.Visible = true;
            existinAcnt.HRef = rootPath + "account/login.aspx?bookingtype=package&bookingid=" + id;
            newAcnt.HRef = rootPath + "account/register.aspx?bookingtype=package&bookingeid=" + id;
        }
    }

    protected void btnAddToBasket_Click(object sender, EventArgs e)
    {
        string index = "";
        var totalPassengers = int.Parse(Request.Params["passengers_count"].ToString());
        var parms = Request.Params;
        var packageId = long.Parse(hdnFldPackageId.Value);
        var basketHelper = GetBasketHelperObject(true);
        _meis007Entities = new meis007Entities();
        var packageHeader = _meis007Entities.PackageHeaders.Where(x => x.PacId == packageId).First();
        var basketPackageDetails = new BasketPackageDetails
        {
            Id = basketHelper.GetNextPackageId(),
            PackageId = packageId,
            PackageName = packageHeader.PacName,
            From = DateTimeHelper.customFormat(txtFromDate.Text),
            ValidFrom = packageHeader.Validfrom,
            ValidTo = packageHeader.Validto,
            DisplayImage = packageHeader.DisplayImage
        };
        var basketPackagePassengersDetailsList = new List<BasketPackagePassengersDetails>();
        BasketPackagePassengersDetails basketPackagePassengersDetails;
        for (int i = 0; i < totalPassengers; i++)
        {
            index = (i + 1).ToString();
            basketPackagePassengersDetails = new BasketPackagePassengersDetails();
            basketPackagePassengersDetails.Title = parms["passengers[" + index + "][title]"].ToString();
            basketPackagePassengersDetails.FirstName = parms["passengers[" + index + "][firstname]"].ToString();
            basketPackagePassengersDetails.MiddleName = parms["passengers[" + index + "][middlename]"].ToString();
            basketPackagePassengersDetails.LastName = parms["passengers[" + index + "][lastname]"].ToString();
            basketPackagePassengersDetailsList.Add(basketPackagePassengersDetails);
        }
        basketPackageDetails.Passengers = basketPackagePassengersDetailsList;
        basketPackageDetails.PricePerPerson = double.Parse(packageHeader.PacValueB2C.ToString());
        basketPackageDetails.calculateTotalPrice();
        basketHelper.packageDetails.Add(basketPackageDetails);
        basketHelper.calculateTotalPrice();
        Session["Basket"] = basketHelper;
        Session["NoticeMessage"] = "Successfully added to basket! ";
        Response.Redirect(Route.GetRootPath("packages/index.aspx"));
    }

}