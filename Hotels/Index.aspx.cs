using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Hotels_Index : PublicApplicationPage
{
    protected meis007Entities _meis007Entities;
    protected ShoppingHelper _ShoppingHelper;
    protected ShoppingHotelHelper _ShoppingHotel;
    public List<ShoppingRoomHelper> ShoppingRoomsList;
    public int RoomsCount;
    public List<Amenity> amenities;
    public List<Classification> classifications;
    public List<ProductMaster> productMasters;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        }
        _meis007Entities = new meis007Entities();
        amenities = _meis007Entities.Amenities.OrderBy(x => x.AmenitiesName).ToList();
        classifications = _meis007Entities.Classifications.OrderBy(x => x.ClsName).ToList();
        productMasters = _meis007Entities.ProductMasters.Take(10).ToList();
        if (!IsPostBack)
        {
            var supplierHotelObjectHelper = new SupplierHotelObjectHelper();
            Repeater3.DataSource = supplierHotelObjectHelper.GetHotels();
            Repeater3.DataBind();
        }
    }

    protected void txtSearch_Click(object sender, EventArgs e)
    {
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        var supplierHotelObjectHelper = new SupplierHotelObjectHelper(ddlSort.SelectedValue.ToString());
        Repeater3.DataSource = supplierHotelObjectHelper.GetHotels();
        Repeater3.DataBind();
    }
}