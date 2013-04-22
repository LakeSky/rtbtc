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

public partial class Orders_checkout : PublicApplicationPage
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
       basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(CurrentUser.GetRootPath("home.aspx"));
        }
        _meis007Entities = new meis007Entities();
        var userId = CurrentUser.Id();
        var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId).OrderBy(x => x.CustomerSno).First();
        txtFirstName.Text = data.PaxFirstName;
        txtMiddleName.Text = data.PaxMiddleName;
        txtLastName.Text = data.PaxLastName;
        txtMobile.Text = data.B2CCustomerinfo.PaxmobileNo;
        txtTelephone.Text = data.B2CCustomerinfo.PaxTelNo;
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        SuppliersHotelsInfo suppliersHotelsInfo;
        basketHelper = GetBasketHelperObject();
        //basketHelper.hotelDetails.ForEach
        foreach (var x in basketHelper.hotelDetails) {
            if (DbParameter.IsInetrnalSupplier(x.supplierId)) { 
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                //CreateBooking(x, suppliersHotelsInfo);
            }
        }
    }

    protected void CreateBooking(BasketHotelDetails x, SuppliersHotelsInfo suppliersHotelsInfo) {
        BookingDetails bookingInfo = new BookingDetails();
        bookingInfo.CheckIn = x.fromDate;
        bookingInfo.CheckOut = x.toDate;
        bookingInfo.AdultNum = x.guestDetails.Where(y => y.type == "Adult").Count();
        bookingInfo.ChildNum = x.guestDetails.Where(y => y.type == "Kid").Count();
        bookingInfo.ChildAges = x.guestDetails.Where(y => y.type == "Kid").Select(y => int.Parse(y.age)).ToArray();
        bookingInfo.AgentNumber = "1";
        bookingInfo.FirstName = txtFirstName.Text;
        bookingInfo.MiddleName = txtMiddleName.Text;
        bookingInfo.LastName = txtLastName.Text;
        bookingInfo.MobilePhone = txtMobile.Text;
        bookingInfo.HomePhone = txtTelephone.Text;
        bookingInfo.HotelId = int.Parse(suppliersHotelsInfo.HotelID.ToString());
        bookingInfo.RoomId = int.Parse(suppliersHotelsInfo.RoomID.ToString());
        bookingInfo.RoomTypeId = int.Parse(suppliersHotelsInfo.RoomTypeID.ToString());
        bookingInfo.Supplier = DbParameter.GetSupplierName(suppliersHotelsInfo.SupplierID);
        bookingInfo.IsAvailable = true;
        bookingInfo.RequestedPrice = decimal.Parse(suppliersHotelsInfo.LCAP.ToString());
        bookingInfo.DeltaPrice = 1;
        //bookingInfo.Currency = suppliersHotelsInfo.CurrencyCode;
        bookingInfo.SessionId = suppliersHotelsInfo.SessionID;
        bookingInfo.SearchId = int.Parse(suppliersHotelsInfo.SearchID.ToString());
        bookingInfo.SupplierId = suppliersHotelsInfo.SupplierID;
        //bookingInfo.CustomerId = "1015"; //DbParameter.GetCustomerId();
        bookingInfo.HotelInfoId = 1;
        //RepositoryFactory supplierFactory = new RepositoryFactory();
        //supplierFactory.HotelRoomBooking(bookingInfo);
    }
}