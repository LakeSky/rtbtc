using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Dynamic;
using System.Web.UI.WebControls;
using meis007Model;

/// <summary>
/// Summary description for PublicApplicationPage
/// </summary>
public class PublicApplicationPage : System.Web.UI.Page
{
    protected meis007Entities _entity;
    protected string rootPath;
    protected meis007Entities GetEntity()
    {
        if (_entity == null)
        {
            _entity = new meis007Entities();
        }
        return _entity;
    }

    protected void UpdateShoppingHelperObject(string hotel, string city, string startDate, string endDate) {
        string index = "";
        string childAge = "";
        var totalRooms = int.Parse(Request.Params["totalRooms"].ToString());
        var parms = Request.Params;
        ShoppingHelper shoppingHelper = GetShoppingHelperObject(true);
        ShoppingHotelHelper shoppingHotel = new ShoppingHotelHelper();
        List<ShoppingRoomHelper> shoppingRoomsList = new List<ShoppingRoomHelper>();
        ShoppingRoomHelper _ShoppingRoomHelper;
        shoppingHotel.HotelName = hotel;
        shoppingHotel.CityName = city;
        shoppingHotel.CityCode = parms["cityCode"];
        shoppingHotel.FromDate = startDate;
        shoppingHotel.ToDate = endDate;
        shoppingHotel.SessionId = Session.SessionID;
        for (int i = 0; i < totalRooms; i++)
        {
            index = (i + 1).ToString();
            _ShoppingRoomHelper = new ShoppingRoomHelper();
            _ShoppingRoomHelper.RoomName = "Room " + index;
            _ShoppingRoomHelper.Adults = int.Parse(parms["rooms[" + index + "][adults]"].ToString());
            _ShoppingRoomHelper.Kids = int.Parse(parms["rooms[" + index + "][kids]"].ToString());
            _ShoppingRoomHelper.Infants = int.Parse(parms["rooms[" + index + "][infants]"].ToString());
            _ShoppingRoomHelper.ChildAge = new List<int>();
            for (int j = 1; j < 5; j++)
            {
                childAge = (string)(parms["rooms[" + index + "][kids][age][" + j.ToString() + "]"]);
                if (childAge == null)
                {
                    break;
                }
                _ShoppingRoomHelper.ChildAge.Add(int.Parse(childAge));
            }
            shoppingRoomsList.Add(_ShoppingRoomHelper);
        }
        shoppingHotel.RoomDetails = shoppingRoomsList;
        shoppingHelper.HotelDetails = shoppingHotel;
        Session["StoredShopping"] = shoppingHelper;
    }

    protected long? CheckAndGetCurrentUserId() {
        if (!User.Identity.IsAuthenticated) {
            return null;
        }
        return CurrentUser.Id();
    }

    protected ShoppingHelper GetShoppingHelperObject(bool returnNew = false)
    {
        var shoppingHelper = (ShoppingHelper)(Session["StoredShopping"]);
        if (shoppingHelper == null && returnNew) { 
            return new ShoppingHelper();
        }
        return (ShoppingHelper)(Session["StoredShopping"]);
    }

    protected dynamic GetShoppingHotelDetailsObject()
    {
        dynamic expando = new ExpandoObject();
        var shoppingHelper = GetShoppingHelperObject();
        if (shoppingHelper == null || shoppingHelper.HotelDetails == null) {
            expando.valid = false;
            return expando;
        }
        expando.valid = true;
        expando.shoppingHotelDetails = shoppingHelper.HotelDetails;
        return expando;
    }

    protected BasketHelper GetBasketHelperObject(bool returnNew = false) {
        var basketHelper = (BasketHelper)(Session["Basket"]);
        if (basketHelper == null && returnNew) {
            return new BasketHelper();
        }
        return basketHelper;
    }

    protected bool hasBasketItems(BasketHelper basketHelper){
        if (basketHelper == null) {
            return false;
        }
        return countHotelsInBasket(basketHelper) > 0 || countPackagesInBasket(basketHelper) > 0;
    }

    protected bool hasHotelsInBasket(BasketHelper basketHelper){
        if (basketHelper == null){
            return false;
        }
        return countHotelsInBasket(basketHelper) > 0;
    }

    protected int countHotelsInBasket(BasketHelper basketHelper) {
        return basketHelper.hotelDetails.Count;
    }

    protected int countPackagesInBasket(BasketHelper basketHelper)
    {
        return basketHelper.packageDetails.Count;
    }

    protected void UpdateBasketHelperObject(BasketHelper basketHelper)
    {
        Session["Basket"] = basketHelper;
    }

    protected void DisposeHotelDetails(){
        var shoppingHelper = GetShoppingHelperObject();
        shoppingHelper.HotelDetails = null;
        Session["StoredShopping"] = shoppingHelper;
    }

    public string GetMasteCurrencySelectedValue() {
        var hdnFld = Page.Master.FindControl("hdnMasterCurrencySelectedValue") as HiddenField;
        return hdnFld.Value;
    }

    public void ErrorRedirect(string message)
    {
        Session["ErrorMessage"] = message;
        Response.Redirect(Route.GetRootPath("packages/index.aspx"));
    }

}