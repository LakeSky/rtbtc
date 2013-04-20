using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using RTCDataModel.RTCEntities;
using RTCModel.Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SupplierHotelObjectHelper
/// </summary>
public class SupplierHotelObjectHelper
{
    int searchId;
    int supplierHotelId;
    int supplierHotelRoomId;
    long productMasterId;
    long hotelInfoId;
    string status;
    string imagePath;
    decimal price;
    string defaultImagePath;
    bool searchNew;
    List<long> productMasterIds;
    ShoppingHotelHelper shoppingHotelHelper;
    List<SupplierHotelHelper> supplierHotels;
    SupplierHotelHelper supplierHotelHelper;
    SupplierHotelRoomHelper supplierHotelRoomHelper;
    meis007Entities _meis007Entities;
    SqlConnection _sqlConnection;
    SqlCommand _sqlCommand;
    SqlDataReader _sqlDataReader;
    public SupplierHotelObjectHelper(ShoppingHotelHelper obj, bool newSearch)
    {
        productMasterIds = new List<long>();
        supplierHotels = new List<SupplierHotelHelper>();
        _meis007Entities = new meis007Entities();
        shoppingHotelHelper = obj;
        searchNew = newSearch;
    }

    public List<SupplierHotelHelper> GetHotels()
    {
        searchId = shoppingHotelHelper.SearchId;
        if (searchNew || string.IsNullOrEmpty(shoppingHotelHelper.SearchId.ToString()) || shoppingHotelHelper.SearchId == 0) {
            searchId = GetSearchId();
            shoppingHotelHelper.SearchId = searchId;
        }
        defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;
        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        _sqlCommand = new SqlCommand("spProductMasterTest", _sqlConnection);
        _sqlCommand.CommandType = CommandType.StoredProcedure;
        _sqlCommand.Parameters.AddWithValue("@Trans", "SearchBySession");
        _sqlCommand.Parameters.AddWithValue("@SessionId", shoppingHotelHelper.SessionId);
        _sqlCommand.Parameters.AddWithValue("@SearchId", searchId);
        _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            supplierHotelRoomId = int.Parse(_sqlDataReader["RoomID"].ToString());
            supplierHotelId = int.Parse(_sqlDataReader["HotelID"].ToString());
            productMasterId = long.Parse(_sqlDataReader["ProductID"].ToString());
            price = decimal.Parse("0.0");
            hotelInfoId = long.Parse(_sqlDataReader["HotelInfoID"].ToString());
            if (_sqlDataReader["LCAP"] != null && _sqlDataReader["NumOfPassengers"] != null && _sqlDataReader["NumOfPassengers"].ToString() != "0")
            {
                price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / int.Parse(_sqlDataReader["NumOfPassengers"].ToString()));
            }
            supplierHotelRoomHelper = new SupplierHotelRoomHelper { HotelInfoId = hotelInfoId, RoomId = supplierHotelRoomId, RoomName = _sqlDataReader["RoomName"].ToString(), RoomType = _sqlDataReader["RoomType"].ToString(), Price = price };
            if (productMasterIds.Contains(productMasterId))
            {
                supplierHotelHelper = supplierHotels.Where(p => p.ProductMasterId == productMasterId).First();
                supplierHotelHelper.Rooms.Add(supplierHotelRoomHelper);
            }
            else
            {
                imagePath = string.IsNullOrEmpty(_sqlDataReader["DefaultImagePath"].ToString()) ? defaultImagePath : _sqlDataReader["DefaultImagePath"].ToString();
                supplierHotelHelper = new SupplierHotelHelper { Id = hotelInfoId, SessionId = _sqlDataReader["SessionID"].ToString(), SearchId = searchId, SupplierId = _sqlDataReader["SupplierID"].ToString(), ProductName = _sqlDataReader["ProductName"].ToString(), City = _sqlDataReader["CityName"].ToString(), ProdcutDescription = _sqlDataReader["ShortDescription"].ToString(), ProductMasterId = productMasterId, ProductStarsName = _sqlDataReader["ClsName"].ToString(), ProductStarsImagePath = _sqlDataReader["StarImagesPath"].ToString(), ProductImagePath = imagePath };
                var rooms = new List<SupplierHotelRoomHelper>();
                rooms.Add(supplierHotelRoomHelper);
                supplierHotelHelper.Rooms = rooms;
                supplierHotels.Add(supplierHotelHelper);
                productMasterIds.Add(productMasterId);
            }
        }
        _sqlConnection.Close();
        foreach (var x in supplierHotels)
        {
            x.BasicPrice = int.Parse(Math.Floor(decimal.Parse(x.Rooms.Where(z => z.Price != null).OrderBy(z => z.Price).First().Price.ToString())).ToString());
            x.Rooms = x.Rooms.OrderBy(z => z.RoomName).ToList();
        }
        return supplierHotels;
    }

    protected int GetSearchId() {
        SearchEntity _search = new SearchEntity();
        _search.Destination = "DXB";
        _search.CheckIn = DateTimeHelper.customFormat(shoppingHotelHelper.FromDate);
        _search.CheckOut = DateTimeHelper.customFormat(shoppingHotelHelper.ToDate);
        _search.AdultCount = shoppingHotelHelper.RoomDetails.Select(x => x.Adults).Sum();
        List<int> lstAges = new List<int>();
        foreach (var x in shoppingHotelHelper.RoomDetails) {
            foreach (var y in x.ChildAge) {
                lstAges.Add(y);
            }
        }
        int[] ages =  lstAges.Count == 0 ? null : lstAges.ToArray();
        _search.ChildCount = lstAges.Count;
        _search.ChildAges = ages;
        _search.CustomerID = "1015";//DbParameter.GetCustomerId();
        status = string.Empty;
        RepositoryFactory supplierFactory = new RepositoryFactory(_search, shoppingHotelHelper.SessionId);
        return supplierFactory.GetSuppliersHotelsInfo(out status);
    }

}

public static class SupplierHotelObjectSortHelper
{
    public static List<SupplierHotelHelper> Sort(List<SupplierHotelHelper> supplierHotels, string sortBy)
    {
        List<SupplierHotelHelper> sortedList;
        if (sortBy == "phf")
        {
            sortedList = supplierHotels.OrderByDescending(x => x.BasicPrice).ToList();
        }
        else if (sortBy == "aa")
        {
            sortedList = supplierHotels.OrderBy(x => x.ProductName).ToList();
        }
        else if (sortBy == "ad")
        {
            sortedList = supplierHotels.OrderByDescending(x => x.ProductName).ToList();
        }
        else
        {
            sortedList = supplierHotels.OrderBy(x => x.BasicPrice).ToList();
        }
        return sortedList;
    }

}