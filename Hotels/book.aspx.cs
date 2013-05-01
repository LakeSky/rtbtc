﻿using System;
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
    public BookingHotelDetails bookingHotelDetails;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        if (!IsPostBack){
            _shoppingHelper = GetShoppingHelperObject();
            if (_shoppingHelper == null || _shoppingHelper.HotelDetails == null){
                Redirect("Please select hotel first!", Route.GetRootPath("home.aspx"));
                return;
            }
            string id = (string)Request.QueryString["id"];
            if (string.IsNullOrEmpty(id)){
                Redirect("Please choose hotel and room!");
                return;
            }
            var supplierHotelInfoId = long.Parse(id);
            _meis007Entities = new meis007Entities();
            var supplierHotelInfo = _meis007Entities.SuppliersHotelsInfoes.Where(x => x.HotelInfoID == supplierHotelInfoId).FirstOrDefault();
            if (supplierHotelInfo == null){
                Redirect("Sorry but the hotel you selected is not found! ");
                return;
            }
            bookingHotelDetails = BookingObjectHelper.GetHotelDetails(_meis007Entities, supplierHotelInfoId, _shoppingHelper, CheckAndGetCurrentUserId());
            hdnFldHotelInfoId.Value = bookingHotelDetails.hotelInfoId.ToString();
            hdnFldFromDate.Value = bookingHotelDetails.fromDate.ToString("dd-MM-yyyy");
            hdnFldToDate.Value = bookingHotelDetails.toDate.ToString("dd-MM-yyyy");
            rptrBookingGuests.DataSource = bookingHotelDetails.guestDetails;
            rptrBookingGuests.DataBind();
            AssignDropDown();
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
            basketHotelGuestDetails = new BasketHotelGuestDetails
            {
                title = ddlTitle.SelectedValue,
                firstName = txtFirstName.Text,
                middleName = txtMiddleName.Text,
                lastName = txtLastName.Text,
                type = hdnFldType.Value,
                age = hdnFldAge.Value
            };
            basketHotelGuestDetailsList.Add(basketHotelGuestDetails);
        }
        BasketObjectHelper basketObjectHelper = new BasketObjectHelper();
        var basketHelper = GetBasketHelperObject(true);
        Session["Basket"] = basketObjectHelper.CreateBasketHotel(new meis007Entities(), basketHelper, hdnFldHotelInfoId.Value, hdnFldFromDate.Value, hdnFldToDate.Value, basketHotelGuestDetailsList);
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

    void Redirect(string message, string path = null) {
        Session["ErrorMessage"] = message;
        path = path == null ? Route.GetRootPath("hotels/search.aspx") : path;
        Response.Redirect(path);
    }

    protected void AssignDropDown() {
        foreach (RepeaterItem item in rptrBookingGuests.Items){
            var hdnFldTitle = item.FindControl("hdnFldTitle") as HiddenField;
            var ddlTitle = item.FindControl("ddlTitle") as DropDownList;
            ddlTitle.SelectedValue = hdnFldTitle.Value;
        }
    }
    
}