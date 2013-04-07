using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Hotels_book : PublicApplicationPage
{
    meis007Entities _meis007Entities;
    ShoppingHelper _shoppingHelper;
    public BookingHotelDetails bookingHotelDetails;
    protected void Page_Load(object sender, EventArgs e)
    {
        _shoppingHelper = GetShoppingHelperObject();
        if (_shoppingHelper == null || _shoppingHelper.HotelDetails == null) {
            Redirect("Please select hotel first!", CurrentUser.GetRootPath("home.aspx"));
            return;
        }
        string id = (string)Request.QueryString["id"];
        if (string.IsNullOrEmpty(id)) {
            Redirect("Please choose hotel and romm!");
            return;
        }
        var supplierHotelInfoId = long.Parse(id);
        _meis007Entities = new meis007Entities();
        var supplierHotelInfo = _meis007Entities.SuppliersHotelsInfoes.Where(x => x.HotelInfoID == supplierHotelInfoId).FirstOrDefault();
        if (supplierHotelInfo == null) {
            Redirect("Sorry but the hotel you selected is not found!");
            return;
        }
        bookingHotelDetails = BookingObjectHelper.GetHotelDetails(_meis007Entities, supplierHotelInfoId, _shoppingHelper);
        rptrHotels.DataSource = bookingHotelDetails.guestDetails;
        rptrHotels.DataBind();
    }

    void Redirect(string message, string path = null) {
        Session["ErrorMessage"] = message;
        path = path == null ? CurrentUser.GetRootPath("hotels/index.aspx") : path;
        Response.Redirect(path);
    }
}