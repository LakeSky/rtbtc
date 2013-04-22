using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Account_Confirm : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated){
            Response.Redirect(Route.GetRootPath("home.aspx"));
        }
        var _id = Request.QueryString["id"].ToString();
        var _errorPath = Route.GetRootPath("home.aspx");
        if (string.IsNullOrEmpty(_id)) {
            Session["ErrorMEssage"] = "Incorrect confirmation code !";
            Response.Redirect(_errorPath);
            return;
        }
        _meis007Entities = new meis007Entities();
        var _B2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.authenicationcode == _id).FirstOrDefault();
        if (_B2CCustomerinfo == null) {
            Session["ErrorMEssage"] = "Incorrect confirmation code !";
            Response.Redirect(_errorPath);
            return;
        }
        var _successPath = Route.GetRootPath("account/login.aspx");
        if (_B2CCustomerinfo.InService == "1") {
            Session["ErrorMessage"] = "Your account is already confirmed please login";
        } else {
            _B2CCustomerinfo.InService = "1";
            Session["NoticeMessage"] = "Congratulations Your account has been confirmed please login";
            _meis007Entities.SaveChanges();
        }
        Response.Redirect(_successPath);
        return;
    }
}