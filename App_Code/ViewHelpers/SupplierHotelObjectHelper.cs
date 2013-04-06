using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

/// <summary>
/// Summary description for SupplierHotelObjectHelper
/// </summary>
public class SupplierHotelObjectHelper
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
    string defaultImagePath;
    List<long> productMasterIds;
    List<SupplierHotelHelper> supplierHotels;
    SupplierHotelHelper supplierHotelHelper;
    SupplierHotelRoomHelper supplierHotelRoomHelper;
    meis007Entities _meis007Entities;
    XMLSupplier xmlSupplier;
    XMLHotel xmlHotel;
    ProductMaster productMaster;

    public SupplierHotelObjectHelper()
    {
        productMasterIds = new List<long>();
        supplierHotels = new List<SupplierHotelHelper>();
        _meis007Entities = new meis007Entities();
    }

    public List<SupplierHotelHelper> GetHotels()
    {
        defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;
        var data = from shi in _meis007Entities.SuppliersHotelsInfoes
                   join pm in _meis007Entities.ProductMasters
                   on shi.LocHotelID equals pm.ProductID
                   join ci in _meis007Entities.CityMasters
                   on pm.CityID equals ci.CityID
                   join cl in _meis007Entities.Classifications
                   on pm.ClsID equals cl.ClsID
                   select new { HotelInfoId = shi.HotelInfoID, RoomId = shi.RoomID, RoomName = shi.RoomName, RoomType = shi.RoomType, Price = shi.LCAP, SupplierHotelId = shi.HotelID, SessionId = shi.SessionID, SupplierId = shi.SupplierID, NoOfPassengers = shi.NumOfPassengers, ProductName = pm.ProductName, City = ci.CityName, ProductDescription = pm.ShortDescription, ProductMaterId = pm.ProductID, ProductStarsName = cl.ClsName, ProductStartsImagePath = cl.ImagePath, ImagesCount = pm.ProductImages.Count, ProductMaster = pm };
        foreach (var x in data)
        {
            supplierHotelRoomId = int.Parse(x.RoomId.ToString());
            supplierHotelId = int.Parse(x.SupplierHotelId.ToString());
            price = decimal.Parse("0.0");
            if (x.Price != null)
            {
                price = Math.Floor(decimal.Parse(x.Price.ToString()) / int.Parse(x.NoOfPassengers.ToString()));
            }
            supplierHotelRoomHelper = new SupplierHotelRoomHelper { HotelInfoId = x.HotelInfoId, RoomId = supplierHotelRoomId, RoomName = x.RoomName, RoomType = x.RoomType, Price = price };
            if (productMasterIds.Contains(x.ProductMaterId))
            {
                supplierHotelHelper = supplierHotels.Where(p => p.ProductMasterId == x.ProductMaterId).First();
                supplierHotelHelper.Rooms.Add(supplierHotelRoomHelper);
            }
            else
            {
                imagePath = x.ImagesCount > 0 ? x.ProductMaster.ProductImages.First().ImageAddress : defaultImagePath;
                supplierHotelHelper = new SupplierHotelHelper { Id = x.HotelInfoId, SessionId = x.SessionId, SupplierId = x.SupplierId, ProductName = x.ProductName, City = x.City, ProdcutDescription = x.ProductDescription, ProductMasterId = x.ProductMaterId, ProductStarsName = x.ProductStarsName, ProductStarsImagePath = x.ProductStartsImagePath, ProductImagePath = imagePath };
                var rooms = new List<SupplierHotelRoomHelper>();
                rooms.Add(supplierHotelRoomHelper);
                supplierHotelHelper.Rooms = rooms;
                supplierHotels.Add(supplierHotelHelper);
                productMasterIds.Add(x.ProductMaterId);
            }
        }
        foreach (var x in supplierHotels)
        {
            x.BasicPrice = int.Parse(Math.Floor(decimal.Parse(x.Rooms.Where(z => z.Price != null).OrderBy(z => z.Price).First().Price.ToString())).ToString());
            x.Rooms = x.Rooms.OrderBy(z => z.RoomName).ToList();
        }
        return supplierHotels;
    }
}

public static class  SupplierHotelObjectSortHelper
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