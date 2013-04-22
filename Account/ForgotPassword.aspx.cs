using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Account_ChangePassword : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            Response.Redirect(Route.GetRootPath("home.aspx"));
        }
        if(!IsPostBack){
            errorDiv.Visible = false;
        }
    }

    protected void btnEmailPassword_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var _email = txtEmail.Text.Trim();
        var _B2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == _email).FirstOrDefault();
        if (_B2CCustomerinfo == null) {
            errorDiv.Visible = true;
            return;
        }
        Mailer.SendPasswordEmail(_B2CCustomerinfo, Request.Url.Host);
        Session["NoticeMessage"] = "Successfully send password to your email please check it!";
        var _path = Route.GetRootPath("account/login.aspx");
        Response.Redirect(_path);
    }
}