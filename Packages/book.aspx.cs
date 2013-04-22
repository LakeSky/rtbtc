using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Packages_book : PublicApplicationPage
{
    meis007Entities _meis007Entities;
    public PackageHeader packageHeader;
    public string minDate;
    public string maxDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        long id;
        if (Request.QueryString["id"] == null || !long.TryParse(Request.QueryString["id"], out id))
        {
            Redirect();
            return;
        }
        _meis007Entities = new meis007Entities();
        packageHeader = _meis007Entities.PackageHeaders.Where(x => x.PacId == id && x.InService == true).FirstOrDefault();
        if (packageHeader == null)
        {
            Redirect();
            return;
        }
        minDate = packageHeader.Validfrom.ToString("dd-MM-yyyy");
        maxDate = packageHeader.Validto.ToString("dd-MM-yyyy");
        hdnFldPackageId.Value = id.ToString();
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

    protected void Redirect()
    {
        Session["ErrorMessage"] = "You are not authorized to access that package!";
        Response.Redirect(Route.GetRootPath("packages/index.aspx"));
    }
}