using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            errorDiv.Visible = false;
        }
        if (User.Identity.IsAuthenticated && Request.QueryString["ReturnUrl"] != null)
        {
            Response.Redirect(CurrentUser.GetRedirectPath());
        }
        else if (User.Identity.IsAuthenticated)
        {
            Response.Redirect(CurrentUser.GetRedirectPath());
        }    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}