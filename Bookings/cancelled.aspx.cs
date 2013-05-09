using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Data;

public partial class Bookings_cancelled : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataToGridView();
        }
    }

    protected void gvBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookings.PageIndex = e.NewPageIndex;
        BindDataToGridView();
    }

    protected void gvBookings_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }

    protected void BindDataToGridView()
    {
        var userId = CurrentUser.Id();
        _meis007Entities = new meis007Entities();
        var status = DbParameter.GetBookingStatus("cancel");
        var data = from pm in _meis007Entities.ProductMasters
                   join bm in _meis007Entities.BkgMasters
                   on pm.ProductID equals bm.ProductID
                   where bm.ProductID != null && bm.CustConsultantID == userId && bm.BkgStatus == status
                   orderby bm.BkgID descending
                   select new { booking = bm, HotelName = pm.ProductName };
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("Cancellation Date", typeof(string)));
        dt.Columns.Add(new DataColumn("Hotel", typeof(string)));
        dt.Columns.Add(new DataColumn("Total Amount", typeof(string)));
        dt.Columns.Add(new DataColumn("Cancellation Fee", typeof(string)));
        foreach (var x in data)
        {
            var cancelFee = string.IsNullOrEmpty(x.booking.CancellationRec.ToString()) ? "SAR 0" : "SAR " + Math.Round(decimal.Parse(x.booking.CancellationRec.ToString()));
            var totalPrice = string.IsNullOrEmpty(x.booking.CustomerDisplayPrice.ToString()) ? "SAR 0" : "SAR " + Math.Round(decimal.Parse(x.booking.CustomerDisplayPrice.ToString()));
            var cancelText = (DateTime)(x.booking.CheckIN) > DateTime.Now ? x.booking.BkgID.ToString() : "Cannot Cancel";
            dr = dt.NewRow();
            dr["Cancellation Date"] = DateTimeHelper.ConvertToString(x.booking.BkgDate.ToString());
            dr["Hotel"] = x.HotelName;
            dr["Total Amount"] =  totalPrice;
            dr["Cancellation Fee"] = cancelFee;
            dt.Rows.Add(dr);
        }
        gvBookings.DataSource = dt;
        gvBookings.DataBind();
    }
}