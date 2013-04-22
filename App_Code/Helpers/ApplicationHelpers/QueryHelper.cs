using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;

/// <summary>
/// Summary description for QueryHelper
/// </summary>
public static class QueryHelper
{
    public static string GetCityName(meis007Entities _meis007Entities, string code){
        var cityName = "";
        var city = _meis007Entities.CityMasters.Where(x => x.CityID == code).FirstOrDefault();
        if (city != null) {
            cityName = city.CityName;
        }
        return cityName;
    }

    public static string GetCountryName(meis007Entities _meis007Entities, string code)
    {
        var countryName = "";
        var country = _meis007Entities.CountryMasters.Where(x => x.CountryID == code).FirstOrDefault();
        if (country != null){
            countryName = country.CountryName;
        }
        return countryName;
    }

}