using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionRoomsHelper
/// </summary>
public class ShoppingHelper
{
    public string CityName { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public List<ShoppingRoomHelper> RoomDetails { get; set; }
}