using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Orders_checkout : PublicApplicationPage
{
    public BasketHelper basketHelper;
    meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
       basketHelper = GetBasketHelperObject();
        if (basketHelper == null || !hasBasketItems(basketHelper)) {
            Session["ErrorMessage"] = "You dont have any items in basket please add it !";
            Response.Redirect(CurrentUser.GetRootPath("home.aspx"));
        }
        _meis007Entities = new meis007Entities();
        var userId = CurrentUser.Id();
        var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId).OrderBy(x => x.CustomerSno).First();
        txtFirstName.Text = data.PaxFirstName;
        txtMiddleName.Text = data.PaxMiddleName;
        txtLastName.Text = data.PaxLastName;
        txtMobile.Text = data.B2CCustomerinfo.PaxmobileNo;
        txtTelephone.Text = data.B2CCustomerinfo.PaxTelNo;
    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
    }
}