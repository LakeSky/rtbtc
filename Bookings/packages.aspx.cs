using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Data;

public partial class Bookings_packages : System.Web.UI.Page
{
    meis007Entities _meis007Entities;
    bool valid;
    long currentUserId;
    string paxName;
    string cancelText;
    string status;
    string status2;
    long bkgId;
    string serviceName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            checkInDateDiv.Visible = false;
            statusDiv.Visible = true;
            currentUserId = CurrentUser.Id();
            _meis007Entities = new meis007Entities();
            BindSearchFieldsDdl();
            BindStatusDdl();
            BindDataToGridView();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        currentUserId = CurrentUser.Id();
        _meis007Entities = new meis007Entities();
        ReBind();
    }

    protected void gvBookings_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        var text = e.Row.Cells[0].Text;
        LinkButton lb;
        lb = new LinkButton();
        lb.CommandArgument = text;
        lb.CommandName = "NumClick";
        lb.Text = text;
        lb.PostBackUrl = "package_details.aspx?id=" + text;
        lb.CssClass = "blue-link";
        e.Row.Cells[0].Controls.Add((Control)lb);
    }

    protected void ddlSearchFields_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSearchFields.SelectedValue == "Checkin Date")
        {
            checkInDateDiv.Visible = true;
            statusDiv.Visible = false;
        }
        else
        {
            checkInDateDiv.Visible = false;
            statusDiv.Visible = true;
        }
    }

    private void BindCategories(object sender, EventArgs e)
    {
    }

    protected void BindDataToGridView()
    {
        serviceName = ApplicationObject.GetServiceName("package");
        status = DbParameter.GetBookingStatus();
        var data = (from ph in _meis007Entities.PackageHeaders
                    join bm in _meis007Entities.BkgMasters
                    on ph.PacId equals bm.ProductID
                    where bm.ProductID != null && bm.CustConsultantID == currentUserId && bm.BkgStatus == status && bm.ServiceName == serviceName
                    orderby bm.BkgID descending
                    select new { booking = bm, PackageName = ph.PacName }).Take(25);
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("Booking Id", typeof(string)));
        dt.Columns.Add(new DataColumn("Booking Date", typeof(string)));
        dt.Columns.Add(new DataColumn("First Passenger Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Package", typeof(string)));
        dt.Columns.Add(new DataColumn("Check In", typeof(string)));
        dt.Columns.Add(new DataColumn("Check Out", typeof(string)));
        dt.Columns.Add(new DataColumn("Status", typeof(string)));
        dt.Columns.Add(new DataColumn("Total Price", typeof(string)));
        dt.Columns.Add(new DataColumn("Print", typeof(string)));
        foreach (var x in data)
        {
            if (x.booking.BkgStatus == DbParameter.GetBookingStatus("cancel"))
            {
                paxName = _meis007Entities.PaxDetails.Where(z => z.BkgID == x.booking.SearchID).First().PaxName;
                bkgId = x.booking.SearchID;
            }
            else
            {
                paxName = _meis007Entities.PaxDetails.Where(z => z.BkgID == x.booking.BkgID).First().PaxName;
                bkgId = x.booking.BkgID;
            }
            dr = dt.NewRow();
            dr["Booking Id"] = bkgId.ToString();
            dr["Booking Date"] = DateTimeHelper.ConvertToString(x.booking.BkgDate.ToString());
            dr["First Passenger Name"] = paxName;
            dr["Package"] = x.PackageName;
            dr["Check In"] = DateTimeHelper.ConvertToString(x.booking.CheckIN.ToString());
            dr["Check Out"] = DateTimeHelper.ConvertToString(x.booking.checkOUT.ToString());
            dr["Status"] = ApplicationObject.FormatBookingStatus(x.booking.BkgStatus);
            dr["Total Price"] = x.booking.FCurrencyID + " " + x.booking.SalesAmt.ToString();
            dr["Print"] = "Print";
            dt.Rows.Add(dr);
        }
        gvBookings.DataSource = dt;
        gvBookings.DataBind();
    }


    protected void BindSearchFieldsDdl()
    {
        DataTable table = new DataTable();
        table.Columns.Add("Text");
        table.Columns.Add("Value");
        DataRow dr;
        foreach (var x in ApplicationObject.SearchFields("Package"))
        {
            dr = table.NewRow();
            dr["Value"] = x;
            dr["Text"] = x;
            table.Rows.Add(dr);
        }
        ddlSearchFields.DataSource = table;
        ddlSearchFields.DataTextField = table.Columns["Text"].ColumnName;
        ddlSearchFields.DataValueField = table.Columns["Value"].ColumnName;
        ddlSearchFields.AutoPostBack = true;
        ddlSearchFields.DataBind();
        ddlSearchFields.SelectedIndexChanged += new System.EventHandler(BindCategories);
    }

    protected void BindStatusDdl()
    {
        DataTable table = new DataTable();
        table.Columns.Add("Text");
        table.Columns.Add("Value");
        DataRow dr;
        foreach (var x in ApplicationObject.GetBookingStatus())
        {
            dr = table.NewRow();
            dr["Value"] = x.Value;
            dr["Text"] = x.Text;
            table.Rows.Add(dr);
        }
        ddlStatus.DataSource = table;
        ddlStatus.DataTextField = table.Columns["Text"].ColumnName;
        ddlStatus.DataValueField = table.Columns["Value"].ColumnName;
        ddlStatus.DataBind();
        ddlStatus.SelectedIndexChanged += new System.EventHandler(BindCategories);
    }

    protected void ReBind()
    {
        serviceName = ApplicationObject.GetServiceName("package");
        var selectedValue = ddlSearchFields.SelectedValue;
        var searchValue = txtSearchValue.Text.Trim();
        var data = from ph in _meis007Entities.PackageHeaders
                   join bm in _meis007Entities.BkgMasters
                   on ph.PacId equals bm.ProductID
                   join city in _meis007Entities.CityMasters
                   on ph.CityId equals city.CityID
                   where bm.ProductID != null && bm.CustConsultantID == currentUserId && bm.ServiceName == serviceName
                   orderby bm.BkgID descending
                   select new { booking = bm, PackageName = ph.PacName, CityName = city.CityName };

        if (ddlStatus.SelectedValue != "all")
        {
            status = ddlStatus.SelectedValue;
            data = data.Where(x => x.booking.BkgStatus == status);
        }
        switch (selectedValue)
        {
            case "Booking Id":
                long bookingId;
                if (!long.TryParse(txtSearchValue.Text, out bookingId))
                {
                    Session["ErrorMessage"] = "Invalid Booking Id Format";
                    return;
                }
                data = data.Where(x => x.booking.BkgID == bookingId);
                break;
            case "Pax Name":
                break;
            case "City Name":
                data = data.Where(x => x.CityName.ToLower().Contains(searchValue.ToLower()));
                break;
            case "Package Name":
                data = data.Where(x => x.PackageName.ToLower().Contains(searchValue.ToLower()));
                break;
            case "Checkin Date":
                checkInDateDiv.Visible = true;
                statusDiv.Visible = false;
                var checkinDate = DateTimeHelper.ConvertToDateWithoutNull(txtCheckinDate.Text);
                data = data.Where(x => x.booking.CheckIN >= checkinDate);
                break;
            case "Price":
                var amount = decimal.Parse(searchValue);
                data = data.Where(x => x.booking.SalesAmt >= amount);
                break;
        }

        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("Booking Id", typeof(string)));
        dt.Columns.Add(new DataColumn("Booking Date", typeof(string)));
        dt.Columns.Add(new DataColumn("First Passenger Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Package", typeof(string)));
        dt.Columns.Add(new DataColumn("Check In", typeof(string)));
        dt.Columns.Add(new DataColumn("Check Out", typeof(string)));
        dt.Columns.Add(new DataColumn("Status", typeof(string)));
        dt.Columns.Add(new DataColumn("Total Price", typeof(string)));
        dt.Columns.Add(new DataColumn("Print", typeof(string)));

        foreach (var x in data)
        {
            valid = true;
            if (x.booking.BkgStatus == DbParameter.GetBookingStatus("cancel"))
            {
                paxName = _meis007Entities.PaxDetails.Where(z => z.BkgID == x.booking.SearchID).First().PaxName;
                cancelText = "-";
                bkgId = x.booking.SearchID;
            }
            else
            {
                paxName = _meis007Entities.PaxDetails.Where(z => z.BkgID == x.booking.BkgID).First().PaxName;
                cancelText = "-";// (DateTime)(x.booking.CheckIN) > DateTime.Now ? x.booking.BkgID.ToString() : "-";
                bkgId = x.booking.BkgID;
            }
            if (selectedValue == "Pax Name")
            {
                valid = paxName.ToLower().Contains(searchValue.ToLower());
            }
            if (valid)
            {
                dr = dt.NewRow();
                dr["Booking Id"] = bkgId.ToString();
                dr["Booking Date"] = DateTimeHelper.ConvertToString(x.booking.BkgDate.ToString());
                dr["First Passenger Name"] = paxName;
                dr["Package"] = x.PackageName;
                dr["Check In"] = DateTimeHelper.ConvertToString(x.booking.CheckIN.ToString());
                dr["Check Out"] = DateTimeHelper.ConvertToString(x.booking.checkOUT.ToString());
                dr["Status"] = ApplicationObject.FormatBookingStatus(x.booking.BkgStatus);
                dr["Total Price"] = x.booking.FCurrencyID + " " + x.booking.ConsultantDisplayAmt.ToString();
                dr["Print"] = "Print";
                dt.Rows.Add(dr);
            }
        }
        gvBookings.DataSource = dt;
        gvBookings.DataBind();
        updatePanelGV.Update();
    }
}