using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasketHelper
/// </summary>
public class BasketHelper
{
    public long BasketSequenceNumber { get; set; }
    public string ErrorMessage { get; set; }
    public decimal totalPrice { get; set; }
    public List<BasketHotelDetails> hotelDetails { get; set; }
    public List<BasketPackageDetails> packageDetails { get; set; }

    public BasketHelper()
    {
        hotelDetails = new List<BasketHotelDetails>();
        packageDetails = new List<BasketPackageDetails>();
    }

    public void calculateTotalPrice()
    {
        decimal price = decimal.Parse("0.0");
        if (hotelDetails != null)
        {
            foreach (var x in hotelDetails)
            {
                price += x.totalPrice;
            }
        }
        if (packageDetails != null)
        {
            foreach (var x in packageDetails)
            {
                price += decimal.Parse(x.TotalPrice.ToString());
            }
        }
        totalPrice = price;
    }

    public int GetNextPackageId()
    {
        return packageDetails.Count + 1;
    }

    public int PackagesCount()
    {
        return packageDetails.Count;
    }

    public int HotelsCount()
    {
        return hotelDetails.Count;
    }

    public int TotalItemsCount()
    {
        return PackagesCount() + HotelsCount();
    }
}