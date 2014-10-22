using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using meis007Model;

public class BasketObjectHelper
{
    SqlConnection _sqlConnection;
    SqlCommand _sqlCommand;
    SqlDataReader _sqlDataReader;
	public BasketObjectHelper()
	{
		
	}

    public BasketHelper CreateBasketHotel(meis007Entities _meis007Entities, BasketHelper basketHelper, string hotelInfoId, string fromDate, string toDate, List<BasketHotelGuestDetails> basketHotelGuestDetailsList)
    {
        decimal price = decimal.Parse("0");
        long supplierHotelInfoId = long.Parse(hotelInfoId);
        BasketHotelDetails basketHotelDetails = new BasketHotelDetails();
        int NoOfPassengers = 0;
        DateTime fromDateParsed = DateTimeHelper.customFormat(fromDate);
        DateTime toDateParsed = DateTimeHelper.customFormat(toDate);
        string differenceDays = (toDateParsed - fromDateParsed).Days.ToString();
        string roomName;

        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        _sqlCommand = new SqlCommand("spProductMasterExtension1", _sqlConnection);
        _sqlCommand.CommandType = CommandType.StoredProcedure;
        _sqlCommand.Parameters.AddWithValue("@Trans", "SearchSingle");
        _sqlCommand.Parameters.AddWithValue("@HotelInfoId", supplierHotelInfoId);
        _sqlDataReader = _sqlCommand.ExecuteReader();
        while (_sqlDataReader.Read())
        {
            roomName = _sqlDataReader["RoomType"].ToString() + " - " + _sqlDataReader["RoomName"].ToString();
            if (!string.IsNullOrEmpty(_sqlDataReader["BBName"].ToString())){
                roomName = roomName + " - " + _sqlDataReader["BBName"].ToString();
            }

            if (!string.IsNullOrEmpty(_sqlDataReader["NumOfPassengers"].ToString())){
                NoOfPassengers = int.Parse(_sqlDataReader["NumOfPassengers"].ToString());
            }else{
                NoOfPassengers = basketHotelGuestDetailsList.Where(x => x.type != "Infant").Count();
            }

            if (!string.IsNullOrEmpty(_sqlDataReader["LCAP"].ToString()))
            {
                price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / NoOfPassengers);
            }

            var guests = basketHotelGuestDetailsList.Where(x => x.type == "Adult").Count().ToString() + " Adults "
                + basketHotelGuestDetailsList.Where(x => x.type == "Kid").Count().ToString()
                + " Kids " + basketHotelGuestDetailsList.Where(x => x.type == "Infant").Count().ToString() + " Infants";

            var totalPrice = price * (basketHotelGuestDetailsList.Where(x => x.type == "Adult").Count() + basketHotelGuestDetailsList.Where(x => x.type == "Kid").Count());

            basketHotelDetails = new BasketHotelDetails
            {
                hotelInfoId = supplierHotelInfoId,
                sessionId = _sqlDataReader["SessionID"].ToString(),
                supplierId = _sqlDataReader["SupplierID"].ToString(),
                SupplierName = _sqlDataReader["SupplierName"].ToString(),
                supplierHotelId = _sqlDataReader["HotelID"].ToString(),
                supplierRoomId = _sqlDataReader["RoomID"].ToString(),
                NoOfNights = int.Parse(_sqlDataReader["NumOfNights"].ToString()),
                NoOfPassengers = NoOfPassengers,
                NoOfChildren = int.Parse(_sqlDataReader["NumOfChildrens"].ToString()),
                productId = long.Parse(_sqlDataReader["ProductID"].ToString()),
                productName = _sqlDataReader["ProductName"].ToString(),
                cityName = _sqlDataReader["CityName"].ToString(),
                productStarsImagePath = _sqlDataReader["StarImagesPath"].ToString(),
                productDefaultImagePath = _sqlDataReader["ThumbnailPath"].ToString(),
                pricePerPassenger = price,
                stay = (fromDateParsed.ToString("dd MMM yy") + " to " + toDateParsed.ToString("dd MMM yy") + " (" + differenceDays + " Nights)"),
                guests = guests,
                room = roomName,
                guestDetails = basketHotelGuestDetailsList,
                totalPrice = totalPrice,
                fromDate = fromDateParsed,
                toDate = toDateParsed,
                searchId = _sqlDataReader["SearchID"].ToString()
            };
        }
        _sqlConnection.Close();
        basketHelper.hotelDetails.Add(basketHotelDetails);
        basketHelper.calculateTotalPrice();
        return basketHelper;
    }
}