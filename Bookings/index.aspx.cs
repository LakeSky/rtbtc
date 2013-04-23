using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Bookings_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var data = BookingsIndexObjectHelper.GetBookings();
        rptrBookingIndex.DataSource = data;
        rptrBookingIndex.DataBind();
    }
}