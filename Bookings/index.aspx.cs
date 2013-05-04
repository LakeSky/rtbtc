using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Data;

public partial class Bookings_index : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
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
        if (e.Row.RowType != DataControlRowType.DataRow) return;

        LinkButton lb;
        lb = new LinkButton();
        lb.CommandArgument = e.Row.Cells[6].Text;
        lb.CommandName = "NumClick";
        lb.Text = "Details";
        lb.PostBackUrl = "show.aspx?id=" + e.Row.Cells[6].Text;
        e.Row.Cells[6].Controls.Add((Control)lb);
    }

    protected void BindDataToGridView()
    {   
        var userId = CurrentUser.Id();
        _meis007Entities = new meis007Entities();
        var data = from pm in _meis007Entities.ProductMasters
                   join bm in _meis007Entities.BkgMasters
                   on pm.ProductID equals bm.ProductID
                   where bm.ProductID != null && bm.CustConsultantID == userId
                   orderby bm.BkgID descending
                   select new { booking = bm, HotelName = pm.ProductName };
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("Booking Date", typeof(string)));
        dt.Columns.Add(new DataColumn("Lead Passenger Name", typeof(string)));
        dt.Columns.Add(new DataColumn("First Passenger Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Hotel", typeof(string)));
        dt.Columns.Add(new DataColumn("Check In", typeof(string)));
        dt.Columns.Add(new DataColumn("Check Out", typeof(string)));
        dt.Columns.Add(new DataColumn("Details", typeof(string)));
        dt.Columns.Add(new DataColumn("Print Voucher", typeof(string)));
        foreach (var x in data)
        {
            dr = dt.NewRow();
            dr["Booking Date"] = DateTimeHelper.ConvertToString(x.booking.BkgDate.ToString());
            dr["Lead Passenger Name"] = x.booking.LeadPaxName;
            dr["First Passenger Name"] = _meis007Entities.PaxDetails.Where(z => z.BkgID == x.booking.BkgID).First().PaxName;
            dr["Hotel"] = x.HotelName;
            dr["Check In"] = DateTimeHelper.ConvertToString(x.booking.CheckIN.ToString());
            dr["Check Out"] = DateTimeHelper.ConvertToString(x.booking.checkOUT.ToString());
            dr["Details"] = x.booking.BkgID;
            dr["Print Voucher"] = "Print";
            dt.Rows.Add(dr);
        }
        gvBookings.DataSource = dt;
        gvBookings.DataBind();
    }
}