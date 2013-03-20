using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Account_Register : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var _email = txtEmail.Text.Trim();
        var count = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == _email).Count();
        if (count > 0){
            Session["ErrorMEssage"] = "Email already taken!";
            return;
        }
        var _password = StringHelper.MD5Hash(txtPassword.Text);
        var _sessionId = Session.SessionID.ToString();
        B2CCustomerinfo _b2CCustomerinfo = new B2CCustomerinfo { PaxEmail = _email, InService = "0", PaxFirstName = txtFirstName.Text, PaxMiddleName = txtMiddleName.Text, PaxLastName = txtLastName.Text, PaxmobileNo = txtMobile.Text, PaxTelNo = txtTelephone.Text, PaxCity = txtCity.Text, PaxPassword = _password, PaxAdd1 = txtAddress1.Text, PaxAdd2 = txtAddress2.Text, authenicationcode = _sessionId };
        _meis007Entities.AddToB2CCustomerinfo(_b2CCustomerinfo);
        _meis007Entities.SaveChanges();
        Session["NoticeMessage"] = "Successfully registered please check you email to confirm your account!";
        Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
    }
}