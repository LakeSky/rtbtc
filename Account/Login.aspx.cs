using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Web.Security;

public partial class Account_Login : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            errorDiv.Visible = false;
            errorDivForInactiveUsers.Visible = false;
        }
        if (User.Identity.IsAuthenticated && Request.QueryString["ReturnUrl"] != null)
        {
            Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
        }
        else if (User.Identity.IsAuthenticated)
        {
            Response.Redirect(CurrentUser.GetRootPath("Home.aspx"));
        }    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        errorDiv.Visible = false;
        errorDivForInactiveUsers.Visible = false;
        _meis007Entities = new meis007Entities();
        var encodedPassword = StringHelper.Encrypt(txtPassword.Text);
        var user = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == txtEmail.Text).Where(x => x.PaxPassword == encodedPassword).FirstOrDefault();
        if (user == null) {
            errorDiv.Visible = true;
            return;
        }
        if (user.InService == "0") {
            errorDivForInactiveUsers.Visible = true;
            return;
        }
        FormsAuthentication.SetAuthCookie(user.PaxEmail, false);
        FormsAuthenticationTicket ticket1 =
           new FormsAuthenticationTicket(
                1,                                   // version
                user.PaxEmail,   // get username  from the form
                DateTime.Now,                        // issue time is now
                DateTime.Now.AddHours(11),         // expires in 10 minutes
                false,      // cookie is not persistent
                user.CustomerSNo.ToString() + "#"    // role assignment is stored
                );
        HttpCookie cookie1 = new HttpCookie(
          FormsAuthentication.FormsCookieName,
          FormsAuthentication.Encrypt(ticket1));
        Response.Cookies.Add(cookie1);
        user.PaxLastLogDatetime = DateTime.Now;
        _meis007Entities.SaveChanges();
        String returnUrl1 = "";
        if (Request.QueryString["ReturnUrl"] != null)
        {
            returnUrl1 = Request.QueryString["ReturnUrl"];
        }
        else
        {
            returnUrl1 = CurrentUser.GetRedirectPath();
        }
        Session["NoticeMessage"] = "Successfully logged in !";
        Response.Redirect(returnUrl1);
    }
}