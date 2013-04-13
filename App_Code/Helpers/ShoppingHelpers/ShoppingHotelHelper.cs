using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Dynamic;

/// <summary>
/// Summary description for ShoppingHotelHelper
/// </summary>
public class ShoppingHotelHelper
{
    public string CityName { get; set; }
    public string FromDate { get; set; }
    public string ToDate { get; set; }
    public List<ShoppingRoomHelper> RoomDetails { get; set; }

    public dynamic formattedSearchText() {
        dynamic obj = new ExpandoObject();
        obj.city = CityName;
        obj.dates = DateTimeHelper.customFormat(FromDate).ToString("dd MMM yy") + " to " + DateTimeHelper.customFormat(ToDate).ToString("dd MMM yy");
        int adults = 0;
        int children = 0;
        int infants = 0;
        foreach (var x in RoomDetails) {
            adults += x.Adults;
            children += x.Kids;
            infants += x.Infants;
        }
        obj.guestDetails = adults.ToString() + " Adults, " + children.ToString() + " Kids, " + infants.ToString() + " Infants";
        obj.nights = (DateTimeHelper.customFormat(ToDate) - DateTimeHelper.customFormat(FromDate)).Days.ToString() + " Night(s)";
        return obj;
    }
}