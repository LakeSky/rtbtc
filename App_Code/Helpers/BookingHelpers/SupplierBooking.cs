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
    public SupplierBooking(SuppliersHotelsInfo obj1, BasketHotelDetails obj2, string firstName, string middleName, string lastName, string mobile, string telephone)
    {
        this.Shi = obj1;
        this.Bhd = obj2;
        this.FirstName = firstName;
        this.MiddleName = middleName;
        this.LastName = lastName;
        this.Mobile = mobile;
        this.Telephone = telephone;
    }

    public string Book()
    {
        BookingDetails bookingInfo = new BookingDetails();
        bookingInfo.CheckIn = Bhd.fromDate;
        bookingInfo.CheckOut = Bhd.toDate;
        bookingInfo.AdultNum = Bhd.guestDetails.Where(y => y.type == "Adult").Count();
        bookingInfo.ChildNum = Bhd.guestDetails.Where(y => y.type == "Kid").Count();
        bookingInfo.ChildAges = Bhd.guestDetails.Where(y => y.type == "Kid").Select(y => int.Parse(y.age)).ToArray();
        bookingInfo.AgentNumber = Bhd.hotelInfoId.ToString();
        bookingInfo.FirstName = FirstName;
        bookingInfo.MiddleName = MiddleName;
        bookingInfo.LastName = LastName;
        bookingInfo.MobilePhone = Mobile;
        bookingInfo.HomePhone = Telephone;
        if (Shi.SupplierID == "TOH")
        {
            bookingInfo.HotelId = int.Parse(Shi.HotelID.ToString());
            bookingInfo.RoomId = int.Parse(Shi.RoomID.ToString());
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
        RepositoryFactory supplierFactory = new RepositoryFactory(null, Bhd.sessionId);
        return supplierFactory.HotelRoomBooking(bookingInfo);
    }

}