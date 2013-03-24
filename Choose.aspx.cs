using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Choose : System.Web.UI.Page
{
    public ShoppingHelper shoppingHelper;
    public List<ShoppingRoomHelper> ShoppingHelperList;
    protected void Page_Load(object sender, EventArgs e)
    {
        shoppingHelper = (ShoppingHelper)(Session["StoredShopping"]);
        if (shoppingHelper == null) {
          Session["NoticeMessage"] = "Please Select below details!";
          Response.Redirect("Home.aspx");
        }
        ShoppingHelperList = shoppingHelper.RoomDetails;
    }
}