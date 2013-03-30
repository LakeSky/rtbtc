using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cars : PublicApplicationPage //System.Web.UI.Page
{
    protected ShoppingHelper _ShoppingHelper;
    protected ShoppingCarHelper _ShoppingCarHelper;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack){
            _ShoppingHelper = GetShoppingHelperObject();
            if (_ShoppingHelper != null && _ShoppingHelper.CarDetails != null){
                _ShoppingCarHelper = _ShoppingHelper.CarDetails;
                ddlCountry.SelectedValue = _ShoppingCarHelper.Country;
                ddlCity.SelectedValue = _ShoppingCarHelper.City;
                ddlCarType.SelectedValue = _ShoppingCarHelper.CarType;
                txtPickupDate.Text = DateTimeHelper.ConvertToString(_ShoppingCarHelper.PickupDateTime.ToString());
                txtDropoffDate.Text = DateTimeHelper.ConvertToString(_ShoppingCarHelper.DropoffDateTime.ToString());
                ddlPickuptime.SelectedValue = DateTimeHelper.ExtractTime(_ShoppingCarHelper.PickupDateTime);
                ddlDropoffTime.SelectedValue = DateTimeHelper.ExtractTime(_ShoppingCarHelper.DropoffDateTime);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        _ShoppingHelper = GetShoppingHelperObject(true);
        _ShoppingCarHelper = new ShoppingCarHelper();
        _ShoppingCarHelper.Country = ddlCountry.SelectedValue.ToString();
        _ShoppingCarHelper.City = ddlCity.SelectedValue.ToString();
        _ShoppingCarHelper.CarType = ddlCarType.SelectedValue.ToString();
        _ShoppingCarHelper.PickupDateTime = DateTimeHelper.ConvertToDateAndTimeWithoutNull(txtPickupDate.Text + " " + ddlPickuptime.SelectedValue.ToString() + ":00:00");
        _ShoppingCarHelper.DropoffDateTime = DateTimeHelper.ConvertToDateAndTimeWithoutNull(txtDropoffDate.Text + " " + ddlDropoffTime.SelectedValue.ToString() + ":00:00");
        _ShoppingHelper.CarDetails = _ShoppingCarHelper;
        Session["StoredShopping"] = _ShoppingHelper;
        Response.Redirect(CurrentUser.GetRootPath("Cars.aspx"));
    }
}