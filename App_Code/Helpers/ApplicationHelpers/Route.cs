using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Route
/// </summary>
public static class Route
{
    public static string GetRedirectPath()
    {
        string returnUrl = "/rtbtc/Home.aspx";
        return returnUrl;
    }

    public static string GetRootPath(string path)
    {
        string returnUrl = "/rtbtc/" + path;
        return returnUrl;
    }
}