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
}