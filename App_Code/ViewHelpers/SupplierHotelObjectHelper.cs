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
    List<int> supplierHotelIds;
    List<SupplierHotelHelper> supplierHotels;
    SupplierHotelHelper supplierHotelHelper;
    SupplierHotelRoomHelper supplierHotelRoomHelper;
    meis007Entities _meis007Entities;
    XMLSupplier xmlSupplier;
    XMLHotel xmlHotel;
    ProductMaster productMaster;

	public SupplierHotelObjectHelper()
	{
        supplierHotelIds = new List<int>();
        supplierHotels = new List<SupplierHotelHelper>();
        _meis007Entities = new meis007Entities();
	}

    public List<SupplierHotelHelper> GetHotels()
    {
        foreach (var x in _meis007Entities.SuppliersHotelsInfoes)
        {
            if (x.HotelID != null)
            {
                supplierHotelId = int.Parse(x.HotelID.ToString());
                xmlSupplier = _meis007Entities.XMLSuppliers.Where(y => y.InternalSupplierID == x.SupplierID).FirstOrDefault();
                if (xmlSupplier != null)
                {
                    xmlHotelId = x.HotelID.ToString();
                    xmlHotel = _meis007Entities.XMLHotels.Where(y => y.XMLSupplierID == xmlSupplier.SupplierID).Where(y => y.XMLhotelid == xmlHotelId).FirstOrDefault();
                    if (xmlHotel != null)
                    {
                        productMasterId = long.Parse(xmlHotel.LocHotelid);
                        productMaster = _meis007Entities.ProductMasters.Where(y => y.ProductID == productMasterId).FirstOrDefault();
                        if (productMaster != null)
                        {
                            city = QueryHelper.GetCityName(_meis007Entities, productMaster.CityID);
                            if (productMaster.ClsID == null)
                            {
                                var classification = _meis007Entities.Classifications.Where(y => y.ClsName == "1").First();
                                starsImagePath = classification.ImagePath;
                            }
                            else
                            {
                                starsImagePath = productMaster.Classification.ImagePath;
                            }
                            imagePath = "";
                            if (productMaster.ProductImages.Count > 0)
                            {
                                imagePath = productMaster.ProductImages.First().ImageAddress;
                            }
                            supplierHotelRoomId = int.Parse(x.RoomID.ToString());
                            supplierHotelRoomHelper = new SupplierHotelRoomHelper { HotelInfoId = x.HotelInfoID, RoomId = supplierHotelRoomId, RoomName = x.RoomName, RoomType = x.RoomType, Price = x.LCAP };
                            if (supplierHotelIds.Contains(supplierHotelId))
                            {
                                supplierHotelHelper = supplierHotels.Where(p => p.SupplierHotelId == supplierHotelId).First();
                                supplierHotelHelper.Rooms.Add(supplierHotelRoomHelper);
                            }
                            else
                            {
                                supplierHotelHelper = new SupplierHotelHelper { Id = x.HotelInfoID, SupplierHotelId = supplierHotelId, SessionId = x.SessionID, SupplierId = x.SupplierID, ProductName = productMaster.ProductName, City = city, ProdcutDescription = productMaster.ShortDescription, ProductMasterId = productMasterId, ProductStarsImagePath = starsImagePath, ProductImagePath = imagePath };
                                var rooms = new List<SupplierHotelRoomHelper>();
                                rooms.Add(supplierHotelRoomHelper);
                                supplierHotelHelper.Rooms = rooms;
                                supplierHotels.Add(supplierHotelHelper);
                                supplierHotelIds.Add(supplierHotelId);
                            }
                        }
                    }
                }
            }
        }
        foreach (var x in supplierHotels) {
            x.BasicPrice = Math.Floor(decimal.Parse(x.Rooms.Where(y => y.Price != null).OrderBy(y => y.Price).First().Price.ToString())).ToString();
        }
        return supplierHotels;
    }
}