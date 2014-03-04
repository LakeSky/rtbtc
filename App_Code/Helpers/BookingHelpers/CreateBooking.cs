using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

public class CreateBooking
{
    meis007Entities _entity;
    BasketHelper _basket;
    BasketSequence _sequence;
    List<BasketHotelDetails> _hotelsToRemove;
    SuppliersHotelsInfo _suppliersHotelsInfo;
    SupplierBooking _supplierBooking;
    LocalBooking _localBooking;
    HotelBooking _hotelBooking;
    Payfort_Response _payfortResponse;
    B2CCustomerinfo _cust;
    long _sequenceNumber, _userId;
    string _cityCode;
    public CreateBooking(meis007Entities entity, BasketHelper basket, Payfort_Response payfortResponse, string cityCode)
    {
        _hotelsToRemove = new List<BasketHotelDetails>();
        _entity = entity;
        _basket = basket;
        _payfortResponse = payfortResponse;
        _cityCode = cityCode;
        _userId = CurrentUser.Id();
        CheckEnityObject();
        _cust = _entity.B2CCustomerinfo.Where(x => x.CustomerSNo == _userId).First();
    }

    public BasketHelper Create()
    {
        GetSequenceNumber();
        CreateHotelBookings();
        CreatePackageBookings();
        return _basket;
    }

    void CreateHotelBookings()
    {
        foreach (var x in _basket.hotelDetails)
        {
            CheckEnityObject();
            try
            {
                if (!DbParameter.IsInetrnalSupplier(x.supplierId))
                {
                    _suppliersHotelsInfo = _entity.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.hotelInfoId).First();
                    _supplierBooking =
                        new SupplierBooking(_suppliersHotelsInfo, x, _cust.PaxFirstName, _cust.PaxMiddleName, _cust.PaxLastName, _cust.PaxmobileNo,
                            _cust.PaxTelNo, _cityCode, "", "");
                    string reservartionId = _supplierBooking.Book();
                    _hotelBooking = _entity.HotelBookings.Where(y => y.HotelInfoId == x.hotelInfoId).FirstOrDefault();
                    if (_hotelBooking != null)
                    {
                        if (_suppliersHotelsInfo.SupplierID == "1006")
                        {
                            var array = _hotelBooking.ReservationId.Split('~');
                            _localBooking =
                                new LocalBooking(_entity, _suppliersHotelsInfo, x, null, _hotelBooking, _sequenceNumber,
                                array[0].ToString().Trim(), array[1].ToString().Trim(), "NAME", "Hotel", "Remarks", _payfortResponse.PayId);
                            _localBooking.Create();
                            _hotelsToRemove.Add(x);
                        }

                        if (_suppliersHotelsInfo.SupplierID == "1008")
                        {

                            _localBooking =
                                new LocalBooking(_entity, _suppliersHotelsInfo, x, null, _hotelBooking, _sequenceNumber, _hotelBooking.ReservationId,
                                _hotelBooking.ReservationId, "NAME", "Hotel", "Remarks", _payfortResponse.PayId);
                            _localBooking.Create();
                            _hotelsToRemove.Add(x);

                        }
                    }
                }
            }
            catch (Exception e)
            {
                _basket.ErrorMessage += e.Message + "\n";
            }
        }
    }

    void CreatePackageBookings()
    {
        foreach (var x in _basket.packageDetails)
        {
            CheckEnityObject();
            try
            {
                _localBooking = new LocalBooking(
                    _entity, null, null, x, null, _sequenceNumber, "", "", _cust.PaxFirstName + " " + _cust.PaxLastName, "Package", "", _payfortResponse.PayId);// localTrans.Id);
                _localBooking.Create();
            }
            catch (Exception e)
            {
                _basket.ErrorMessage += e.Message + "\n";
            }
        }
        _basket.packageDetails = new List<BasketPackageDetails>();
    }

    void GetSequenceNumber()
    {
        CheckEnityObject();
        _sequence = _entity.BasketSequences.OrderBy(x => x.Id).First();
        _sequenceNumber = _sequence.SequenceNumber + 1;
        _sequence.SequenceNumber = _sequenceNumber;
        _entity.SaveChanges();
        _basket.BasketSequenceNumber = _sequenceNumber;
    }

    void CheckEnityObject()
    {
        if (_entity == null)
        {
            _entity = new meis007Entities();
        }
    }

    void RemoveHotels()
    {
        foreach (var x in _hotelsToRemove)
        {
            _basket.hotelDetails.Remove(x);
        }
    }
}