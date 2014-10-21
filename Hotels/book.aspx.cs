using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Hotels_book : PublicApplicationPage
{
    meis007Entities _meis007Entities;
    ShoppingHelper _shoppingHelper;
    BookingHotelDetails bookingHotelDetails;
    BasketObjectHelper basketObjectHelper;
    BasketHelper basketHelper;
    DisplayCancellationPolicy _objCanPolicy;
    List<long> _lstHotelInfoIds;
    List<DisplayCancellationPolicy> _lstCanPolicies;
    long supplierHotelInfoId;
    string masterCurrencyValue, returnUrl;
    bool valid;
    public bool loggedIn;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        if (!IsPostBack)
        {
            _shoppingHelper = GetShoppingHelperObject();
            if (_shoppingHelper == null || _shoppingHelper.HotelDetails == null)
            {
                Redirect("Please select hotel first!", Route.GetRootPath("home.aspx"));
                return;
            }

            valid = true;
            foreach (var x in _shoppingHelper.HotelDetails.RoomDetails)
            {
                if (x.HotelInfoId == null || x.HotelInfoId == 0)
                {
                    valid = false;
                    break;
                }
            }
            if (!valid)
            {
                Redirect("search.aspx", "Please select the rooms first!");
                return;
            }
            supplierHotelInfoId = _shoppingHelper.HotelDetails.RoomDetails.First().HotelInfoId;
            _meis007Entities = new meis007Entities();
            var supplierHotelInfo = _meis007Entities.SuppliersHotelsInfoes.Where(x => x.HotelInfoID == supplierHotelInfoId).FirstOrDefault();
            if (supplierHotelInfo == null)
            {
                Redirect("Sorry but the hotel you selected is not found! ");
                return;
            }
            _lstHotelInfoIds = _shoppingHelper.HotelDetails.RoomDetails.Select(x => x.HotelInfoId).ToList();
            bookingHotelDetails = BookingObjectHelper.GetHotelDetails(_meis007Entities, supplierHotelInfoId, _shoppingHelper, CheckAndGetCurrentUserId());
            AssignDefaultData();
            CheckLoginUser();
            LoginDivVisibility();
        }
    }

    protected void btnAddToBasket_Click(object sender, EventArgs e)
    {
        List<BasketHotelGuestDetails> basketHotelGuestDetailsList = new List<BasketHotelGuestDetails>();
        BasketHotelGuestDetails basketHotelGuestDetails;
        foreach (RepeaterItem item in rptrBookingGuests.Items)
        {
            var ddlTitle = item.FindControl("ddlTitle") as DropDownList;
            var txtFirstName = item.FindControl("txtFirstName") as TextBox;
            var txtMiddleName = item.FindControl("txtMiddleName") as TextBox;
            var txtLastName = item.FindControl("txtLastName") as TextBox;
            var hdnFldType = item.FindControl("hdnFldType") as HiddenField;
            var hdnFldAge = item.FindControl("hdnFldAge") as HiddenField;
            var hdnFldHotelInfoIdP = item.FindControl("hdnFldHotelInfoId") as HiddenField;
            basketHotelGuestDetails = new BasketHotelGuestDetails
            {
                title = ddlTitle.SelectedValue,
                firstName = txtFirstName.Text,
                middleName = txtMiddleName.Text,
                lastName = txtLastName.Text,
                type = hdnFldType.Value,
                age = hdnFldAge.Value
            };
            basketHotelGuestDetails.HotelInfoId = long.Parse(hdnFldHotelInfoIdP.Value);
            basketHotelGuestDetailsList.Add(basketHotelGuestDetails);
        }
        _lstHotelInfoIds = basketHotelGuestDetailsList.Select(x => x.HotelInfoId).Distinct().ToList();
        foreach (var x in _lstHotelInfoIds)
        {
            basketObjectHelper = new BasketObjectHelper();
            basketHelper = GetBasketHelperObject(true);
            Session["Basket"] = basketObjectHelper.CreateBasketHotel(new meis007Entities(), basketHelper, x.ToString(), hdnFldFromDate.Value,
            hdnFldToDate.Value, basketHotelGuestDetailsList.Where(y => y.HotelInfoId == x).ToList());
        }

        Session["NoticeMessage"] = "Succesfully added to the basket!";
        DisposeHotelDetails();
        Response.Redirect(Route.GetRootPath("home.aspx"));
    }

    public void rptrBookingGuests_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        var x = e.Item.ItemType;
        var y = e.Item.DataItem;
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var dropDown = e.Item.FindControl("ddlTitle") as DropDownList;
            if (((BookingGuestDetails)e.Item.DataItem).type == "Adult")
            {
                dropDown.Items.Remove("Master");
            }
            else if (((BookingGuestDetails)e.Item.DataItem).type == "Kid")
            {
                dropDown.Items.Remove("Mr");
                dropDown.Items.Remove("Mrs");
                dropDown.Items.Remove("Miss");
                dropDown.Items.Remove("Ms");
                dropDown.Items.Remove("Dr");
            }

        }
    }

    void Redirect(string message, string path = null)
    {
        Session["ErrorMessage"] = message;
        path = path == null ? Route.GetRootPath("hotels/search.aspx") : path;
        Response.Redirect(path);
    }

    void AssignDropDown()
    {
        foreach (RepeaterItem item in rptrBookingGuests.Items)
        {
            var hdnFldTitle = item.FindControl("hdnFldTitle") as HiddenField;
            var ddlTitle = item.FindControl("ddlTitle") as DropDownList;
            ddlTitle.SelectedValue = hdnFldTitle.Value;
        }
    }

    void AssignDefaultData()
    {
        lblTotalPrice.Text =
               ApplicationObject.GetMasterCurrency(masterCurrencyValue) + " " +
                ApplicationObject.FormattedCurrencyDisplayPrice(bookingHotelDetails.totalPrice, masterCurrencyValue);
        lblStay.Text = bookingHotelDetails.stay;
        lblRoom.Text = bookingHotelDetails.room;
        lblGuest.Text = bookingHotelDetails.guests;
        imgDefault.Src = bookingHotelDetails.productDefaultImagePath;
        imgStars.Src = bookingHotelDetails.productStarsImagePath;
        lblPricePerPerson.Text =
            ApplicationObject.GetMasterCurrency(masterCurrencyValue) + " " +
            ApplicationObject.FormattedCurrencyDisplayPrice(bookingHotelDetails.totalPrice, masterCurrencyValue);
        lblProductName.Text = bookingHotelDetails.productName;
        lblCityName.Text = bookingHotelDetails.cityName;
        hdnFldHotelInfoId.Value = bookingHotelDetails.hotelInfoId.ToString();
        hdnFldFromDate.Value = bookingHotelDetails.fromDate.ToString("dd-MM-yyyy");
        hdnFldToDate.Value = bookingHotelDetails.toDate.ToString("dd-MM-yyyy");
        rptrBookingGuests.DataSource = bookingHotelDetails.guestDetails;
        rptrBookingGuests.DataBind();
        AssignDropDown();
        BindCancelPolicies();
    }

    void CheckLoginUser()
    {
        loggedIn = User.Identity.IsAuthenticated;
    }

    void LoginDivVisibility()
    {
        divLogIn.Visible = !loggedIn;
        if (loggedIn)
        {
            return;
        }
        returnUrl = Route.GetRootPath("hotels/book.aspx");
        ancExistingAcnt.HRef = Route.GetRootPath("account/login.aspx?ReturnUrl=" + returnUrl);
        ancNewAcnt.HRef = Route.GetRootPath("account/register.aspx?ReturnUrl=" + returnUrl);
    }

    void BindCancelPolicies()
    {
        _lstCanPolicies = new List<DisplayCancellationPolicy>();
        foreach (var x in _lstHotelInfoIds)
        {
            _objCanPolicy = new DisplayCancellationPolicy();
            _objCanPolicy.RoomName = _shoppingHelper.HotelDetails.RoomDetails.Where(y => y.HotelInfoId == x).First().RoomName;
            _objCanPolicy.CancellationPolicies =
                CancellationPolicyHelper.GetCancelPolicies(x.ToString(), bookingHotelDetails.SupplierName, bookingHotelDetails.fromDate.ToString(), bookingHotelDetails.toDate.ToString());
            _lstCanPolicies.Add(_objCanPolicy);
        }
        rptrCancelPolicies.DataSource = _lstCanPolicies;
        rptrCancelPolicies.DataBind();
    }

}