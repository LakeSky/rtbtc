using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SupplierHotelHelper
/// </summary>
public class SupplierHotelHelper
{
    public long Id { get; set; }
    public int SupplierHotelId { get; set; }
    public long ProductMasterId { get; set; }
    public string SessionId { get; set; }
    public string SupplierId { get; set; }
    public List<SupplierHotelRoomHelper> Rooms { get; set; }
}