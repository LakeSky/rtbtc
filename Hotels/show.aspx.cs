using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using System.Dynamic;

public partial class Hotels_Details : PublicApplicationPage
{
    protected meis007Entities _meis007Entities;
    public ProductMaster productMaster;
    public string address;
    public string cityName;
    public string countryName;
    public string latitude;
    public string longitude;
    public string hotelName;
    public string starsImagePath;
    public string requestFrom;
    public string roomName = "";
    public dynamic shoppingHotelDetailDynamic;
    public BasketHotelDetails basketHotelDetailsObj;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        _meis007Entities = new meis007Entities();
        var id = (string)(Request.QueryString["id"]);
        var found = false;
        dynamic expando = CheckRequestFromValid();
        if ( expando.valid && id != null){
            var productId = int.Parse(id);
            productMaster = _meis007Entities.ProductMasters.Where(x => x.ProductID == productId).FirstOrDefault();
            if (productMaster != null){
                cityName = QueryHelper.GetCityName(_meis007Entities, productMaster.CityID);
                countryName = QueryHelper.GetCountryName(_meis007Entities, productMaster.CountryID);
                address = productMaster.Address;
                latitude = string.IsNullOrEmpty(productMaster.Latitude) ? "24.711666" : productMaster.Latitude;
                longitude = string.IsNullOrEmpty(productMaster.Longitude) ? "46.724166" : productMaster.Longitude;
                hotelName = productMaster.ProductName;
                if (productMaster.ClsID == null){
                    var classification = _meis007Entities.Classifications.Where(x => x.ClsName == "1").First();
                    starsImagePath = classification.ImagePath;
                }else {
                    starsImagePath = productMaster.Classification.ImagePath;
                }
                found = true;
                List<SupplierHotelRoomHelper> data;
                if (requestFrom == "search"){
                    data = RoomObjectHelper.GetHotelRooms(expando.hotelInfoId, _meis007Entities, null);
                    shoppingHotelDetailDynamic = expando.shoppingHotelDetails.formattedSearchText();
                }else {
                    data = RoomObjectHelper.GetHotelRooms(expando.hotelInfoId, null, expando.basketHelper);
                    roomName = data.First().RoomName;
                }
                rptrRooms.DataSource = data;
                rptrRooms.DataBind();
            }
        } 
        if (!found) {
            Session["ErrorMessage"] = "Hotel not found";
            Response.Redirect(Route.GetRootPath("home.aspx"));
            return;
        }
    }

    protected dynamic CheckRequestFromValid() {
        requestFrom = (string)Request.QueryString["from"];
        long hotelInfoId ;
        dynamic expando = new ExpandoObject();
        if (!long.TryParse(Request.QueryString["sid"], out hotelInfoId) || (requestFrom != "search" && requestFrom != "basket"))
        {
            expando.valid = false;
            return expando;
        }
        expando.hotelInfoId = hotelInfoId;
        expando.valid = true;
        if (requestFrom == "search") {
            var obj = GetShoppingHotelDetailsObject();
            if (!obj.valid) {
                expando.valid = false;
                return expando;
            }
            expando.shoppingHotelDetails = obj.shoppingHotelDetails;
            return expando;
        }
        BasketHelper basketHelper = GetBasketHelperObject();
        if (!hasHotelsInBasket(basketHelper)) {
            expando.valid = false;
            return expando;
        }
        expando.basketHelper = basketHelper;
        basketHotelDetailsObj = basketHelper.hotelDetails.Where(x => x.hotelInfoId == hotelInfoId).First();
        return expando;
    }
}