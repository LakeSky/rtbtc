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
    List<int> supplierHotelIds;
    List<SupplierHotelHelper> supplierHotels;
    SupplierHotelHelper supplierHotelHelper;
    SupplierHotelRoomHelper supplierHotelRoomHelper;
    int supplierHotelId;
    int supplierHotelRoomId;
    protected meis007Entities _meis007Entities;

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
                supplierHotelRoomId = int.Parse(x.RoomID.ToString());
                supplierHotelRoomHelper = new SupplierHotelRoomHelper { HotelInfoId = x.HotelInfoID, RoomId = supplierHotelRoomId, RoomName = x.RoomName, RoomType = x.RoomType, Price = x.LCAP };
                if (supplierHotelIds.Contains(supplierHotelId))
                {
                    supplierHotelHelper = supplierHotels.Where(p => p.SupplierHotelId == supplierHotelId).First();
                    supplierHotelHelper.Rooms.Add(supplierHotelRoomHelper);
                }
                else
                {
                    supplierHotelHelper = new SupplierHotelHelper { Id = x.HotelInfoID, SupplierHotelId = supplierHotelId, SessionId = x.SessionID, SupplierId = x.SupplierID };
                    var rooms = new List<SupplierHotelRoomHelper>();
                    rooms.Add(supplierHotelRoomHelper);
                    supplierHotelHelper.Rooms = rooms;
                    supplierHotels.Add(supplierHotelHelper);
                    supplierHotelIds.Add(supplierHotelId);
                }
            }
        }
        return supplierHotels;
    }
}