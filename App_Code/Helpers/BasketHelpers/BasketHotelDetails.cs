﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class BasketHotelDetails
{
    public long hotelInfoId { get; set; }
    public string sessionId { get; set; }
    public string supplierId { get; set; }
    public string SupplierName { get; set; }
    public string supplierHotelId { get; set; }
    public string supplierRoomId { get; set; }
    public int NoOfNights { get; set; }
    public int NoOfPassengers { get; set; }
    public int NoOfChildren { get; set; }
    public long productId { get; set; }
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
    public List<BasketHotelGuestDetails> guestDetails { get; set; }
    public int InfantNum { get; set; } //shams added 
    public string Title { get; set; }//shams added 
    public string AgentText { get; set; }//shams added 
    public string searchId { get; set; } // shams added 
}