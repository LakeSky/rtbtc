using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingHotelDetails
/// </summary>
public class BookingHotelDetails
{
    public long hotelInfoId { get; set; }
    public long productId { get; set; }
    public string SupplierName { get; set; }
    public string productName { get; set; }
    public string cityName { get; set; }
    public string productStarsImagePath { get; set; }
    public string productDefaultImagePath { get; set; }
    public string stay { get; set; }
    public string room { get; set; }
    public string guests { get; set; }
    public decimal pricePerPassenger { get; set; }
    public decimal totalPrice { get; set; }
    public DateTime fromDate { get; set; }
    public DateTime toDate { get; set; }
    public List<BookingGuestDetails> guestDetails { get; set; }
}