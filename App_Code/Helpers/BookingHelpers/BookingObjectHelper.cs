using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

/// <summary>
/// Summary description for BookingObjectHelper
/// </summary>
public static class BookingObjectHelper
{
    public static BookingHotelDetails GetHotelDetails(meis007Entities _meis007Entities, long supplierHotelInfoId, ShoppingHelper _shoppingHelper)
    {
        var NoOfPassengers = 0;
        decimal price = decimal.Parse("0");
        List<BookingGuestDetails> bookingGuestDetails = BookingObjectHelper.GetGuests(_shoppingHelper);
        var defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;

        var data = (from pm in _meis007Entities.ProductMasters
                   join shi in _meis007Entities.SuppliersHotelsInfoes on pm.ProductID equals shi.LocHotelID
                   join ci in _meis007Entities.CityMasters on pm.CityID equals ci.CityID
                   join cl in _meis007Entities.Classifications on pm.ClsID equals cl.ClsID
                   //join pi in _meis007Entities.ProductImages on pm.ProductID equals pi.ProductID into productImages
                   //from pi in productImages.DefaultIfEmpty()
                   where shi.HotelInfoID == supplierHotelInfoId
                   select new
                   {
                       HotelInfoId = shi.HotelInfoID,
                       ProductName = pm.ProductName,
                       City = ci.CityName,
                       ProductStarsImagePath = cl.ImagePath,
                       ProductDefaultImagePath = "",
                       Price = shi.LCAP,
                       NoOfPassengers = shi.NumOfPassengers,
                       RoomType = shi.RoomType,
                       RoomName = shi.RoomName
                   }).First();

        if(data.NoOfPassengers != null){
            NoOfPassengers = int.Parse(data.NoOfPassengers.ToString());
        }else{
            NoOfPassengers = bookingGuestDetails.Where(x => x.type != "Infants").Count();
        }

        if(data.Price != null){
          price = Math.Floor(decimal.Parse(data.Price.ToString())/NoOfPassengers);
        }

        var guests = bookingGuestDetails.Where(x => x.type == "Adult").Count().ToString() + " Adults "
            + bookingGuestDetails.Where(x => x.type == "Children").Count().ToString()
            + " Children " + bookingGuestDetails.Where(x => x.type == "Infant").Count().ToString() + " Infants";

        var totalPrice = price * (bookingGuestDetails.Where(x => x.type == "Adult").Count() + bookingGuestDetails.Where(x => x.type == "Children").Count());
        defaultImagePath = string.IsNullOrEmpty(data.ProductDefaultImagePath) ? defaultImagePath : data.ProductDefaultImagePath;
        BookingHotelDetails bookingHotelDetails = new BookingHotelDetails { hotelInfoId = supplierHotelInfoId, productName = data.ProductName, cityName = data.City, 
            productStarsImagePath = data.ProductStarsImagePath, productDefaultImagePath = defaultImagePath, pricePerPassenger = price,
            stay = (_shoppingHelper.HotelDetails.FromDate + " to " + _shoppingHelper.HotelDetails.ToDate), guests = guests, room = data.RoomType + " - " + data.RoomName,
            guestDetails = bookingGuestDetails, totalPrice = totalPrice, fromDate = _shoppingHelper.HotelDetails.FromDate, toDate = _shoppingHelper.HotelDetails.ToDate  };
        
        return bookingHotelDetails;
    }

    public static List<BookingGuestDetails> GetGuests(ShoppingHelper _shoppingHelper)
    {
        List<BookingGuestDetails> bookingGuestDetails = new List<BookingGuestDetails>();
        BookingGuestDetails bookingGuestDetail;
        int[] childAges;

        TempGuestType tempGuestType;
        List<TempGuestType> tempGuestTypeList = new List<TempGuestType>(); ;
        foreach (var x in _shoppingHelper.HotelDetails.RoomDetails)
        {
            if (x.Adults != null)
            {
                for (int i = 0; i < x.Adults; i++)
                {
                    tempGuestType = new TempGuestType { type = "Adult", age = "-" };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }
            if (x.Kids != null)
            {
                childAges = x.ChildAge.ToArray();
                for (int i = 0; i < x.Kids; i++)
                {
                    tempGuestType = new TempGuestType { type = "Children", age = childAges[i].ToString() };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }

            if (x.Infants != null)
            {
                childAges = x.ChildAge.ToArray();
                for (int i = 0; i < x.Infants; i++)
                {
                    tempGuestType = new TempGuestType { type = "Infant", age = "-" };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }
        }
        foreach (var x in tempGuestTypeList.OrderBy(g => g.type)) {
            bookingGuestDetail = new BookingGuestDetails { type = x.type, age = x.age };
            bookingGuestDetails.Add(bookingGuestDetail);
        }
        return bookingGuestDetails;
    }
	
}

public class TempGuestType {
    public string type { get; set; }
    public string age { get; set; }
}

