<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="temp.aspx.cs" Inherits="temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<div id="wrapper">
      <div id="header-wrapper">
        <div id="header-content">
          <div id="header">
            <div class="logo">
              <h3> Riyadh Travels </h3>
            </div>
            <div class="header-right-link">
              <div class="top-sign-up">
                <% if (Page.User.Identity.IsAuthenticated){%>
                  <% var _logoutPath = Route.GetRootPath("account/logout.aspx"); %>
                  <% var _accountPath = Route.GetRootPath("currentuser/myaccount.aspx"); %>
                  <a href="<%= Route.GetRootPath("bookings/index.aspx") %>">My Bookings</a>
                  | 
                  <a href="<%= _accountPath %>">My Account</a>
                  |
                  <a href="<%= _logoutPath %>">Log out</a>
                <%}else{ %>
                  <% var _registerPath = Route.GetRootPath("account/register.aspx"); %>
                  <% var _loginPath = Route.GetRootPath("account/login.aspx"); %>
                  <% var _forgotPasswordPath = Route.GetRootPath("account/forgotpassword.aspx"); %>
                  <a href="<%= _registerPath %>">Register</a>
                  |
                  <a href="<%= _loginPath %>">Login</a>
                  |
                  <a href="<%= _forgotPasswordPath %>">Forgot Password?</a>
                <%} %>
                |
                <asp:DropDownList ID="ddlMasterCurency" runat="server" AutoPostBack="True" 
                      onselectedindexchanged="ddlMasterCurency_SelectedIndexChanged" CssClass="ddl-custom ddlMasterCurrency"></asp:DropDownList>
              </div>
            </div>
            <div class="clear"></div>
            <div class="navigation">
              <% var rootPath = Route.GetRootPath(""); %>
              <ul class="left">
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/home.aspx" ? "active" : "" %>"><a href="<%= rootPath + "home.aspx" %>">Home</a></li>
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/hotels/search.aspx" ? "active" : "" %>"><a href="<%= rootPath + "hotels/search.aspx" %>">Hotels</a></li>
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/flights.aspx" ? "active" : "" %>"><a href="<%= rootPath + "flights.aspx" %>">Flights</a></li>
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/cars.aspx" ? "active" : "" %>"><a href="<%= rootPath + "cars.aspx" %>">Cars</a></li>
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/about.aspx" ? "active" : "" %>"><a href="<%= rootPath + "about.aspx" %>">About Us</a></li>
                <li  class="<%= Request.Url.AbsolutePath.ToString().ToLower() == "/rtbtc/contact.aspx" ? "active" : "" %>"><a href="<%= rootPath + "contact.aspx" %>">Contact Us</a></li>
              </ul>
              <ul class="right">
              <% var klass = "hasBasketItems" == "" ? "has-basket-items" : "no-basket-items"; %>
                <li><a href="<%= Route.GetRootPath("basket/show.aspx") %>" class="basket-items <%= klass %>">Basket (<span id="basket-items-count"><%= basketItemsCount %></span>)</a></li>
              </ul>
              <div class="clear"></div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>
      <div id="middle-content">
        <div id="container">
          <% if (Session["NoticeMessage"] != null)
               {%>
               <div class="alert alert-success">
                 <h4><%= Session["NoticeMessage"]%>  <a class="right close">X</a></h4>
                 <div class="clear"></div>
                 <% Session["NoticeMessage"] = null; %>
               </div>
            <%} %>
            <% if (Session["ErrorMessage"] != null)
               {%>
               <div class="alert alert-danger">
                 <h4><%= Session["ErrorMessage"]%> <a class="right close">X</a></h4>
                 <div class="clear"></div>
                 <% Session["ErrorMessage"] = null; %>
               </div>
            <%} %>
          
          <div id="empty-basket">
            <h3 class="blue-font">You dont have any items in basket!</h3>
          </div>
        </div>
      </div>
      </div>
      <div id="footer-content">
        <div id="footer">
          <div class="footer-navigation">
            <ul>
              <li>
                <a href="<%= rootPath + "home.aspx" %>">Home</a>
                <span>|</span>
              </li>
              <li>
                <a href="<%= rootPath + "hotels/index.aspx" %>">Hotels</a>
                <span>|</span>
              </li>
              <li>
                <a href="<%= rootPath + "flights.aspx" %>">Flights</a>
                <span>|</span>
              </li>
              <li>
                <a href="<%= rootPath + "cars.aspx" %>">Cars</a>
                <span>|</span>
              </li>
              <li>
                <a href="<%= rootPath + "about.aspx" %>">About Us</a>
                <span>|</span>
              </li>
              <li><a href="<%= rootPath + "contact.aspx" %>">Contact Us</a></li>
              <div class="clear"></div>
            </ul>
          </div>
          <div class="copy-right">
            &copy; <%= DateTime.Now.Year %>. Riyadh Travels
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>



    <!---------------------------------------->



                    <!----------------- home page --->
                 
</asp:Content>

