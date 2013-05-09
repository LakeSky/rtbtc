using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Bookings_show : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"] as string;
        long bookingId;
        if (id == null || !long.TryParse(id, out bookingId)) {
            Redirect("Invalid booking Id");
            return;
        }
        var userId = CurrentUser.Id();
        var status = DbParameter.GetBookingStatus();
        var booking = _meis007Entities.BkgMasters.Where(x => x.BkgID == bookingId && x.CustConsultantID == userId && x.BkgStatus == status).FirstOrDefault();
        if (booking == null)
        {
            Session["ErrorMessage"] = "You are not authorized to access that booking!";
            Response.Redirect("index.aspx");
            return;
        }
        rptrBookingIndex.DataSource = BookingsIndexObjectHelper.GetBookings(bookingId);
        rptrBookingIndex.DataBind();
        rptrCancelPolicies.DataSource = GetCancelPolicies(bookingId);
        rptrCancelPolicies.DataBind();
    }

    public void Redirect(string message) {
        Session["ErrorMessage"] = message;
        Response.Redirect(Route.GetRootPath("bookings/index.aspx"));
    }

    protected List<CancellationPolicyHelper> GetCancelPolicies(long bookingId)
    {
        List<BaseCancellationPolicy> baseCancellationPolicies = new List<BaseCancellationPolicy>();
        List<CancellationPolicyHelper> list = new List<CancellationPolicyHelper>();
        CancellationPolicyHelper _cancellationPolicyHelper;
        BaseCancellationPolicy baseCancellationPolicy;
        SuppliersHotelsInfo suppliersHotelsInfo;
        _meis007Entities = new meis007Entities();
        var id = CurrentUser.Id();
        var booking = _meis007Entities.BkgMasters.Where(x => x.BkgID == bookingId && x.CustConsultantID == id).FirstOrDefault();
        if (booking == null) {
            return list;
        }
        var data = booking.BkgCancelPolicies;
        var startDate = ((DateTime)(booking.CheckIN)).ToString("dd MMM yy -");
        var endDate = ((DateTime)(booking.CheckIN));
        foreach (var x in data)
        {
            var hotelInfoId = long.Parse(x.HotelInfoId.ToString());
            suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == hotelInfoId).First();
            baseCancellationPolicy = new BaseCancellationPolicy
            {
                Id = x.Id,
                BasisType = x.RateBasisType,
                HotelId = x.LocalHotelId,
                HotelInfoId = x.HotelInfoId,
                HotelRoomTypeId = int.Parse(x.HotelRoomTypeId.ToString()),
                OffSetUnit = x.OffSetUnit,
                Percentage = x.Percentage,
                SearchId = x.SearchId,
                suppliersHotelsInfo = suppliersHotelsInfo,
                UnitMultiplier = x.UnitMultiplier,
                NumberOfNights = x.NoOfNights
            };
            baseCancellationPolicies.Add(baseCancellationPolicy);
        }
        foreach (var x in baseCancellationPolicies)
        {
            _cancellationPolicyHelper = CancellationPolicyHelper.BuildCancelPolicy(startDate, endDate, x);
            startDate = _cancellationPolicyHelper.ToDate + " - ";
            list.Add(_cancellationPolicyHelper);
        }
        return list;
    }
}