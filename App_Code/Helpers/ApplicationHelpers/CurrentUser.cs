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
    public static long Id()
    {
        var cookie = FormsAuthentication.Decrypt(HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value).UserData;
        //return int.Parse(HttpContext.Current.Session["currentUserId"].ToString());
        return int.Parse(cookie.Split('#')[0].ToString());
    }
}