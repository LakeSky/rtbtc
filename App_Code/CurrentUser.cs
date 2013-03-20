using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for CurrentUser
/// </summary>
public static class CurrentUser
{
    public static int Id()
    {
        var cookie = FormsAuthentication.Decrypt(HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value).UserData;
        //return int.Parse(HttpContext.Current.Session["currentUserId"].ToString());
        return int.Parse(cookie.Split('#')[0].ToString());
    }

    public static string GetRedirectPath()
    {
        string returnUrl = "/rtbtc/Home.aspx";
        return returnUrl;
    }

    public static string GetRootPath(string path) {
        string returnUrl = "/rtbtc/" + path;
        return returnUrl;
    }
}