using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Bookings_package_details : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"] as string;
        long bookingId;
        if (id == null || !long.TryParse(id, out bookingId))
        {
            Session["ErrorMessage"] = "Invalid booking !";
            Response.Redirect("packages.aspx");
            return;
        }
        var userId = CurrentUser.Id();
        _meis007Entities = new meis007Entities();
        var booking = _meis007Entities.BkgMasters.Where(x => x.BkgID == bookingId && x.CustConsultantID == userId).FirstOrDefault();
        if (booking == null)
        {
            Session["ErrorMessage"] = "You are not authorized to access that booking!";
            Response.Redirect("packages.aspx");
            return;
        }
        rptrBookingIndex.DataSource = BookingsIndexObjectHelper.GetPackageBooking(_meis007Entities, booking);
        rptrBookingIndex.DataBind();
    }
}