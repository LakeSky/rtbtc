using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using RTCModel.Models;

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
                       AvgAmount = hi.AvrNightPriceSale,
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

    public static string GetCancellationFee(long bookingId, string sessionId, out string markupCancellationFee)
    {
        markupCancellationFee = string.Empty;
        string payCancellationFee = string.Empty;
        string supplierName = string.Empty;
        var id = CurrentUser.Id();
        meis007Entities _meis007Entities = new meis007Entities();
        var booking = _meis007Entities.BkgMasters.Where(x => x.BkgID == bookingId && x.CustConsultantID == id).FirstOrDefault();
        if (booking == null) {
            return payCancellationFee;
        }
        supplierName = DbParameter.GetSupplierName(booking.SupplierID.ToString());
        RepositoryFactory supplierFactory = new RepositoryFactory(null, sessionId);
        payCancellationFee = supplierFactory.GetCancelationFee(booking.SupplierConfNo, supplierName, out markupCancellationFee, int.Parse(booking.CustomerMarkup.ToString()));
        return payCancellationFee;
    }

    public static List<BasketPackageDetails> GetPackageBooking(meis007Entities _meis007Entities, BkgMaster booking)
    {
        var package = _meis007Entities.PackageHeaders.Where(x => x.PacId == booking.ProductID).First();
        var city = _meis007Entities.CityMasters.Where(x => x.CityID == package.CityId).First();
        var list = new List<BasketPackageDetails>();
        BasketPackageDetails basketPackageDetails = new BasketPackageDetails();
        basketPackageDetails.DisplayImage = package.DisplayImage;
        basketPackageDetails.PackageName = package.PacName;
        basketPackageDetails.ValidFrom = package.Validfrom;
        basketPackageDetails.ValidTo = package.Validto;
        basketPackageDetails.From = (DateTime)(booking.CheckIN);
        basketPackageDetails.PricePerPerson = double.Parse(booking.CustomerDisplayPrice.ToString());
        basketPackageDetails.TotalPrice = double.Parse(booking.SalesAmt.ToString());
        basketPackageDetails.City = city.CityName;
        basketPackageDetails.Country = city.CountryMaster.CountryName;
        basketPackageDetails.CurrencyCode = booking.FCurrencyID;
        var paxList = new List<BasketPackagePassengersDetails>();
        BasketPackagePassengersDetails pax;
        foreach (var x in _meis007Entities.PaxDetails.Where(x => x.BkgID == booking.BkgID))
        {
            pax = new BasketPackagePassengersDetails();
            pax.FirstName = x.PaxName;
            paxList.Add(pax);
        }
        basketPackageDetails.Passengers = paxList;
        list.Add(basketPackageDetails);
        return list;
    }
	
}
