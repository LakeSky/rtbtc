using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;
using PagerWebControls;

public partial class Hotels_Index : PublicApplicationPage
{
    protected meis007Entities _meis007Entities;
    protected ShoppingHelper _ShoppingHelper;
    protected ShoppingHotelHelper _ShoppingHotel;
    public List<ShoppingRoomHelper> ShoppingRoomsList;
    public int RoomsCount;
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
        classifications = _meis007Entities.Classifications.OrderBy(x => x.ClsName).ToList();
        if (!IsPostBack)
        {
            PopulateDataSource(1, this.Pager.PageSize);
        }
    }

    protected void txtSearch_Click(object sender, EventArgs e)
    {
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateDataSource(1, this.Pager.PageSize);
    }

    protected void Pager_Changed(object sender, PagerEventArgs e)
    {
        PopulateDataSource(e.Number, e.PageSize);
    }

    private void PopulateDataSource(int page, int pageSize)
    {
        //var supplierHotelObjectHelper = new SupplierHotelObjectHelper(ddlSort.SelectedValue);
        //var data = supplierHotelObjectHelper.GetHotels();
        var supplierHotelObjectHelper = new SupplierHotelObjectHelperTest(ddlSort.SelectedValue);
        var data = supplierHotelObjectHelper.GetHotels();
        Repeater1.DataSource = classifications;
        Repeater1.DataBind();
        rptrHotels.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrHotels.DataBind();
        this.Pager.TotalPages =
             (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
    }

}