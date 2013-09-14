using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

/// <summary>
/// Summary description for ApplicationObject
/// </summary>
public static  class ApplicationObject
{
    public static string GetBaseCurrency() {
        var baseCurrency = HttpContext.Current.Session["BaseCurrency"] as string;
        if (string.IsNullOrEmpty(baseCurrency)) {
            baseCurrency = DbParameter.GetBaseCurrency();
            HttpContext.Current.Session["BaseCurrency"] = baseCurrency;
        }
        return baseCurrency;
    }

    public static string GetMasterCurrency(string selectedValue){
        var masterCurrency = HttpContext.Current.Session["MasterCurrencySelectedValue"] as string;
        if (string.IsNullOrEmpty(masterCurrency))
        {
            masterCurrency = selectedValue;
            HttpContext.Current.Session["MasterCurrencySelectedValue"] = masterCurrency;
        }
        return masterCurrency;
    }

    public static CurrencyMaster GetBaseCurrencyObject(){
        meis007Entities _meis007Entities = new meis007Entities();
        var baseCurrencyCode = GetBaseCurrency();
        var baseCurrency = _meis007Entities.CurrencyMasters.Where(x => x.CurID == baseCurrencyCode).First();
        return baseCurrency;
    }

    public static CurrencyMaster GetMasterCurrencyObject(string selectedValue) {
        meis007Entities _meis007Entities = new meis007Entities();
        var masterCurrencyCode = GetMasterCurrency(selectedValue);
        var masterCurrency = _meis007Entities.CurrencyMasters.Where(x => x.CurID == masterCurrencyCode).FirstOrDefault();
        if (masterCurrency == null) {
            masterCurrency = GetBaseCurrencyObject();
        }
        return masterCurrency;
    }

    public static decimal FormattedCurrencyDisplayPrice(object price, string selectedValue) {
        if (price == null) {
            return decimal.Parse("0.0");
        }
        decimal formattedPrice = decimal.Parse(price.ToString());
        var masterCurrency = GetMasterCurrency(selectedValue);
        var baseCurrency = GetBaseCurrency();
        if (masterCurrency == baseCurrency) {
            return formattedPrice;
        }
        var obj = GetMasterCurrencyObject(selectedValue);
        return Math.Floor(formattedPrice / decimal.Parse(obj.SellingExRate.ToString()));
    }

    public static string FormatBookingStatus(string type = "CC")
    {
        string status = "Confirmed";
        if (type == "XX" || type == "OX")
        {
            status = "Cancelled";
        }
        else if (type == "CX")
        {
            status = "Cancelled";
        }
        else if (type == "OR")
        {
            status = "On Request";
        }
        return status;
    }

    public static List<string> SearchFields(string type = "Hotel")
    {
        List<string> list = new List<string>();
        list.Add("No Search Field");
        list.Add("Booking Id");
        list.Add("Pax Name");
        if (type != "Others")
        {
            list.Add("City Name");
            if (type == "Hotel")
            {
                list.Add("Hotel Name");
            }
            else
            {
                list.Add("Package Name");
            }
        }
        list.Add("Checkin Date");
        list.Add("Price");
        return list;
    }

    public static List<TextValue> GetBookingStatus()
    {
        List<TextValue> list = new List<TextValue>();
        TextValue obj;
        obj = new TextValue { Text = "All", Value = "all" };
        list.Add(obj);
        obj = new TextValue { Text = "Confirmed", Value = "CC" };
        list.Add(obj);
        obj = new TextValue { Text = "Cancelled", Value = "XX" };
        list.Add(obj);
        return list;
    }

    public static string GetServiceName(string type)
    {
        string name = string.Empty;
        if (type == "hotel")
        {
            name = DbParameter.GetServiceName(1);
        }
        else if (type == "package")
        {
            name = DbParameter.GetServiceName(4);
        }
        else
        {
            name = DbParameter.GetServiceName(7);
        }
        return name;
    }
}