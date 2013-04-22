using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Account_MyAccount : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    public B2CCustomerinfo b2CCustomerinfo;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated) {
            Session["ErrorMessage"] = "Please login!";
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            _meis007Entities = new meis007Entities();
            var _currentUserId = CurrentUser.Id();
            b2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First();
            txtFirstName.Text = b2CCustomerinfo.PaxFirstName;
            txtMiddleName.Text = b2CCustomerinfo.PaxMiddleName;
            txtLastName.Text = b2CCustomerinfo.PaxLastName;
            txtMobile.Text = b2CCustomerinfo.PaxmobileNo;
            txtTelephone.Text = b2CCustomerinfo.PaxTelNo;
            txtAddress1.Text = b2CCustomerinfo.PaxAdd1;
            txtAddress2.Text = b2CCustomerinfo.PaxAdd2;
            ddlCity.SelectedValue = b2CCustomerinfo.PaxCity;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var _currentUserId = CurrentUser.Id();
        b2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First();
        b2CCustomerinfo.PaxFirstName = txtFirstName.Text;
        b2CCustomerinfo.PaxMiddleName = txtMiddleName.Text;
        b2CCustomerinfo.PaxLastName = txtLastName.Text;
        b2CCustomerinfo.PaxmobileNo = txtMobile.Text;
        b2CCustomerinfo.PaxTelNo = txtTelephone.Text;
        b2CCustomerinfo.PaxAdd1 = txtAddress1.Text;
        b2CCustomerinfo.PaxAdd2 = txtAddress2.Text;
        b2CCustomerinfo.PaxCity = ddlCity.SelectedValue;
        _meis007Entities.SaveChanges();
        Session["NoticeMessage"] = "Successfully updaeted your account !";
        Response.Redirect(Route.GetRootPath("home.aspx"));
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Route.GetRootPath("home.aspx"));
    }
}