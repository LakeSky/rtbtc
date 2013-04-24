using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bookings_show : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"] as string;
        long bookingId;
        if (id == null || !long.TryParse(id, out bookingId)) {
            Redirect("Invalid booking Id");
            return;
        }
        rptrBookingIndex.DataSource = BookingsIndexObjectHelper.GetBookings(bookingId);
        rptrBookingIndex.DataBind();
    }

    public void Redirect(string message) {
        Session["ErrorMessage"] = message;
        Response.Redirect(Route.GetRootPath("bookings/index.aspx"));
    }
}