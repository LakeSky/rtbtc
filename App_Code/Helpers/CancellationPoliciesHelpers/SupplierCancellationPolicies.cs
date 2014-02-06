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
        
        var policyAvailable = CheckCancellationPolicies();
        return policyAvailable;
    }

    public List<BaseCancellationPolicy> GetPolicies() {
        BaseCancellationPolicies = new List<BaseCancellationPolicy>();
        GetCancellationPolicies();
        return BaseCancellationPolicies;
    }

    protected bool CheckCancellationPolicies() {
        var count = _meis007Entities.SuppliersCancelationPolicies.Where(x => x.HotelInfoId == HotelInfoId).Count();
        var policyAvailable = true;
        if (count == 0)
        {
            RepositoryFactory supplierFactory = new RepositoryFactory(null, suppliersHotelsInfo.SessionID);
            var startDate = DateTimeHelper.ConvertToDateWithoutNull(StartDate);
            var endDate = DateTimeHelper.ConvertToDateWithoutNull(EndDate);
            policyAvailable = supplierFactory.GetCancelationPolicy(int.Parse(suppliersHotelsInfo.HotelInfoID.ToString()), startDate, endDate);
        }
        return policyAvailable;
    }

    protected void GetCancellationPolicies() {
        BaseCancellationPolicy baseCancellationPolicy;
        foreach (var x in _meis007Entities.SuppliersCancelationPolicies.Where(x => x.HotelInfoId == HotelInfoId)) {
            baseCancellationPolicy = new BaseCancellationPolicy { 
                Id = x.CID,
                BasisType = x.BasisType,
                HotelId = x.HotelID.ToString(),
                HotelInfoId = x.HotelInfoId,
                HotelRoomTypeId = x.HotelRoomTypeId,
                OffSetUnit = x.OffSetUnit,
                Percentage = x.Percentage,
                SearchId = x.SearchId,
                suppliersHotelsInfo = _meis007Entities.SuppliersHotelsInfoes.Where(y => y.HotelInfoID == x.HotelInfoId).First(),
                UnitMultiplier = x.UnitMultiplier,
                NumberOfNights= x.NumberOfNights
            };
            BaseCancellationPolicies.Add(baseCancellationPolicy);
        }
    }
}