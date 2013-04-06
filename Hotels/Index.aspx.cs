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

    protected void CheckBox_Changed(object sender, EventArgs e)
    {
      PopulateDataSource(1, this.Pager.PageSize);
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
        //var supplierHotelObjectHelper = new SupplierHotelObjectHelper();
        //var data = supplierHotelObjectHelper.GetHotels();
        var supplierHotelObjectHelper = new SupplierHotelObjectHelperTest(ddlSort.SelectedValue);
        var data = supplierHotelObjectHelper.GetHotels();
        //Repeater1.DataSource = classifications;
        //Repeater1.DataBind();
        UpdateStars(data);
        data = FilterByStars(data);
        data = SupplierHotelObjectSortHelper.Sort(data, ddlSort.SelectedValue);
        rptrHotels.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrHotels.DataBind();
        this.Pager.TotalPages =
             (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
    }

    protected void UpdateStars(List<SupplierHotelHelper> data) {
        List<string> starNames = new List<string>();
        foreach (var x in data) {
            if (!starNames.Contains(x.ProductStarsName)) {
                starNames.Add(x.ProductStarsName);
            }
        }
        foreach (var name in starNames) {
            if (name == "1") {
                chkBox1S.Enabled = true;
                if(!IsPostBack)
                  chkBox1S.Checked = true;
            }
            else if (name == "1.5") {
                chkBox15S.Enabled = true;
                if (!IsPostBack)
                  chkBox15S.Checked = true;
            }
            else if (name == "2")
            {
                chkBox2S.Enabled = true;
                if (!IsPostBack)
                  chkBox2S.Checked = true;
            }
            else if (name == "2.5")
            {
                chkBox25S.Enabled = true;
                if (!IsPostBack)
                  chkBox25S.Checked = true;
            }
            else if (name == "3")
            {
                chkBox3S.Enabled = true;
                if (!IsPostBack)
                  chkBox3S.Checked = true;
            }
            else if (name == "3.5")
            {
                chkBox35S.Enabled = true;
                if (!IsPostBack)
                  chkBox35S.Checked = true;
            }
            else if (name == "3.7")
            {
                chkBox37S.Enabled = true;
                if (!IsPostBack)
                  chkBox37S.Checked = true;
            }
            else if (name == "4")
            {
                chkBox4S.Enabled = true;
                if (!IsPostBack)
                  chkBox4S.Checked = true;
            }
            else if (name == "4.5")
            {
                chkBox45S.Enabled = true;
                if (!IsPostBack)
                  chkBox45S.Checked = true;
            }
            else if (name == "5")
            {
                chkBox5S.Enabled = true;
                if (!IsPostBack)
                  chkBox5S.Checked = true;
            }
            else if (name == "6")
            {
                chkBox6S.Enabled = true;
                if (!IsPostBack)
                  chkBox6S.Checked = true;
            }
            else if (name == "7.5")
            {
                chkBox75S.Enabled = true;
                if (!IsPostBack)
                  chkBox75S.Checked = true;
            }
        }
    }

    protected List<SupplierHotelHelper> FilterByStars(List<SupplierHotelHelper> data)
    {
        List<SupplierHotelHelper> filteredData = new List<SupplierHotelHelper>();
        if (chkBox1S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "1");
        }
        if (chkBox15S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "1.5");
        }
        if (chkBox2S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "2");
        }
        if (chkBox25S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "2.5");
        }
        if (chkBox3S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "3");
        }
        if (chkBox35S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "3.5");    
        }
        if (chkBox37S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "3.7");
        }
        if (chkBox4S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "4");
        }
        if (chkBox45S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "4.5");
        }
        if (chkBox5S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "5");
        }
        else if (chkBox6S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "6");
        }
        else if (chkBox75S.Checked)
        {
            filteredData = StarFilter(data, filteredData, "7.5");
        }
        return filteredData;
    }

    protected List<SupplierHotelHelper> StarFilter(List<SupplierHotelHelper> data, List<SupplierHotelHelper> returnData, string starName)
    {
        var filteredData = new List<SupplierHotelHelper>();
        foreach (var x in data) {
            if (x.ProductStarsName == starName) {
                filteredData.Add(x);
            }
        }
        foreach (var x in filteredData) {
            returnData.Add(x);
        }
        return returnData;
    }

}