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
    public string CityCode;
    public string masterCurrencyValue;
    public B2CCustomerinfo b2CCustomerinfo;
    public string UserName;
    protected void Page_Load(object sender, EventArgs e)
    {
        subscribeDiv.Visible = !User.Identity.IsAuthenticated;
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        if (!IsPostBack)
        {
            errorDiv.Visible = false;
            RoomsCount = 1;
            _ShoppingHelper = GetShoppingHelperObject();
            if (_ShoppingHelper != null && _ShoppingHelper.HotelDetails != null)
            {
                _ShoppingHotel = _ShoppingHelper.HotelDetails;
                ShoppingRoomsList = _ShoppingHotel.RoomDetails;
                txtCity.Text = _ShoppingHotel.CityName;
                txtStartDate.Text = _ShoppingHotel.FromDate;
                txtEndDate.Text = _ShoppingHotel.ToDate;
                RoomsCount = ShoppingRoomsList.Count;
                CityCode = _ShoppingHotel.CityCode;
            }
            _meis007Entities = new meis007Entities();
            rptrSlider.DataSource = _meis007Entities.B2CSiteImages.Where(x => x.Panel == "MAINSLIDER" && x.Inservice == true).OrderBy(x => x.SeqID);
            rptrSlider.DataBind();
            rptrPackages.DataSource = _meis007Entities.PackageHeaders.Where(x => x.InService == true).OrderBy(x => x.DisplaySeq).Take(4).ToList();
            rptrPackages.DataBind();
            rptrHotels.DataSource = SupplierHotelObjectHelper.GetHomePageHotels(_meis007Entities);
            rptrHotels.DataBind();
            rptrCities.DataSource = _meis007Entities.CityMasters.Where(x => x.DisplaySeqNo < 5).OrderBy(x => x.DisplaySeqNo).Take(4);
            rptrCities.DataBind();
        }
    }

    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        _meis007Entities = new meis007Entities();
        var _email =  txtEmail.Text.Trim();
        var count = _meis007Entities.B2CCustomerinfo.Where(x => x.PaxEmail == _email).Count();
        if (count > 0)
        {
            errorDiv.Visible = true;
            errorDiv.InnerText = "Email already exists in the system!";
            return;
        }
        B2CCustomerinfo _b2CCustomerinfo = new B2CCustomerinfo { PaxEmail = _email, InService = "0" };
        _meis007Entities.AddToB2CCustomerinfo(_b2CCustomerinfo);
        _meis007Entities.SaveChanges();
        Session["NoticeMessage"] = "Successfully added for subscription!";
        Response.Redirect(Route.GetRootPath("home.aspx"));
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        UpdateShoppingHelperObject(txtHotelName.Text, txtCity.Text, txtStartDate.Text, txtEndDate.Text);
        Response.Redirect(Route.GetRootPath("hotels/search.aspx"));
    }
}