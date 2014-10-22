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
    public dynamic shoppingHotelDetailDynamic;
    public string fromDate;
    public string toDate;
    public string hotelName, cityName, countryName, starsImagePath, address, latitude, longitude, requestFrom;
    string supplierid, masterCurrencyValue, roomName = "";
    int totalRoomsBook, totalRoomsChecked, index;
    meis007Entities _meis007Entities;
    BasketHotelDetails basketHotelDetailsObj;
    CityMaster _city;
    CountryMaster _country;
    ProductMaster productMaster;
    CheckBox ckbRoomCheckP;
    HiddenField hdnFldHotelInfoIdP;
    Button btnBookP;
    ShoppingHelper _objShoppingHelper;
    List<long> _lstHotelInfoIdChecked;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            masterCurrencyValue = GetMasteCurrencySelectedValue();
            _meis007Entities = new meis007Entities();
            var id = (string)(Request.QueryString["id"]);
            var found = false;
            dynamic expando = CheckRequestFromValid();
            fromSearchDiv.Visible = fromBasketDiv.Visible = false;
            if (expando.valid && id != null)
            {
                var productId = int.Parse(id);
                productMaster = _meis007Entities.ProductMasters.Where(x => x.ProductID == productId).FirstOrDefault();
                hdnFldTotalRoomsBook.Value = "0";
                if (productMaster != null)
                {
                    lblHotelName.Text = productMaster.ProductName;
                    lblAddress.Text = productMaster.Address;
                    hdnFldAddress.Value = productMaster.Address;
                    hdnFldHotelName.Value = productMaster.ProductName;
                    _city = _meis007Entities.CityMasters.Where(x => x.CityID == productMaster.CityID).FirstOrDefault();
                    if (_city != null)
                    {
                        hdnFldCityName.Value = _city.CityName;
                        lblCityName.Text = _city.CityName;
                    }
                    _country = _meis007Entities.CountryMasters.Where(x => x.CountryID == productMaster.CountryID).FirstOrDefault();
                    if (_country != null)
                    {
                        hdnFldCountryName.Value = _country.CountryName;
                        lblCountryName.Text = _country.CountryName;
                    }
                    hdnFldLatitude.Value = string.IsNullOrEmpty(productMaster.Latitude) ? "24.711666" : productMaster.Latitude;
                    hdnFldLongitude.Value = string.IsNullOrEmpty(productMaster.Longitude) ? "46.724166" : productMaster.Longitude;
                    if (productMaster.ClsID == null)
                    {
                        var classification = _meis007Entities.Classifications.Where(x => x.ClsName == "1").First();
                        imgStars.Src = classification.ImagePath;
                        hdnFldStarsImagePath.Value = classification.ImagePath;
                    }
                    else
                    {
                        imgStars.Src = productMaster.Classification.ImagePath;
                        hdnFldStarsImagePath.Value = imgStars.Src;
                    }
                    found = true;
                    List<SupplierHotelRoomHelper> data;
                    if (requestFrom == "search")
                    {
                        data = RoomObjectHelper.GetHotelRooms(expando.hotelInfoId, _meis007Entities, null, masterCurrencyValue);
                        shoppingHotelDetailDynamic = expando.shoppingHotelDetails.formattedSearchText();
                        lblSHCity.Text = shoppingHotelDetailDynamic.city;
                        lblSHDate.Text = shoppingHotelDetailDynamic.dates;
                        lblSHNights.Text = shoppingHotelDetailDynamic.nights;
                        lblSHGuest.Text = shoppingHotelDetailDynamic.guestDetails;
                        fromDate = expando.shoppingHotelDetails.FromDate;
                        toDate = expando.shoppingHotelDetails.ToDate;
                        fromBasketDiv.Visible = false;
                        fromSearchDiv.Visible = true;
                        hdnFldTotalRoomsBook.Value = expando.shoppingHotelDetails.RoomDetails.Count.ToString();
                    }
                    else
                    {
                        data = RoomObjectHelper.GetHotelRooms(expando.hotelInfoId, null, expando.basketHelper, masterCurrencyValue);
                        roomName = data.First().RoomName;
                        supplierid = data.First().SupplierName;
                        long hotelInfoId = expando.hotelInfoId;
                        BasketHelper basketHelper = expando.basketHelper;
                        BasketHotelDetails basketHotelDetails = basketHelper.hotelDetails.Where(x => x.hotelInfoId == hotelInfoId).First();
                        fromDate = basketHotelDetails.fromDate.ToString();
                        toDate = basketHotelDetails.toDate.ToString();
                        lblBHDStay.Text = basketHotelDetailsObj.stay;
                        lblBHDGuest.Text = basketHotelDetailsObj.guests;
                        lblBHDRoom.Text = basketHotelDetailsObj.room;
                        lblBHDtotalPrice.Text =
                            ApplicationObject.GetMasterCurrency(masterCurrencyValue) + " " +
                            ApplicationObject.FormattedCurrencyDisplayPrice(basketHotelDetailsObj.totalPrice, masterCurrencyValue);
                        fromSearchDiv.Visible = false;
                        fromBasketDiv.Visible = true;
                    }
                    lblProductShortDescription.Text = productMaster.ShortDescription;
                    rptrRooms.DataSource = data;
                    rptrRooms.DataBind();
                    BindProductAmenities();
                    BindRoomFacilites();
                    BindProductImages();
                    hdnFldFromDate.Value = fromDate.ToString();
                    hdnFldToDate.Value = toDate.ToString();
                }
            }
            if (!found)
            {
                Session["ErrorMessage"] = "Hotel not found";
                Response.Redirect(Route.GetRootPath("home.aspx"));
                return;
            }
            AssignPublicVariables();
        }
    }

    protected void ckbBookRoom_CheckedChanged(object sender, EventArgs e)
    {
        requestFrom = "search";
        fromDate = hdnFldFromDate.Value;
        toDate = hdnFldToDate.Value;
        totalRoomsChecked = 0;
        totalRoomsBook = int.Parse(hdnFldTotalRoomsBook.Value);
        foreach (RepeaterItem item in rptrRooms.Items)
        {
            hdnFldHotelInfoIdP = (HiddenField)item.FindControl("hdnFldHoyelInfoId");
            ckbRoomCheckP = (CheckBox)item.FindControl("ckbBookRoom");
            if (ckbRoomCheckP.Checked)
            {
                totalRoomsChecked += 1;
            }
        }
        btnBookP = (Button)rptrRooms.Controls[rptrRooms.Controls.Count - 1].Controls[0].FindControl("btnBook");
        btnBookP.Enabled = totalRoomsChecked == totalRoomsBook;
    }

    protected void btnBook_Click(object sender, EventArgs e)
    {
         _objShoppingHelper =  GetShoppingHelperObject();
        if (_objShoppingHelper == null || _objShoppingHelper.HotelDetails == null)
        {
            Session["ErrorMessage"] = "Please select hotel first!";
            Response.Redirect("search.aspx");
            return;
        }
        _lstHotelInfoIdChecked = new List<long>();
        foreach (RepeaterItem item in rptrRooms.Items)
        {
            hdnFldHotelInfoIdP = (HiddenField)item.FindControl("hdnFldHoyelInfoId");
            ckbRoomCheckP = (CheckBox)item.FindControl("ckbBookRoom");
            if (ckbRoomCheckP.Checked)
            {
                _lstHotelInfoIdChecked.Add(long.Parse(hdnFldHotelInfoIdP.Value));
            }
        }
        index = 0;
        foreach (var x in _objShoppingHelper.HotelDetails.RoomDetails)
        {
            x.HotelInfoId = _lstHotelInfoIdChecked[index];
            index += 1;
        }
        Response.Redirect("book.aspx");
    }

    dynamic CheckRequestFromValid()
    {
        requestFrom = (string)Request.QueryString["from"];
        hdnFldRequestFrom.Value = requestFrom;
        long hotelInfoId;
        dynamic expando = new ExpandoObject();
        if (!long.TryParse(Request.QueryString["sid"], out hotelInfoId) || (requestFrom != "search" && requestFrom != "basket"))
        {
            expando.valid = false;
            return expando;
        }
        expando.hotelInfoId = hotelInfoId;
        expando.valid = true;
        if (requestFrom == "search")
        {
            var obj = GetShoppingHotelDetailsObject();
            if (!obj.valid)
            {
                expando.valid = false;
                return expando;
            }
            expando.shoppingHotelDetails = obj.shoppingHotelDetails;
            return expando;
        }
        BasketHelper basketHelper = GetBasketHelperObject();
        if (!hasHotelsInBasket(basketHelper))
        {
            expando.valid = false;
            return expando;
        }
        expando.basketHelper = basketHelper;
        basketHotelDetailsObj = basketHelper.hotelDetails.Where(x => x.hotelInfoId == hotelInfoId).First();
        return expando;
    }

    void AssignPublicVariables()
    {
        address = hdnFldAddress.Value;
        cityName = hdnFldCityName.Value;
        countryName = hdnFldCountryName.Value;
        hotelName = hdnFldHotelName.Value;
        latitude = hdnFldLatitude.Value;
        longitude = hdnFldLongitude.Value;
        starsImagePath = hdnFldStarsImagePath.Value;
        requestFrom = hdnFldRequestFrom.Value;
        imgAjaxLoader.Src = Route.GetRootPath("Images/ajax-loader.gif");
    }

    void BindProductAmenities()
    {
        var productAmenties = from pa in productMaster.ProductAmenities
                              select new { Name = pa.Amenity.AmenitiesName };
        rptrHotelAmenities.DataSource = productAmenties;
        rptrHotelAmenities.DataBind();
    }


    void BindRoomFacilites()
    {
        var roomFacitlites = from pr in productMaster.ProductRRCs
                             select new
                             {
                                 RoomTypeHeaderName = pr.RoomTypeHeader.RoomTHName,
                                 RoomTypeDetailName = pr.RoomTypeDetail.RoomTDName,
                                 Facilities = pr.ProductFacilities
                             };
        rptrRoomFacilities.DataSource = roomFacitlites;
        rptrRoomFacilities.DataBind();
    }

    void BindProductImages()
    {
        var productImages = from pi in productMaster.ProductImages
                            select new
                            {
                                pi.ImageAddress
                            };
        rptrProductImages.DataSource = productImages;
        rptrProductImages.DataBind();
    }
}