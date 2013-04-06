using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SupplierHotelObjectHelper
/// </summary>
public class SupplierHotelObjectHelperTest
{
    int supplierHotelId;
    int supplierHotelRoomId;
    int supplierId;
    long productMasterId;
    string city;
    string starsImagePath;
    string xmlHotelId;
    string imagePath;
    decimal price;
    string sortBy;
    string defaultImagePath;
    long hotelInfoId;
    List<long> productMasterIds;
    List<SupplierHotelHelper> supplierHotels;
    SupplierHotelHelper supplierHotelHelper;
    SupplierHotelRoomHelper supplierHotelRoomHelper;
    meis007Entities _meis007Entities;
    XMLSupplier xmlSupplier;
    XMLHotel xmlHotel;
    ProductMaster productMaster;
    SqlConnection _sqlConnection;
    SqlCommand _sqlCommand;
    SqlDataReader _sqlDataReader;
    public SupplierHotelObjectHelperTest(string _sortBy = "plf")
    {
        productMasterIds = new List<long>();
        supplierHotels = new List<SupplierHotelHelper>();
        _meis007Entities = new meis007Entities();
        sortBy = _sortBy;
    }

    public List<SupplierHotelHelper> GetHotels()
    {
        defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;
        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        _sqlCommand = new SqlCommand("spProductMasterTest", _sqlConnection);
        _sqlCommand.CommandType = CommandType.StoredProcedure;
        _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            
            var t = _sqlDataReader["ProductName"];
            supplierHotelRoomId = int.Parse(_sqlDataReader["RoomID"].ToString());
            supplierHotelId = int.Parse(_sqlDataReader["HotelID"].ToString());
            productMasterId = long.Parse(_sqlDataReader["ProductID"].ToString());
            price = decimal.Parse("0.0");
            hotelInfoId = long.Parse(_sqlDataReader["HotelInfoID"].ToString());
            if (_sqlDataReader["LCAP"] != null)
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
                supplierHotelHelper = new SupplierHotelHelper { Id = hotelInfoId, SessionId = _sqlDataReader["SessionID"].ToString(), SupplierId = _sqlDataReader["SupplierID"].ToString(), ProductName = _sqlDataReader["ProductName"].ToString(), City = _sqlDataReader["CityName"].ToString(), ProdcutDescription = _sqlDataReader["ShortDescription"].ToString(), ProductMasterId = productMasterId, ProductStarsName = _sqlDataReader["ClsName"].ToString(), ProductStarsImagePath = _sqlDataReader["StarImagesPath"].ToString(), ProductImagePath = imagePath };
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
        supplierHotels = Sort();
        return supplierHotels;
    }

    protected List<SupplierHotelHelper> Sort()
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