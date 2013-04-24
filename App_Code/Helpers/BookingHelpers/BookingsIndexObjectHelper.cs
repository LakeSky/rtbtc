using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

/// <summary>
/// Summary description for BookingsIndexObjectHelper
/// </summary>
public static class BookingsIndexObjectHelper
{
    public static List<BookingIndex> GetBookings(long bookingId)
    {
        BookingIndex bookingIndex;
        BookingIndexGuest bookingIndexGuest;
        List<BookingIndex> bookingIndexList = new List<BookingIndex>();
        List<long> bookingIds = new List<long>();
        var _meis007Entities = new meis007Entities();
        var id = CurrentUser.Id();
        var room = string.Empty;
        var guests = string.Empty;
        var defaultImage = _meis007Entities.ProductImages.First().ImageAddress;
        var defaultImagePath = string.Empty;

        var data = from bg in _meis007Entities.BkgMasters
                   join pd in _meis007Entities.PaxDetails
                   on bg.BkgID equals pd.BkgID
                   join hi in _meis007Entities.SuppliersHotelsInfoes
                   on bg.HotelInfoID equals hi.HotelInfoID
                   join pm in _meis007Entities.ProductMasters
                   on hi.LocHotelID equals pm.ProductID
                   join cl in _meis007Entities.Classifications
                   on pm.ClsID equals cl.ClsID
                   join ci in _meis007Entities.CityMasters
                   on pm.CityID equals ci.CityID
                   join co in _meis007Entities.CountryMasters
                   on ci.CountryID equals co.CountryID
                   where pd.BkgID != null && bg.CustConsultantID == id && bg.BkgID == bookingId
                   orderby bg.BkgID
                   select new
                   {
                       Id = bg.BkgID,
                       Date = bg.BkgDate,
                       From = bg.CheckIN,
                       To = bg.checkOUT,
                       Nights = bg.NoOfNights,
                       Adults = bg.Adults,
                       Kids = bg.Children,
                       Infants = bg.Infants,
                       AvgAmount = hi.AvrNightPrice,
                       Amount = bg.CustomerDisplayPrice,
                       RoomType = hi.RoomType,
                       RoomName = hi.RoomName,
                       buffet = hi.BBName,
                       StarsImage = cl.ImagePath,
                       DefaultImage = pm.ProductImages.FirstOrDefault(),
                       City = ci.CityName,
                       Country = co.CountryName,
                       HotelName = pm.ProductName,
                       Name = pd.PaxName
                   };

        foreach (var x in data) {
            bookingIndexGuest = new BookingIndexGuest { name = x.Name };
            if (bookingIds.Contains(x.Id))
            {
                bookingIndex = bookingIndexList.Where(y => y.bookingId == x.Id).First();
                bookingIndex.guestDetails.Add(bookingIndexGuest);
            }
            else {
                room = x.RoomType + " - " + x.RoomName;
                defaultImagePath = x.DefaultImage == null ? defaultImage : x.DefaultImage.ImageAddress;
                if(!string.IsNullOrEmpty(x.buffet)){
                    room = room + " - " + x.buffet;
                }
                if (x.Adults != null && x.Adults > 0) {
                    guests = x.Adults.ToString() + " Adults ";
                }
                if (x.Kids != null && x.Kids > 0)
                {
                    guests = guests + x.Kids.ToString() + " Kids ";
                }
                if (x.Infants != null && x.Infants > 0)
                {
                    guests = guests + x.Infants.ToString() + " Infants ";
                }

                bookingIndex = new BookingIndex { 
                    bookingId = x.Id,
                    name = x.HotelName,
                    city = x.City,
                    country = x.Country,
                    starsImagePath = x.StarsImage,
                    defaultImagePath = defaultImagePath,
                    stay =  DateTime.Parse(x.From.ToString()).ToString("dd MMM yy") + " - " + DateTime.Parse(x.To.ToString()).ToString("dd MMM yy"),
                    room = room,
                    guests = guests,
                    pricePerPassenger = Math.Floor(decimal.Parse(x.AvgAmount.ToString())),
                    totalPrice = Math.Floor(decimal.Parse(x.Amount.ToString()))
                };
                bookingIndex.guestDetails.Add(bookingIndexGuest);
                bookingIds.Add(x.Id);
                bookingIndexList.Add(bookingIndex);
            }
        }
        return bookingIndexList;
    }
	
}
