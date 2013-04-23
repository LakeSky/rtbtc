using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingIndex
/// </summary>
public class BookingIndex
{
    public BookingIndex() {
        guestDetails = new List<BookingIndexGuest>();
    }
    public long bookingId { get; set; }
    public string name { get; set; }
    public string city { get; set; }
    public string country { get; set; }
    public string starsImagePath { get; set; }
    public string defaultImagePath { get; set; }
    public string stay { get; set; }
    public string room { get; set; }
    public string guests { get; set; }
    public decimal pricePerPassenger { get; set; }
    public decimal totalPrice { get; set; }
    public List<BookingIndexGuest> guestDetails { get; set; }
}