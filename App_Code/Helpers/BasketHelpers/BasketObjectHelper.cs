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
        var defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;
        DateTime fromDateParsed = DateTimeHelper.customFormat(fromDate);
        DateTime toDateParsed = DateTimeHelper.customFormat(toDate);
        string differenceDays = (toDateParsed - fromDateParsed).Days.ToString();

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
            }else{
                NoOfPassengers = basketHotelGuestDetailsList.Where(x => x.type != "Infant").Count();
            }

            if (!string.IsNullOrEmpty(_sqlDataReader["LCAP"].ToString()))
            {
                price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / NoOfPassengers);
            }

            var guests = basketHotelGuestDetailsList.Where(x => x.type == "Adult").Count().ToString() + " Adults "
                + basketHotelGuestDetailsList.Where(x => x.type == "Children").Count().ToString()
                + " Children " + basketHotelGuestDetailsList.Where(x => x.type == "Infant").Count().ToString() + " Infants";

            var totalPrice = price * (basketHotelGuestDetailsList.Where(x => x.type == "Adult").Count() + basketHotelGuestDetailsList.Where(x => x.type == "Children").Count());
            defaultImagePath = string.IsNullOrEmpty(_sqlDataReader["DefaultImagePath"].ToString()) ? defaultImagePath : _sqlDataReader["DefaultImagePath"].ToString();

            basketHotelDetails = new BasketHotelDetails
            {
                hotelInfoId = supplierHotelInfoId,
                productId = long.Parse(_sqlDataReader["ProductID"].ToString()),
                productName = _sqlDataReader["ProductName"].ToString(),
                cityName = _sqlDataReader["CityName"].ToString(),
                productStarsImagePath = _sqlDataReader["StarImagesPath"].ToString(),
                productDefaultImagePath = defaultImagePath,
                pricePerPassenger = price,
                stay = (fromDateParsed.ToString("dd MMM yy") + " to " + toDateParsed.ToString("dd MMM yy") + " (" + differenceDays + " Nights)"),
                guests = guests,
                room = _sqlDataReader["RoomType"].ToString() + " - " + _sqlDataReader["RoomName"].ToString(),
                guestDetails = basketHotelGuestDetailsList,
                totalPrice = totalPrice,
                fromDate = fromDateParsed,
                toDate = toDateParsed
            };
        }
        _sqlConnection.Close();
        if (basketHelper.hotelDetails == null) {
            basketHelper.hotelDetails = new List<BasketHotelDetails>();
        }
        basketHelper.hotelDetails.Add(basketHotelDetails);
        return basketHelper;
    }
}