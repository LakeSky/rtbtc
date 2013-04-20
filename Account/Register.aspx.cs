using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Web.Security;

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
        var _customerId = DbParameter.GetCustomerId();
        B2CPaxinfo _B2CPaxinfo = new B2CPaxinfo { Title = ddlTitle.SelectedValue, PaxFirstName = txtFirstName.Text, PaxMiddleName = txtMiddleName.Text, PaxLastName = txtLastName.Text, CustomerId = 1 };
        if (user == null){
            B2CCustomerinfo _b2CCustomerinfo = new B2CCustomerinfo { PaxEmail = _email, InService = "0", PaxFirstName = txtFirstName.Text, PaxMiddleName = txtMiddleName.Text, PaxLastName = txtLastName.Text, PaxmobileNo = txtMobile.Text, PaxTelNo = txtTelephone.Text, PaxCity = ddlCity.SelectedValue, PaxPassword = _password, PaxAdd1 = txtAddress1.Text, PaxAdd2 = txtAddress2.Text, authenicationcode = _sessionId, CustomerID = _customerId };
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
            user.CustomerID = _customerId;
            _toBeEMailedUser = user;
        }
        _meis007Entities.SaveChanges();
        _B2CPaxinfo.ForeignCustomerSNo = _toBeEMailedUser.CustomerSNo;
        _meis007Entities.AddToB2CPaxinfo(_B2CPaxinfo);
        _meis007Entities.SaveChanges();
        Mailer.SendRegistrationEmail(_toBeEMailedUser, Request.Url.Host);
        var path = CurrentUser.GetRootPath("home.aspx");
        if (Request.QueryString["bookingid"] != null && (Request.QueryString["bookingtype"] == "hotel" || Request.QueryString["bookingtype"] == "package"))
        {
            FormsAuthentication.SetAuthCookie(_toBeEMailedUser.PaxEmail, false);
            FormsAuthenticationTicket ticket1 =
               new FormsAuthenticationTicket(
                    1,                                   // version
                    _toBeEMailedUser.PaxEmail,   // get username  from the form
                    DateTime.Now,                        // issue time is now
                    DateTime.Now.AddHours(11),         // expires in 10 minutes
                    false,      // cookie is not persistent
                    _toBeEMailedUser.CustomerSNo.ToString() + "#"    // role assignment is stored
                    );
            HttpCookie cookie1 = new HttpCookie(
              FormsAuthentication.FormsCookieName,
              FormsAuthentication.Encrypt(ticket1));
            Response.Cookies.Add(cookie1);
            _toBeEMailedUser.PaxLastLogDatetime = DateTime.Now;
            _meis007Entities.SaveChanges();
            if (Request.QueryString["bookingtype"] == "hotel")
            {
                path = CurrentUser.GetRootPath("hotels/book.aspx?id=" + Request.QueryString["bookingid"]);
            }
            else {
                path = CurrentUser.GetRootPath("packages/book.aspx?id=" + Request.QueryString["bookingid"]);
            }
        }
        Session["NoticeMessage"] = "Successfully registered please check you email to confirm your account!";
        Response.Redirect(path);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
    }
}