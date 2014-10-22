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
    public List<int> productStarIds { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        string index = "";
        string childAge = "";

        masterCurrencyValue = GetMasteCurrencySelectedValue();
        RoomsCount = 1;
        _ShoppingHelper = GetShoppingHelperObject();
        if (_ShoppingHelper != null && _ShoppingHelper.HotelDetails != null && !IsPostBack)
        {
            var parms = Request.Params;
            //var totalRooms = int.Parse(Request.Params["totalRooms"].ToString());


            _ShoppingHelper = GetShoppingHelperObject(true);
            _ShoppingHotel = new ShoppingHotelHelper();
            ShoppingRoomsList = new List<ShoppingRoomHelper>();
            ShoppingRoomHelper _ShoppingRoomHelper;

            _ShoppingHotel = _ShoppingHelper.HotelDetails;
            ShoppingRoomsList = _ShoppingHotel.RoomDetails;
            txtCity.Text = _ShoppingHotel.CityName;
            txtHotelName.Text = _ShoppingHotel.HotelName;
            txtStartDate.Text = _ShoppingHotel.FromDate;
            txtEndDate.Text = _ShoppingHotel.ToDate;
            CityCode = _ShoppingHotel.CityCode;
            Session["cityCode"] = CityCode;  //shams added 
            RoomsCount = ShoppingRoomsList.Count;
            //for (int i = 0; i < RoomsCount; i++)
            //{
            //    index = (i + 1).ToString();
            //    _ShoppingRoomHelper = new ShoppingRoomHelper();
            //    _ShoppingRoomHelper.RoomName = "Room " + index;
            //    _ShoppingRoomHelper.Adults = int.Parse(_ShoppingHotel.RoomDetails[i].Adults.ToString() );
            //    _ShoppingRoomHelper.Kids = int.Parse(_ShoppingHotel.RoomDetails[i].Kids.ToString() );
            //    _ShoppingRoomHelper.Infants = int.Parse(_ShoppingHotel.RoomDetails[i].Infants.ToString() ); 
            //    _ShoppingRoomHelper.ChildAge = new List<int>();
            //    for (int j = 1; j < 3; j++)
            //     {
            //         try
            //         {
            //             childAge = (string)_ShoppingHotel.RoomDetails[i].ChildAge[j - 1].ToString();
            //         }
            //        catch {
            //            childAge = null;
            //        }
            //        if (childAge == null )
            //        {
            //            break;
            //        }
            //        _ShoppingRoomHelper.ChildAge.Add(int.Parse(childAge));
            //    }
            //   ShoppingRoomsList.Add(_ShoppingRoomHelper);
            //}
            _ShoppingHotel.RoomDetails = ShoppingRoomsList;
            _ShoppingHelper.HotelDetails = _ShoppingHotel;
            Session["StoredShopping"] = _ShoppingHelper;
            ListItem first = this.ddlStart.Items[0];
            this.ddlStart.Items.Clear();
            this.ddlStart.Items.Add(first);
            var supplierHotelObjectHelper = new SupplierHotelObjectHelper(_ShoppingHelper.HotelDetails, true);
            //check for Multi room 
            if (RoomsCount > 1)
            {
                Session["RoomCount"] = RoomsCount.ToString();
            }
            else
            {
                Session["RoomCount"] = "99";
            }
            var data = supplierHotelObjectHelper.GetHotels();
            productStarIds = new List<int>();
            productStarIds = data.Select(x => x.ProductStarsId).Distinct().ToList();
            BindStarRatingsRepeater();
            EnableOrDisableStarRatingCheckBoxes(data);
            PopulateDataSource(1, this.Pager.PageSize, true, data);

        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        UpdateShoppingHelperObject(txtHotelName.Text, txtCity.Text, txtStartDate.Text, txtEndDate.Text);
        Response.Redirect(Route.GetRootPath("hotels/search.aspx"));
        ListItem first = this.ddlStart.Items[0];
        this.ddlStart.Items.Clear();
        this.ddlStart.Items.Add(first);
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
        ///

        _ShoppingHelper = GetShoppingHelperObject();
        if (data == null)
        {
            var supplierHotelObjectHelper = new SupplierHotelObjectHelper(_ShoppingHelper.HotelDetails, newSearch);
            if (this.ddlStart.Text == "ALL")
                data = supplierHotelObjectHelper.GetHotels();
            else
                data = supplierHotelObjectHelper.GetHotelsByStars(this.ddlStart.Text);
        }
        if (this.ddlStart.Text == "ALL")
            data = FilterByStars(data);
        else
            data = FilterByStarsName(data);
        data = SupplierHotelObjectSortHelper.Sort(data, ddlSort.SelectedValue);
        rptrHotels.DataSource = data.Skip((page - 1) * pageSize).Take(pageSize);
        rptrHotels.DataBind();
        this.Pager.TotalPages =
        (data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        //this.Pager1.TotalPages =
        //(data.Count / pageSize) + (data.Count % pageSize > 0 ? 1 : 0);
        this.Pager.GenerateLinks();
        //this.Pager1.GenerateLinks();
        ///






    }

    protected void BindStarRatingsRepeater()
    {
        _meis007Entities = new meis007Entities();
        rptrStarRatings.DataSource = _meis007Entities.Classifications.Where(x => x.ServiceID == 1).OrderBy(x => x.ClsName).ToList();
        rptrStarRatings.DataBind();
    }

    protected void EnableOrDisableStarRatingCheckBoxes(List<SupplierHotelHelper> data)
    {
        foreach (RepeaterItem item in rptrStarRatings.Items)
        {
            var chkBox = item.FindControl("chkBoxStar") as CheckBox;
            var hotel = data.Where(x => x.ProductStarsName == chkBox.Text).FirstOrDefault();
            chkBox.Enabled = hotel == null ? false : true;
            chkBox.Checked = hotel == null ? false : true;
            if (chkBox.Checked)
            {
                this.ddlStart.Items.Add(new ListItem(hotel.ProductStarsName.ToString()));
            }
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

    protected List<SupplierHotelHelper> FilterByStarsName(List<SupplierHotelHelper> data)
    {
        List<SupplierHotelHelper> filteredData = new List<SupplierHotelHelper>();

        foreach (var x in data)
        {
            if (x.ProductStarsName == this.ddlStart.Text)
            {
                filteredData.Add(x);

            }
        }

        return filteredData;
    }

    protected void ddlStars_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateDataSource(1, this.Pager.PageSize, false);
        UpdatePanelHotelList.Update();
    }


}