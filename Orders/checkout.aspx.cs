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
            Response.Redirect(Route.GetRootPath("home.aspx"));
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
        BkgMaster bkgMaster;
        PaxDetail paxDetail;
        basketHelper = GetBasketHelperObject();
        var hotelsToRemove = new List<BasketHotelDetails>();
        foreach (var x in basketHelper.hotelDetails) {
            if (!DbParameter.IsInetrnalSupplier(x.supplierId)) { 
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                //CreateBooking(x, suppliersHotelsInfo);
                bkgMaster = new BkgMaster { 
                    BasketID = 5,
                    SearchID = int.Parse(suppliersHotelsInfo.SearchID.ToString()),
                    HotelInfoID = suppliersHotelsInfo.HotelInfoID,
                    BkgDate = DateTime.Now,
                    BkgType = "",
                    BkgStatus = "",
                    CustomerID = 1015,
                    //DbParameter.GetCustomerId
                    CustConsultantID = CurrentUser.Id(),
                    CustomerDisplayPrice = suppliersHotelsInfo.LCAP,
                    FCSalesAmt = suppliersHotelsInfo.FCAP,
                    FCurrencyID = suppliersHotelsInfo.CurrencyCode,
                    BaseCurrencyID = suppliersHotelsInfo.CurrencyCode,
                    ExRate = suppliersHotelsInfo.LCAP,
                    SalesAmt = suppliersHotelsInfo.LCAP,
                    SupplierID = long.Parse(suppliersHotelsInfo.SupplierID.ToString()),
                    SupplierRefNo = "XXX",
                    SupplierConfNo = "XXX",
                    SuppreMarks = "XXX",
                    PayCurrID = suppliersHotelsInfo.CurrencyCode,
                    PayExRate = suppliersHotelsInfo.ExchRate,
                    PayAmt = suppliersHotelsInfo.LCAP,
                    serviceid = DbParameter.GetServiceId("HOTELS"),
                    CheckIN = x.fromDate,
                    checkOUT = x.toDate,
                    NoOfNights = suppliersHotelsInfo.NumOfNights,
                    ProductID = suppliersHotelsInfo.LocHotelID,
                    LeadPaxName = txtFirstName.Text + " " + txtMiddleName.Text + " " + txtLastName.Text,
                    NoOfRooms = 1,
                    Adults = x.guestDetails.Where(y => y.type == "Adult").Count(),
                    Children = x.guestDetails.Where(y => y.type == "Kid").Count(),
                    Infants = x.guestDetails.Where(y => y.type == "Infant").Count(),
                    HasExtraPaxs = true
                };
                _meis007Entities.AddToBkgMasters(bkgMaster);
                _meis007Entities.SaveChanges();
                foreach (var y in x.guestDetails) {
                    paxDetail = new PaxDetail { 
                        BkgID = bkgMaster.BkgID,
                        PaxName = y.firstName + " " + y.middleName + " " + y.lastName
                    };
                    _meis007Entities.AddToPaxDetails(paxDetail);
                    _meis007Entities.SaveChanges();
                }
                hotelsToRemove.Add(x);
            }
        }
        RemoveHotels(basketHelper, hotelsToRemove);
        UpdateBasketHelperObject(basketHelper);
        Session["NoticeMessage"] = "Successfully confirmed bookings!";
        Response.Redirect(Route.GetRootPath("basket/show.aspx"));
    }

    protected void CreateBooking(BasketHotelDetails x, SuppliersHotelsInfo suppliersHotelsInfo) {
        BookingDetails bookingInfo = new BookingDetails();
        bookingInfo.CheckIn = x.fromDate;
        bookingInfo.CheckOut = x.toDate;
        bookingInfo.AdultNum = x.guestDetails.Where(y => y.type == "Adult").Count();
        bookingInfo.ChildNum = x.guestDetails.Where(y => y.type == "Kid").Count();
        bookingInfo.ChildAges = x.guestDetails.Where(y => y.type == "Infant").Select(y => int.Parse(y.age)).ToArray();
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

    protected void RemoveHotels(BasketHelper basketHelper, List<BasketHotelDetails> hotelsToRemove)
    {
        foreach (var x in hotelsToRemove) {
            basketHelper.hotelDetails.Remove(x);
        }
    }
}