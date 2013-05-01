using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Dynamic;

/// <summary>
/// Summary description for BookingObjectHelper
/// </summary>
public static class BookingObjectHelper
{
    public static BookingHotelDetails GetHotelDetails(meis007Entities _meis007Entities, long supplierHotelInfoId, ShoppingHelper _shoppingHelper, long? currentUserId)
    {
        var NoOfPassengers = 0;
        decimal price = decimal.Parse("0");
        SqlConnection _sqlConnection;
        SqlCommand _sqlCommand;
        SqlDataReader _sqlDataReader;
        List<BookingGuestDetails> bookingGuestDetails = BookingObjectHelper.GetGuests(_shoppingHelper, _meis007Entities, currentUserId);
        BookingHotelDetails bookingHotelDetails = new BookingHotelDetails();
        var defaultImagePath = _meis007Entities.ProductImages.First().ImageAddress;
        DateTime fromDate = DateTimeHelper.customFormat(_shoppingHelper.HotelDetails.FromDate);
        DateTime toDate = DateTimeHelper.customFormat(_shoppingHelper.HotelDetails.ToDate);
        string differenceDays = (toDate - fromDate).Days.ToString();
        string roomName = "";
        _sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ToString());
        _sqlConnection.Open();
        _sqlCommand = new SqlCommand("spProductMasterTest", _sqlConnection);
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
            } else{
                NoOfPassengers = bookingGuestDetails.Where(x => x.type != "Infant").Count();
            }

            if (!string.IsNullOrEmpty(_sqlDataReader["LCAP"].ToString())){
                price = Math.Floor(decimal.Parse(_sqlDataReader["LCAP"].ToString()) / NoOfPassengers);
            }

            var guests = bookingGuestDetails.Where(x => x.type == "Adult").Count().ToString() + " Adults "
                + bookingGuestDetails.Where(x => x.type == "Kid").Count().ToString()
                + " Kids " + bookingGuestDetails.Where(x => x.type == "Infant").Count().ToString() + " Infants";

            var totalPrice = price * (bookingGuestDetails.Where(x => x.type == "Adult").Count() + bookingGuestDetails.Where(x => x.type == "Kid").Count());
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
                stay = (fromDate.ToString("dd MMM yy") + " to " + toDate.ToString("dd MMM yy") + " (" + differenceDays+ " Nights)"),
                guests = guests,
                room = roomName,
                guestDetails = bookingGuestDetails,
                totalPrice = totalPrice,
                fromDate = fromDate,
                toDate = toDate
            };            
        }
        _sqlConnection.Close();

        return bookingHotelDetails;
    }

    public static List<BookingGuestDetails> GetGuests(ShoppingHelper _shoppingHelper, meis007Entities _meis007Entities, long? currentUserId)
    {
        dynamic obj = new ExpandoObject();
        var childAgeMin = DateTime.Now.AddYears(-2);
        var childAgeMax = DateTime.Now.AddYears(-12);
        long userId;
        if (currentUserId != null) { 
            userId = long.Parse(currentUserId.ToString());
            var data = _meis007Entities.B2CPaxinfo.Where(x => x.ForeignCustomerSNo == userId);
            var t = data.Count();
            var k = data.Where(x => x.PaxDOB <= childAgeMax || x.PaxDOB == null).OrderBy(x => x.CustomerSno).Count();
            obj.adultsArray = data.Where(x => x.PaxDOB <= childAgeMax || x.PaxDOB == null).OrderBy(x => x.CustomerSno).ToArray();
            obj.childArray = data.Where(x => x.PaxDOB <= childAgeMin && x.PaxDOB >= childAgeMax).OrderBy(x => x.CustomerSno).ToArray();
            obj.infantArray = data.Where(x => x.PaxDOB >= childAgeMin).OrderBy(x => x.CustomerSno).ToArray();
        }
        List<BookingGuestDetails> bookingGuestDetails = new List<BookingGuestDetails>();
        int[] childAges;
        TempGuestType tempGuestType;
        List<TempGuestType> tempGuestTypeList = new List<TempGuestType>(); ;

        foreach (var x in _shoppingHelper.HotelDetails.RoomDetails)
        {
            if (x.Adults != null){
                for (int i = 0; i < x.Adults; i++){
                    tempGuestType = new TempGuestType { type = "Adult", age = "-" };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }
            if (x.Kids != null){
                childAges = x.ChildAge.ToArray();
                for (int i = 0; i < x.Kids; i++){
                    tempGuestType = new TempGuestType { type = "Kid", age = childAges[i].ToString() };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }

            if (x.Infants != null){
                childAges = x.ChildAge.ToArray();
                for (int i = 0; i < x.Infants; i++){
                    tempGuestType = new TempGuestType { type = "Infant", age = "-" };
                    tempGuestTypeList.Add(tempGuestType);
                }
            }
        }
        int adultsCount = tempGuestTypeList.Where(x => x.type == "Adult").Count();
        int childrenCount = tempGuestTypeList.Where(x => x.type == "Kid").Count();
        int infantsCount = tempGuestTypeList.Where(x => x.type == "Infant").Count();
        int objAdultCount = 0;
        int objChildCount = 0;
        int objInfantCount = 0;
        if (currentUserId != null) {
            objAdultCount = obj.adultsArray.Length;
            objChildCount = obj.childArray.Length;
            objInfantCount = obj.infantArray.Length;
        }
        bookingGuestDetails = AppendData(bookingGuestDetails, tempGuestTypeList, "Adult", adultsCount, objAdultCount, obj, currentUserId);
        bookingGuestDetails = AppendData(bookingGuestDetails, tempGuestTypeList, "Kid", childrenCount, objChildCount, obj, currentUserId);
        bookingGuestDetails = AppendData(bookingGuestDetails, tempGuestTypeList, "Infant", infantsCount, objInfantCount, obj, currentUserId);
        
        return bookingGuestDetails;
    }

    public static List<BookingGuestDetails> AppendData(List<BookingGuestDetails> bookingGuestDetails, List<TempGuestType> tempGuestTypeList, string type, int count, int objCount, dynamic obj, long? currentUserId)
    {
        string title, firstName, middleName, lastName, age;
        int index = 0;
        BookingGuestDetails bookingGuestDetail;
        foreach (var x in tempGuestTypeList.Where(g => g.type == type)){
            title = firstName = middleName = lastName = "";
            age = x.age;
            if (currentUserId != null && objCount != 0 && index < objCount)
            {
                var paxObj = new B2CPaxinfo();
                if (type == "Adult"){
                    paxObj = obj.adultsArray[index];
                }else if (type == "Kid"){
                    paxObj = obj.childArray[index];
                    age = x.age;
                }
                else {
                    paxObj = obj.infantArray[index];
                }
                title = paxObj.Title;
                firstName = paxObj.PaxFirstName;
                middleName = paxObj.PaxMiddleName;
                lastName = paxObj.PaxLastName;
                if (paxObj.PaxDOB != null){
                    age = (DateTime.Now.Year - (DateTimeHelper.customFormat(paxObj.PaxDOB.Value.ToString("dd-MM-yyyy")).Year)).ToString();
                }
            }
            bookingGuestDetail = new BookingGuestDetails { type = x.type, age = age, firstName = firstName, middleName = middleName, lastName = lastName, title = title };
            bookingGuestDetails.Add(bookingGuestDetail);
            index += 1;
        }
        return bookingGuestDetails;
    }
}

public class TempGuestType {
    public string type { get; set; }
    public string age { get; set; }
}

