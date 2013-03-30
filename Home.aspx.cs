using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Home : PublicApplicationPage
{
    protected meis007Entities _meis007Entities;
    public ShoppingHelper shoppingHelper;
    public List<ShoppingRoomHelper> ShoppingRoomsList;
    public int RoomsCount;
    public ShoppingHotelHelper shoppingHotel;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            errorDiv.Visible = false;
        }
        RoomsCount = 1;
        shoppingHelper = GetShoppingHelperObject();
        if (shoppingHelper != null && shoppingHelper.HotelDetails != null) {
            shoppingHotel = shoppingHelper.HotelDetails;
            ShoppingRoomsList = shoppingHotel.RoomDetails;
            txtCity.Text = shoppingHotel.CityName;
            txtStartDate.Text = shoppingHotel.FromDate;
            txtEndDate.Text = shoppingHotel.ToDate;
            RoomsCount = ShoppingRoomsList.Count;
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
    protected void txtSearch_Click(object sender, EventArgs e)
    {
        string index = "";
        string childAge = "";
        var totalRooms = int.Parse(Request.Params["totalRooms"].ToString());
        var parms = Request.Params;
        ShoppingHelper _ShoppingHelper = GetShoppingHelperObject(true);
        shoppingHotel = new ShoppingHotelHelper();
        ShoppingRoomsList = new List<ShoppingRoomHelper>();
        ShoppingRoomHelper _ShoppingRoomHelper;
        shoppingHotel.CityName = txtCity.Text;
        shoppingHotel.FromDate = txtStartDate.Text;
        shoppingHotel.ToDate = txtEndDate.Text;
        for (int i = 0; i < totalRooms; i++ ){
            index = (i + 1).ToString();
            _ShoppingRoomHelper = new ShoppingRoomHelper();
            _ShoppingRoomHelper.RoomName = "Room " + index;
            _ShoppingRoomHelper.Adults = int.Parse(parms["rooms[" + index + "][adults]"].ToString());
            _ShoppingRoomHelper.Kids = int.Parse(parms["rooms[" + index + "][kids]"].ToString());
            _ShoppingRoomHelper.Infants = int.Parse(parms["rooms[" + index + "][infants]"].ToString());
            _ShoppingRoomHelper.ChildAge = new List<int>();
            for (int j = 1; j < 5; j++) {
              childAge = (string)(parms["rooms[" + index + "][kids][age]["+j.ToString()+"]"]);
              if (childAge == null) { 
                break; 
              }
              _ShoppingRoomHelper.ChildAge.Add(int.Parse(childAge));
            }
            ShoppingRoomsList.Add(_ShoppingRoomHelper);
        }
        shoppingHotel.RoomDetails = ShoppingRoomsList;
        _ShoppingHelper.HotelDetails = shoppingHotel;
        Session["StoredShopping"] = _ShoppingHelper;
        Response.Redirect("Choose.aspx");
    }
}