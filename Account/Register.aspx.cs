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
        var user = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == _email).FirstOrDefault();
        if (user != null && !string.IsNullOrEmpty(user.authenicationcode))
        {
            Session["ErrorMEssage"] = "Email already taken! If you forgot your email please click on forgot password!";
            return;
        }
        var _password = StringHelper.Encrypt(txtPassword.Text);
        var _sessionId = StringHelper.MD5Hash(_email);
        B2CCustomerinfo _toBeEMailedUser = new B2CCustomerinfo();
        if (user == null){
            B2CCustomerinfo _b2CCustomerinfo = new B2CCustomerinfo { PaxEmail = _email, InService = "0", PaxFirstName = txtFirstName.Text, PaxMiddleName = txtMiddleName.Text, PaxLastName = txtLastName.Text, PaxmobileNo = txtMobile.Text, PaxTelNo = txtTelephone.Text, PaxCity = ddlCity.SelectedValue, PaxPassword = _password, PaxAdd1 = txtAddress1.Text, PaxAdd2 = txtAddress2.Text, authenicationcode = _sessionId };
            _meis007Entities.AddToB2CCustomerinfo(_b2CCustomerinfo);
            _toBeEMailedUser = _b2CCustomerinfo;
        }else{
            user.PaxEmail = _email;
            user.InService = "0";
            user.PaxFirstName = txtFirstName.Text;
            user.PaxMiddleName = txtMiddleName.Text;
            user.PaxLastName = txtLastName.Text;
            user.PaxmobileNo = txtMobile.Text; 
            user.PaxTelNo = txtTelephone.Text;
            user.PaxCity = ddlCity.SelectedValue;
            user.PaxPassword = _password;
            user.PaxAdd1 = txtAddress1.Text;
            user.PaxAdd2 = txtAddress2.Text;
            user.authenicationcode = _sessionId;
            _toBeEMailedUser = user;
        }
        _meis007Entities.SaveChanges();
        Mailer.SendRegistrationEmail(_toBeEMailedUser, Request.Url.Host);
        Session["NoticeMessage"] = "Successfully registered please check you email to confirm your account!";
        Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
    }
}