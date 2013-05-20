using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

public class LocalBooking
{
  BkgMaster bkgMaster;
  meis007Entities _meis007Entities;
  SuppliersHotelsInfo Shi;
  BasketHotelDetails Bhd;
  PaxDetail paxDetail;
  HotelBooking hotelBooking;
  long BasketSequence;
  string SupplierRefNo;
  string SupplierConfNo;
  string Name;
  string BookingType;
	public LocalBooking(meis007Entities obj1, SuppliersHotelsInfo obj2, BasketHotelDetails obj3, HotelBooking obj4, long basketSequence, string refNo, string confNo, string name, string type)
	{
    this.bkgMaster = new BkgMaster();
    this._meis007Entities = obj1;
    this.Shi = obj2;
    this.Bhd = obj3;
    this.BasketSequence = basketSequence;
    this.SupplierRefNo = refNo;
    this.SupplierConfNo = confNo;
    this.Name = name;
    this.hotelBooking = obj4;
    this.BookingType = type;
	}

  public void Create() {
    if (BookingType == "Hotel")
    {
      CreateHotelBooking();
    }
    else { 
    }
  }

  public void CreateHotelBooking() {
    bkgMaster = new BkgMaster
    {
      BasketID = BasketSequence,
      SearchID = int.Parse(Shi.SearchID.ToString()),
      HotelInfoID = Shi.HotelInfoID,
      BkgDate = DateTime.Now,
      BkgType = DbParameter.GetBookingType(),
      BkgStatus = DbParameter.GetBookingStatus(),
      CustomerID = 1015,
      //DbParameter.GetCustomerId
      CustConsultantID = CurrentUser.Id(),
      CustomerDisplayPrice = Shi.LCAP,
      CustomerMarkup = Shi.MarkUp,
      FCSalesAmt = Shi.LCAP,
      FCurrencyID = Shi.CurrencyCode,
      BaseCurrencyID = ApplicationObject.GetBaseCurrency(),
      ExRate = Shi.ExchRate,
      SalesAmt = Shi.LCAP,
      SupplierID = long.Parse(Shi.SupplierID.ToString()),
      SupplierRefNo = SupplierRefNo,
      SupplierConfNo = SupplierConfNo,
      PayCurrID = Shi.CurrencyCode,
      PayExRate = Shi.ExchRate,
      PayAmt = Shi.FCAP,
      ServiceName = DbParameter.GetServiceName(1),
      CheckIN = Bhd.fromDate,
      checkOUT = Bhd.toDate,
      NoOfNights = Shi.NumOfNights,
      ProductID = Shi.LocHotelID,
      LeadPaxName = Name,
      NoOfRooms = 1,
      Adults = Bhd.guestDetails.Where(y => y.type == "Adult").Count(),
      Children = Bhd.guestDetails.Where(y => y.type == "Kid").Count(),
      Infants = Bhd.guestDetails.Where(y => y.type == "Infant").Count(),
      HasExtraPaxs = true,
      RateSDID = Shi.RateSDID,
      supplierHotelID = int.Parse(Shi.HotelID.ToString()),
      StarsLevel = Shi.StarsLevel,
      SupplierRoomID = Shi.RoomID,
      SupplierRoomName = Shi.RoomName,
      SupplierRoomType = Shi.RoomType,
      SupplierRoomTypeID = Shi.RoomTypeID,
      BBID = Shi.BBID,
      BBName = Shi.BBName,
      ModDate = DateTime.Now,
      UserID = CurrentUser.Id().ToString()
    };
    _meis007Entities.AddToBkgMasters(bkgMaster);
    _meis007Entities.SaveChanges();
    foreach (var y in Bhd.guestDetails)
    {
      paxDetail = new PaxDetail
      {
        BkgID = bkgMaster.BkgID,
        PaxName = Name
      };
      _meis007Entities.AddToPaxDetails(paxDetail);
      _meis007Entities.SaveChanges();
    }
    BkgCancelPolicyHelper bkgCancelPolicyHelper =
        new BkgCancelPolicyHelper
        {
          _meis007Entities = _meis007Entities,
          bkgMaster = bkgMaster,
          EndDate = Bhd.toDate.ToString(),
          hotelBooking = hotelBooking,
          StartDate = Bhd.fromDate.ToString(),
          SupplierName = Bhd.SupplierName,
          suppliersHotelsInfo = Shi
        };
    bkgCancelPolicyHelper.CreateBkgCancelPolicies();
  }
}