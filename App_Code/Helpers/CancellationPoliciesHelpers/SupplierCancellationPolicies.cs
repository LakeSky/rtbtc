using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using RTCModel.Models;
using RTCDataModel.RTCEntities;

/// <summary>
/// Summary description for SupplierCancellationPolicies
/// </summary>
public class SupplierCancellationPolicies
{
    public long HotelInfoId;
    public meis007Entities _meis007Entities;
    public SuppliersHotelsInfo suppliersHotelsInfo;
    public string SupplierName;
    public string StartDate;
    public string EndDate;
    public List<BaseCancellationPolicy> BaseCancellationPolicies;
	public SupplierCancellationPolicies(meis007Entities obj, SuppliersHotelsInfo obj1, string supplierName, string startDate, string endDate)
	{
        _meis007Entities = obj;
        suppliersHotelsInfo = obj1;
        HotelInfoId = suppliersHotelsInfo.HotelInfoID;
        SupplierName = supplierName;
        StartDate = startDate;
        EndDate = endDate;
	}

    public bool CheckPoliciesAvailable() {
        
        var policyAvailable = true;
        if (SupplierName == "Tourico") {
            policyAvailable = CheckTouricoCancellationPolicies();
        }
        return policyAvailable;
    }

    public List<BaseCancellationPolicy> GetPolicies() {
        BaseCancellationPolicies = new List<BaseCancellationPolicy>();
        if (SupplierName == "Tourico") {
            GetTouricoPolicies();
        }
        return BaseCancellationPolicies;
    }

    protected bool CheckTouricoCancellationPolicies() {
        var count = _meis007Entities.TouricoCancelationPolicies.Where(x => x.HotelInfoId == HotelInfoId).Count();
        var policyAvailable = true;
        if (count == 0)
        {
            RepositoryFactory supplierFactory = new RepositoryFactory(null, suppliersHotelsInfo.SessionID);
            var startDate = DateTime.Parse(StartDate);
            var endDate = DateTime.Parse(EndDate);
            var cancellationEntity = new CancelationEntity()
            {
                HotelInfoId = int.Parse(suppliersHotelsInfo.HotelInfoID.ToString()),
                HotelId = int.Parse(suppliersHotelsInfo.HotelID.ToString()),
                RoomTypeId = int.Parse(suppliersHotelsInfo.RoomTypeID.ToString()),
                CheckIn = startDate,
                CheckOut = endDate,
                SearchId = int.Parse(suppliersHotelsInfo.SearchID.ToString())
            };
            policyAvailable = supplierFactory.GetCancelationPolicy(cancellationEntity, SupplierName);
        }
        return policyAvailable;
    }

    protected void GetTouricoPolicies() {
        BaseCancellationPolicy baseCancellationPolicy;
        foreach (var x in _meis007Entities.TouricoCancelationPolicies.Where(x => x.HotelInfoId == HotelInfoId)) {
            baseCancellationPolicy = new BaseCancellationPolicy { 
                Id = x.CID,
                HotelId = x.HotelID,
                HotelInfoId = x.HotelInfoId,
                HotelRoomTypeId = x.HotelRoomTypeId,
                OffSetUnit = x.OffSetUnit,
                Percentage = x.Percentage,
                SearchId = x.SearchId,
                suppliersHotelsInfo = x.SuppliersHotelsInfo,
                UnitMultiplier = x.UnitMultiplier,
                NumberOfNights= x.NumberOfNights
            };
            BaseCancellationPolicies.Add(baseCancellationPolicy);
        }
    }
}