﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Account_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        // clear authentication cookie
        HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        cookie1.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie1);
        // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
        HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
        cookie2.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie2);
        FormsAuthentication.RedirectToLoginPage();
        HttpContext.Current.Session.Remove("currentUserId");
        var _homePath = Route.GetRootPath("home.aspx");
        Response.Redirect(_homePath);
    }
}