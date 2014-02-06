using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class NavigationData
{
    public static List<NavigationDataList> Get(string rootPath)
    {
        List<NavigationDataList> lst = new List<NavigationDataList>();
        lst.Add(new NavigationDataList { Name = "HOME", Path =  rootPath + "home.aspx" });
        lst.Add(new NavigationDataList { Name = "HOTELS", Path = rootPath + "hotels/search.aspx" });
        lst.Add(new NavigationDataList { Name = "FLIGHTS", Path = rootPath + "amadeusflights.aspx" });
        lst.Add(new NavigationDataList { Name = "CARS", Path = rootPath + "cars.aspx" });
        lst.Add(new NavigationDataList { Name = "ABOUT US", Path = rootPath + "about.aspx" });
        lst.Add(new NavigationDataList { Name = "CONTACT US", Path = rootPath + "contact.aspx" });
        return lst;
    }
}

public class NavigationDataList
{
    public string Name { get; set; }
    public string Path { get; set; }
}