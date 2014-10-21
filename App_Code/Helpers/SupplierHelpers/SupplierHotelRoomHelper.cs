using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SupplierHotelRoomHelper
/// </summary>
public class SupplierHotelRoomHelper
{
    public long HotelInfoId { get; set; }
    public int NumberOfPassengers { get; set; }
    public string RoomId { get; set; }
    public string SupplierName { get; set; }
    public string RoomType { get; set; }
    public string RoomName { get; set; }
    public decimal? Price { get; set; }
    public string FormattedPrice { get; set; }
}