using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
/// <summary>
/// Summary description for BkgCancelPolicyHelper
/// </summary>
public class BkgCancelPolicyHelper
{
    public meis007Entities _meis007Entities { get; set; }
    public string SupplierName { get; set; }
    public SuppliersHotelsInfo suppliersHotelsInfo { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public HotelBooking hotelBooking { get; set; }
    public BkgMaster bkgMaster { get; set; }

    public void CreateBkgCancelPolicies() {
        SupplierCancellationPolicies supplierCancellationPolicies =
                        new SupplierCancellationPolicies(_meis007Entities, suppliersHotelsInfo, SupplierName, StartDate, EndDate);
        var policies = supplierCancellationPolicies.GetPolicies();
        BkgCancelPolicy bkgCancelPolicy;
        foreach (var x in policies) {
            bkgCancelPolicy = new BkgCancelPolicy { 
                HotelInfoId =  suppliersHotelsInfo.HotelInfoID,
                HotelRoomTypeId = suppliersHotelsInfo.RoomTypeID,
                LocalBookingId = bkgMaster.BkgID,
                LocalHotelId = suppliersHotelsInfo.LocHotelID,
                NoOfNights = suppliersHotelsInfo.NumOfNights,
                OffSetUnit = x.OffSetUnit,
                Percentage = x.Percentage,
                RateBasisType = x.BasisType,
                SearchId = suppliersHotelsInfo.SearchID,
                SupplierId = suppliersHotelsInfo.SupplierID,
                UnitMultiplier = x.UnitMultiplier,
                XMLBookingId = hotelBooking.BookingId,
                CreatedAt = DateTime.Now
            };
            _meis007Entities.AddToBkgCancelPolicies(bkgCancelPolicy);
            _meis007Entities.SaveChanges();
        }
    }
}