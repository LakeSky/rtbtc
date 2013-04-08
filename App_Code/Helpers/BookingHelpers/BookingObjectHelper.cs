using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BookingObjectHelper
/// </summary>
public static class BookingObjectHelper
{
    public static BookingHotelDetails GetHotelDetails(meis007Entities _meis007Entities, long supplierHotelInfoId, ShoppingHelper _shoppingHelper)
    {
        var NoOfPassengers = 0;
        decimal price = decimal.Parse("0");
        SqlConnection _sqlConnection;
        SqlCommand _sqlCommand;
        SqlDataReader _sqlDataReader;
        List<BookingGuestDetails> bookingGuestDetails = BookingObjectHelper.GetGuests(_shoppingHelper);
        BookingHotelDetails bookingHotelDetails = new BookingHotelDetails();
        var defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;

        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        _sqlCommand = new SqlCommand("spProductMasterTest", _sqlConnection);
        _sqlCommand.CommandType = CommandType.StoredProcedure;
        _sqlCommand.Parameters.AddWithValue("@Trans", "SearchSingle");
        _sqlCommand.Parameters.AddWithValue("@HotelInfoId", supplierHotelInfoId);
        _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {

            if (!string.IsNullOrEmpty(_sqlDataReader["NumOfPassengers"].ToString())){
                NoOfPassengers = int.Parse(_sqlDataReader["NumOfPassengers"].ToString());
            } else{
                NoOfPassengers = bookingGuestDetails.Where(x => x.type != "Infant").Count();
            }

            if (!string.IsNullOrEmpty(_sqlDataReader["LCAP"].ToString())){
                price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / NoOfPassengers);
            }

            var guests = bookingGuestDetails.Where(x => x.type == "Adult").Count().ToString() + " Adults "
                + bookingGuestDetails.Where(x => x.type == "Children").Count().ToString()
                + " Children " + bookingGuestDetails.Where(x => x.type == "Infant").Count().ToString() + " Infants";

            var totalPrice = price * (bookingGuestDetails.Where(x => x.type == "Adult").Count() + bookingGuestDetails.Where(x => x.type == "Children").Count());
            defaultImagePath = string.IsNullOrEmpty(_sqlDataReader["DefaultImagePath"].ToString()) ? defaultImagePath : _sqlDataReader["DefaultImagePath"].ToString();

            bookingHotelDetails = new BookingHotelDetails
            {
                hotelInfoId = supplierHotelInfoId,
                productId = long.Parse(_sqlDataReader["ProductID"].ToString()),
                productName = _sqlDataReader["ProductName"].ToString(),
                cityName = _sqlDataReader["CityName"].ToString(),
                productStarsImagePath = _sqlDataReader["StarImagesPath"].ToString(),
                productDefaultImagePath = defaultImagePath,
                pricePerPassenger = price,
                stay = (_shoppingHelper.HotelDetails.FromDate + " to " + _shoppingHelper.HotelDetails.ToDate),
                guests = guests,
                room = _sqlDataReader["RoomType"].ToString() + " - " + _sqlDataReader["RoomName"].ToString(),
                guestDetails = bookingGuestDetails,
                totalPrice = totalPrice,
                fromDate = _shoppingHelper.HotelDetails.FromDate,
                toDate = _shoppingHelper.HotelDetails.ToDate
            };            
        }
        _sqlConnection.Close();

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

