using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using RTCModel.Models;

public partial class Bookings_cancel : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    RepositoryFactory supplierFactory;
    public string CancelText;
    string payFee = string.Empty;
    string markupFee = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"] as string;
        long bookingId;
        if (id == null || !long.TryParse(id, out bookingId))
        {
            Redirect("Invalid booking Id");
            return;
        }
        _meis007Entities = new meis007Entities();
        var userId = CurrentUser.Id();
        var status = DbParameter.GetBookingStatus();
        var booking = _meis007Entities.BkgMasters.Where(x => x.BkgID == bookingId && x.CustConsultantID == userId && x.BkgStatus == status).FirstOrDefault();
        if (booking == null){
            Session["ErrorMessage"] = "You are not authorized to access that booking!";
            Response.Redirect("index.aspx");
            return;
        }
        hdnBookingId.Value = id;
        rptrBookingIndex.DataSource = BookingsIndexObjectHelper.GetBookings(bookingId);
        rptrBookingIndex.DataBind();
        payFee = BookingsIndexObjectHelper.GetCancellationFee(bookingId, Session.SessionID, out markupFee);
        hdnFeild1.Value = payFee;
        hdnFeild2.Value = markupFee;
        CancelText = "This Cancellation will charge SAR. " + markupFee;
    }

    public void Redirect(string message)
    {
        Session["ErrorMessage"] = message;
        Response.Redirect(Route.GetRootPath("bookings/index.aspx"));
    }

    protected void btnCancelBooking_Click(object sender, EventArgs e)
    {
        var id = hdnBookingId.Value;
        long bookingId;
        if (id == null || !long.TryParse(id, out bookingId))
        {
            Redirect("Invalid booking Id");
            return;
        }
        var userId = CurrentUser.Id();
        _meis007Entities = new meis007Entities();
        var booking = _meis007Entities.BkgMasters.Where(x => x.CustConsultantID == userId && x.BkgID == bookingId).FirstOrDefault();
        if (booking == null) {
            Redirect("Booking not found");
            return;
        }
        var reservationId = booking.SupplierRefNo + " ~ " + booking.SupplierConfNo;
        supplierFactory = new RepositoryFactory(null, Guid.NewGuid().ToString());
        var cancelled = supplierFactory.CancelHotelRoomBooking(Session.SessionID, int.Parse(booking.SearchID.ToString()), int.Parse(booking.HotelInfoID.ToString()), reservationId, DbParameter.GetSupplierName(booking.SupplierID.ToString()));
        if (true){//cancelled) {
            CreateBooking(booking, _meis007Entities);
            Session["NoticeMessage"] = "Successfully cancelled booking";
        } else {
            Session["ErrorMessage"] = "Booking Cannot be cancelled please try after some time!";
        }
        Response.Redirect(Route.GetRootPath("bookings/index.aspx"));
    }

    protected void CreateBooking(BkgMaster x, meis007Entities _meis007Entities)
    {
        decimal payAmount = decimal.Parse("0.0");
        decimal recieveAmount = decimal.Parse("0.0");
        if (!string.IsNullOrEmpty(hdnFeild1.Value)) {
            payAmount = decimal.Parse(hdnFeild1.Value);
        }
        if (!string.IsNullOrEmpty(hdnFeild2.Value)) {
            recieveAmount = decimal.Parse(hdnFeild2.Value);
        }
        var bkgMaster = new BkgMaster
        {
            BasketID = x.BasketID,
            SearchID = x.BkgID,
            HotelInfoID = x.HotelInfoID,
            BkgDate = DateTime.Now,
            BkgType = DbParameter.GetBookingType(),
            BkgStatus = DbParameter.GetBookingStatus("cancel"),
            CustomerID = long.Parse(DbParameter.GetCustomerId()),
            CustConsultantID = CurrentUser.Id(),
            CustomerDisplayPrice = x.CustomerDisplayPrice,
            FCSalesAmt = x.FCSalesAmt,
            FCurrencyID = x.FCurrencyID,
            BaseCurrencyID = x.BaseCurrencyID,
            ExRate = x.ExRate,
            SalesAmt = x.SalesAmt,
            SupplierID = x.SupplierID,
            SupplierRefNo = x.SupplierRefNo,
            SupplierConfNo = x.SupplierConfNo,
            PayCurrID = x.PayCurrID,
            PayExRate = x.PayExRate,
            PayAmt = x.PayAmt,
            ServiceName = x.ServiceName,
            CheckIN = x.CheckIN,
            checkOUT = x.checkOUT,
            NoOfNights = x.NoOfNights,
            ProductID = x.ProductID,
            LeadPaxName = x.LeadPaxName,
            NoOfRooms = x.NoOfRooms,
            Adults = x.Adults,
            Children = x.Children,
            Infants = x.Infants,
            HasExtraPaxs = false,
            RateSDID = x.RateSDID,
            supplierHotelID = x.supplierHotelID,
            StarsLevel = x.StarsLevel,
            SupplierRoomID = x.SupplierRoomID,
            SupplierRoomName = x.SupplierRoomName,
            SupplierRoomType = x.SupplierRoomType,
            SupplierRoomTypeID = x.SupplierRoomTypeID,
            BBID = x.BBID,
            BBName = x.BBName,
            ModDate = DateTime.Now,
            UserID = CurrentUser.Id().ToString(),
            CancellationPay = payAmount,
            CancellationRec = recieveAmount,
            CustomerMarkup = x.CustomerMarkup
        };
        _meis007Entities.AddToBkgMasters(bkgMaster);
        x.BkgStatus = DbParameter.GetBookingStatus("existingCancel");
        EmailProcessor.Create(_meis007Entities, "bookingCancelled", bkgMaster, "hotel", "");
        _meis007Entities.SaveChanges();
    }
    
}