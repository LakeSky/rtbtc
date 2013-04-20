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
    protected ShoppingHelper _ShoppingHelper;
    protected ShoppingHotelHelper _ShoppingHotel;
    public List<ShoppingRoomHelper> ShoppingRoomsList;
    public int RoomsCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            errorDiv.Visible = false;
        }
        RoomsCount = 1;
        _ShoppingHelper = GetShoppingHelperObject();
        if (_ShoppingHelper != null && _ShoppingHelper.HotelDetails != null) {
            _ShoppingHotel = _ShoppingHelper.HotelDetails;
            ShoppingRoomsList = _ShoppingHotel.RoomDetails;
            txtCity.Text = _ShoppingHotel.CityName;
            txtStartDate.Text = _ShoppingHotel.FromDate;
            txtEndDate.Text = _ShoppingHotel.ToDate;
            RoomsCount = ShoppingRoomsList.Count;
        }
        _meis007Entities = new meis007Entities();
        var data = _meis007Entities.PackageHeaders.Where(x => x.InService == true).OrderBy(x => x.DisplaySeq).ToList();
        rptrPackages.DataSource = data;
        rptrPackages.DataBind();
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
        Response.Redirect(CurrentUser.GetRootPath("/home.aspx"));
    }
    protected void txtSearch_Click(object sender, EventArgs e)
    {
        string index = "";
        string childAge = "";
        var totalRooms = int.Parse(Request.Params["totalRooms"].ToString());
        var parms = Request.Params;
        _ShoppingHelper = GetShoppingHelperObject(true);
        _ShoppingHotel = new ShoppingHotelHelper();
        ShoppingRoomsList = new List<ShoppingRoomHelper>();
        ShoppingRoomHelper _ShoppingRoomHelper;
        _ShoppingHotel.CityName = txtCity.Text;
        _ShoppingHotel.FromDate = txtStartDate.Text;
        _ShoppingHotel.ToDate = txtEndDate.Text;
        _ShoppingHotel.SessionId = Session.SessionID;
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
        _ShoppingHotel.RoomDetails = ShoppingRoomsList;
        _ShoppingHelper.HotelDetails = _ShoppingHotel;
        Session["StoredShopping"] = _ShoppingHelper;
        Response.Redirect(CurrentUser.GetRootPath("hotels/search.aspx"));
    }
}