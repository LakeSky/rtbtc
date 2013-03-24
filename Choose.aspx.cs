using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Choose : System.Web.UI.Page
{
    public List<ShoppingHelper> ShoppingHelperList;
    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingHelperList = (List<ShoppingHelper>)(Session["StoredShopping"]);
        if (ShoppingHelperList == null) {
          Session["NoticeMessage"] = "Please Select below details!";
          Response.Redirect("Home.aspx");
        }
    }
}