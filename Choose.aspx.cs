using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Choose : PublicApplicationPage
{
    public ShoppingHelper shoppingHelper;
    public ShoppingHotelHelper shoppingHotel;
    public List<ShoppingRoomHelper> ShoppingHelperList;
    public ShoppingCarHelper shoppingCar;
    public string CountryName;
    public string CityName;
    protected meis007Entities _meis007Entities;
    protected void Page_Load(object sender, EventArgs e)
    {
        shoppingHelper = GetShoppingHelperObject();
        if (shoppingHelper == null) {
          Session["NoticeMessage"] = "Please Select below details!";
          Response.Redirect("Home.aspx");
        }

        if (shoppingHelper.HotelDetails != null){
            shoppingHotel = shoppingHelper.HotelDetails;
            ShoppingHelperList = shoppingHotel.RoomDetails;
        }
        if (shoppingHelper.CarDetails != null) {
            _meis007Entities = new meis007Entities();
            shoppingCar = shoppingHelper.CarDetails;
            CountryName = QueryHelper.GetCountryName(_meis007Entities, shoppingCar.Country);
            CityName = QueryHelper.GetCityName(_meis007Entities, shoppingCar.City);
        }
    }
}