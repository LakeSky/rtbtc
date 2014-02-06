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
    BasketPackageDetails Bpd;
    PaxDetail paxDetail;
    HotelBooking hotelBooking;
    PackageHeader packageHeader;
    CustomerMaster customer;
    long BasketSequence;
    string SupplierRefNo;
    string SupplierConfNo;
    string Name;
    string BookingType;
    string Remarks;
  
    string TransactionId;
    public LocalBooking(meis007Entities entity, SuppliersHotelsInfo shi, BasketHotelDetails bhd, BasketPackageDetails bpd, HotelBooking hb, long basketSequence, string refNo, string confNo, string name, string type, string remarks ,string transId)
    {
        this.bkgMaster = new BkgMaster();
        this._meis007Entities = entity;
        this.Shi = shi;
        this.Bhd = bhd;
        this.Bpd = bpd;
        this.BasketSequence = basketSequence;
        this.SupplierRefNo = refNo;
        this.SupplierConfNo = confNo;
        this.Name = name;
        this.hotelBooking = hb;
        this.BookingType = type;
        this.Remarks = remarks;
        this.TransactionId = transId;

        this.customer = DbParameter.GetCustomer(_meis007Entities);
    }

    public void Create()
    {
        if (BookingType == "Hotel")
        {
            CreateHotelBooking();
        }
        else
        {
            CreatePackageBooking();
        }
    }

    public void CreateHotelBooking()
    {
        bkgMaster = new BkgMaster
        {
            BasketID = BasketSequence,
            SearchID = long.Parse(Shi.SearchID.ToString()),
            HotelInfoID = Shi.HotelInfoID,
            BkgDate = DateTime.Now,
            BkgType = DbParameter.GetBookingType(),
            BkgStatus = DbParameter.GetBookingStatus(),
            CustomerID = customer.CustomerID,
            CustConsultantID = long.Parse(DbParameter.GetCustomerConsultantID(customer.CustomerID.ToString())),
            CustomerDisplayPrice = Shi.LCAP,
            ConsultantDisplayAmt = Shi.LCAP,
            CustomerMarkup = Shi.MarkUp,
            FCSalesAmt = Shi.LCAP,
            FCurrencyID = ApplicationObject.GetBaseCurrency(),
            BaseCurrencyID = ApplicationObject.GetBaseCurrency(),
            ExRate =  1 , //Shi.ExchRate,
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
            supplierHotelID = Shi.HotelID.ToString(),
            StarsLevel = Shi.StarsLevel,
            SupplierRoomID = Shi.RoomID,
            SupplierRoomName = Shi.RoomName,
            SupplierRoomType = Shi.RoomType,
            SupplierRoomTypeID = Shi.RoomTypeID.ToString(),
            BBID = Shi.BBID.ToString(),
            BBName = Shi.BBName,
            CustomerRemarks = Remarks,
            ModDate = DateTime.Now,
            UserID = CurrentUser.Id().ToString(),
            TransactionId = TransactionId,
            InHouseConsultantid = customer.InhouseConsultantID
        };
        _meis007Entities.AddToBkgMasters(bkgMaster);
        _meis007Entities.SaveChanges();
        foreach (var y in Bhd.guestDetails)
        {
            paxDetail = new PaxDetail
            {
                BkgID = bkgMaster.BkgID,
                PaxName = y.firstName + " " + y.middleName + " " + y.lastName,
                Title = y.title,
                Age = y.title == "Master" ? int.Parse(y.age) : 0   //Shams Added 
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
        var paxName = Bhd.guestDetails.First().firstName + " " + Bhd.guestDetails.First().middleName + " " + Bhd.guestDetails.First().lastName;
        EmailProcessor.Create(_meis007Entities, "bookingConfirmed", bkgMaster, "hotel", paxName);
    }

    public void CreatePackageBooking()
    {
        packageHeader = _meis007Entities.PackageHeaders.Where(x => x.PacId == Bpd.PackageId).First();
        bkgMaster = new BkgMaster
        {
            BasketID = BasketSequence,
            SearchID = Bpd.PackageId,
            HotelInfoID = Bpd.PackageId,
            BkgDate = DateTime.Now,
            BkgType = DbParameter.GetBookingType(),
            BkgStatus = DbParameter.GetBookingStatus(),
            CustomerID = customer.CustomerID,
            CustConsultantID = CurrentUser.Id(),
            CustomerDisplayPrice = decimal.Parse(Bpd.PricePerPerson.ToString()),
            CustomerMarkup = 0,
            FCSalesAmt = 0,
            FCurrencyID = DbParameter.GetBaseCurrency(),
            BaseCurrencyID = ApplicationObject.GetBaseCurrency(),
            ExRate = 0,
            SalesAmt = decimal.Parse(Bpd.TotalPrice.ToString()),
            SupplierID = 0,
            SupplierRefNo = SupplierRefNo,
            SupplierConfNo = SupplierConfNo,
            PayCurrID = DbParameter.GetBaseCurrency(),
            PayExRate = 0,
            PayAmt = 0,
            ServiceName = DbParameter.GetServiceName(4),
            CheckIN = Bpd.From,
            checkOUT = Bpd.From,
            NoOfNights = 0,
            ProductID = Bpd.PackageId,
            LeadPaxName = Name,
            NoOfRooms = 0,
            Adults = Bpd.Passengers.Count,
            Children = 0,
            Infants = 0,
            HasExtraPaxs = true,
            CustomerRemarks = Remarks,
            ModDate = DateTime.Now,
            UserID = CurrentUser.Id().ToString(),
            TransactionId = TransactionId,
            InHouseConsultantid = customer.InhouseConsultantID
        };
        _meis007Entities.AddToBkgMasters(bkgMaster);
        _meis007Entities.SaveChanges();
        foreach (var y in Bpd.Passengers)
        {
            paxDetail = new PaxDetail
            {
                BkgID = bkgMaster.BkgID,
                PaxName = y.FirstName + " " + y.MiddleName + " " + y.LastName
            };
            _meis007Entities.AddToPaxDetails(paxDetail);
            _meis007Entities.SaveChanges();
        }
        var paxName = Bpd.Passengers.First().FirstName + " " + Bpd.Passengers.First().MiddleName + " " + Bpd.Passengers.First().LastName;
        EmailProcessor.Create(_meis007Entities, "bookingConfirmed", bkgMaster, "package", paxName);
    }

}