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
    public string CityCode;
    public List<Classification> classifications;
    public List<ProductMaster> productMasters;
    public string masterCurrencyValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        masterCurrencyValue = GetMasteCurrencySelectedValue();
        RoomsCount = 1;
        _ShoppingHelper = GetShoppingHelperObject();
        if (_ShoppingHelper == null || _ShoppingHelper.HotelDetails == null)
        { 
            Session["ErrorMessage"] = "Please provide hotel search details!";
            Response.Redirect(Route.GetRootPath("home.aspx"));
            return;
        }
        if (!IsPostBack)
        {
            _ShoppingHotel = _ShoppingHelper.HotelDetails;
            ShoppingRoomsList = _ShoppingHotel.RoomDetails;
            txtCity.Text = _ShoppingHotel.CityName;
            txtStartDate.Text = _ShoppingHotel.FromDate;
            txtEndDate.Text = _ShoppingHotel.ToDate;
            CityCode = _ShoppingHotel.CityCode;
            RoomsCount = ShoppingRoomsList.Count;
            var supplierHotelObjectHelper = new SupplierHotelObjectHelper(_ShoppingHotel, true);
            var data = supplierHotelObjectHelper.GetHotels();
            BindStarRatingsRepeater();
            EnableOrDisableStarRatingCheckBoxes(data);
            PopulateDataSource(1, this.Pager.PageSize, true, data);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        UpdateShoppingHelperObject(txtCity.Text, txtStartDate.Text, txtEndDate.Text);
        Response.Redirect(Route.GetRootPath("hotels/search.aspx"));
    }

    protected void CheckBox_Changed(object sender, EventArgs e)
    {
        PopulateDataSource(1, this.Pager.PageSize, false);
        UpdatePanelHotelList.Update();
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateDataSource(1, this.Pager.PageSize, false);
    }

    protected void Pager_Changed(object sender, PagerEventArgs e)
    {
        PopulateDataSource(e.Number, e.PageSize, false);
    }

    private void PopulateDataSource(int page, int pageSize, bool newSearch, List<SupplierHotelHelper> data = null)
    {
        _ShoppingHelper = GetShoppingHelperObject();
        if (data == null)
        {
            var supplierHotelObjectHelper = new SupplierHotelObjectHelper(_ShoppingHelper.HotelDetails, newSearch);
            data = supplierHotelObjectHelper.GetHotels();
        }
        data = FilterByStars(data);
        data = SupplierHotelObjectSortHelper.Sort(data, ddlSort.SelectedValue);
        rptrHotels.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrHotels.DataBind();
        this.Pager.TotalPages =
             (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
    }

    protected void BindStarRatingsRepeater() {
        _meis007Entities = new meis007Entities();
        rptrStarRatings.DataSource = _meis007Entities.Classifications.OrderBy(x => x.ClsName).ToList();
        rptrStarRatings.DataBind();
    }

    protected void EnableOrDisableStarRatingCheckBoxes(List<SupplierHotelHelper> data) {
        foreach (RepeaterItem item in rptrStarRatings.Items){
          var chkBox = item.FindControl("chkBoxStar") as CheckBox;
          var hotel = data.Where(x => x.ProductStarsName == chkBox.Text).FirstOrDefault();
          chkBox.Enabled = hotel == null ? false : true;
          chkBox.Checked = hotel == null ? false : true;
        }
    }

    protected List<SupplierHotelHelper> FilterByStars(List<SupplierHotelHelper> data)
    {
        List<SupplierHotelHelper> filteredData = new List<SupplierHotelHelper>();
        foreach (RepeaterItem item in rptrStarRatings.Items)
        {
            var chkBox = item.FindControl("chkBoxStar") as CheckBox;
            if (chkBox.Checked)
            {
                foreach (var x in data)
                {
                    if (x.ProductStarsName == chkBox.Text)
                    {
                        filteredData.Add(x);
                    }
                }
            }
        }
        return filteredData;
    }

}