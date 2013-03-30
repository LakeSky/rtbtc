using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShoppingHotelHelper
/// </summary>
public class ShoppingHotelHelper
{
    public string CityName { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public List<ShoppingRoomHelper> RoomDetails { get; set; }
}