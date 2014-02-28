using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using RTCDataModel.RTCEntities;
using RTCModel.Models;

/// <summary>
/// Summary description for SupplierBooking
/// </summary>
public class SupplierBooking
{
    SuppliersHotelsInfo Shi;
    BasketHotelDetails Bhd;
    string FirstName;
    string MiddleName;
    string LastName;
    string Mobile;
    string Telephone;
    string CustomerID;
    string CityID;
    string Title;
    string CustomerRemarks;
    public SupplierBooking(SuppliersHotelsInfo obj1, BasketHotelDetails obj2, string firstName, string middleName, string lastName, string mobile, string telephone,  string cityID, string title, string customerRemarks)
    {
        this.Shi = obj1;
        this.Bhd = obj2;
        this.FirstName = firstName;
        this.MiddleName = middleName;
        this.LastName = lastName;
        this.Mobile = mobile;
        this.Telephone = telephone;
        
        this.CityID = cityID;//shams added 
        this.Title = title;//shams added 
        this.CustomerRemarks = customerRemarks;//shams added 
    }

    public string Book()
    {
        BookingDetails bookingInfo = new BookingDetails();
        bookingInfo.CheckIn = Bhd.fromDate;
        bookingInfo.CheckOut = Bhd.toDate;
        bookingInfo.AdultNum = Bhd.guestDetails.Where(y => y.type == "Adult").Count();
        bookingInfo.ChildNum = Bhd.guestDetails.Where(y => y.type == "Kid").Count();
        if (bookingInfo.ChildNum == 0)
            bookingInfo.ChildAges = null; //ages;
        else
            bookingInfo.ChildAges = Bhd.guestDetails.Where(y => y.type == "Kid").Select(y => int.Parse(y.age)).ToArray(); //ages;
       
        bookingInfo.AgentNumber = Bhd.hotelInfoId.ToString();
        bookingInfo.FirstName = FirstName;
        bookingInfo.MiddleName = MiddleName;
        bookingInfo.LastName = LastName;
        bookingInfo.MobilePhone = Mobile;
        bookingInfo.HomePhone = Telephone;
        if (Shi.SupplierID == "1006")
        {
            bookingInfo.HotelId = int.Parse(Shi.HotelID.ToString());
            bookingInfo.RoomId = int.Parse(Shi.RoomID.ToString());
        }
        else if (Shi.SupplierID == "1008")
        {
            bookingInfo.HotelCode = Shi.HotelID.ToString();
            bookingInfo.RoomCode = Shi.RoomID.ToString();
            //bookingInfo.InfantNum = Bhd.InfantNum;
            //bookingInfo.AgentText = (Bhd.InfantNum > 0) ? "Cot Required" : (this.CustomerRemarks == null) ? null : this.CustomerRemarks;
            //bookingInfo.Title = Title;
        }
        else
        {
            bookingInfo.HotelCode = Shi.HotelID.ToString();
            bookingInfo.RoomCode = Shi.RoomID.ToString();
        }
        bookingInfo.RoomTypeId = int.Parse(Shi.RoomTypeID.ToString());
        bookingInfo.Supplier = DbParameter.GetSupplierName(Shi.SupplierID);
        bookingInfo.IsAvailable = true;
        bookingInfo.RequestedPrice = decimal.Parse((Shi.AvrNightPricePay * Shi.NumOfNights).ToString());
        bookingInfo.DeltaPrice = 1;
        bookingInfo.Currency = Shi.CurrencyCode;
        bookingInfo.SessionId = Shi.SessionID;
        bookingInfo.SearchId = int.Parse(Shi.SearchID.ToString());
        bookingInfo.SupplierId = Shi.SupplierID;
        bookingInfo.CustomerId = DbParameter.GetCustomerId();
        bookingInfo.HotelInfoId = int.Parse(Bhd.hotelInfoId.ToString());
         //shams add few fields
        bookingInfo.ArrivalCity = Bhd.cityName;
        bookingInfo.Destination = CityID;
        // finish shams adding
       
        RepositoryFactory supplierFactory = new RepositoryFactory(null, Bhd.sessionId);
        return supplierFactory.HotelRoomBooking(bookingInfo);
    }

}