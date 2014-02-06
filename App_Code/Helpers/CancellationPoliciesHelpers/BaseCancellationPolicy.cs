using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
/// <summary>
/// Summary description for BaseCancellationPolicy
/// </summary>
public class BaseCancellationPolicy
{
    public long Id { get; set; }
    public string BasisType;
    public string HotelId { get; set; }
    public long? HotelInfoId { get; set; }
    public string HotelRoomTypeId { get; set; }
    public string OffSetUnit { get; set; }
    public decimal? Percentage { get; set; }
    public int? SearchId { get; set; }
    public SuppliersHotelsInfo suppliersHotelsInfo { get; set; }
    public int? UnitMultiplier { get; set; }
    public int? NumberOfNights { get; set; }
}