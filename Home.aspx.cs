using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Home : System.Web.UI.Page
{
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            errorDiv.Visible = false;
        }
    }

    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var _email = txtEmail.Text.Trim();
        var count = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == _email).Count();
        if (count > 0) {
            errorDiv.Visible = true;
            return;
        }
        B2CCustomerinfo _b2CCustomerinfo = new B2CCustomerinfo { PaxEmail = _email, InService = "0" };
        _meis007Entities.AddToB2CCustomerinfo(_b2CCustomerinfo);
        _meis007Entities.SaveChanges();
        Session["NoticeMessage"] = "Successfully added for subscription!";
        Response.Redirect(CurrentUser.GetRootPath("/Home.aspx"));
    }
}