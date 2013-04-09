using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasketHelper
/// </summary>
public class BasketHelper
{
    public decimal totalPrice { get; set; }
    public List<BasketHotelDetails> hotelDetails { get; set; }

    public void calculateTotalPrice() { 
       decimal price = decimal.Parse("0.0");
       foreach (var x in hotelDetails) {
           price += x.totalPrice;
       }
       totalPrice = price;
    }
}