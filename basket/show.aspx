<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="basket_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="hotelsList" style="width:100%;">
    <asp:Repeater ID="rptrHotels" runat="server">
      <HeaderTemplate>
      </HeaderTemplate>
      <ItemTemplate>
        <div class="hotel-div">
          <div class="hotel-content">
            <h3><%# Eval("ProductName")%></h3>
            <div class="left">
              <img src="<%# Eval("productStarsImagePath")%>" />
              <br />
              <h4><%# Eval("cityName") %></h4>
            </div>
            <% var path = CurrentUser.GetRootPath("Hotels/Details.aspx"); %>
            <div class="right paddingT10">
              <a href="<%= path %>?id=<%# Eval("cityName")%>" class="btn btn-primary">More Info ></a>
            </div>
            <div class="clear"></div>
            <div class="margin10"></div>
            <%# Eval("cityName")%>
          </div>      
          <div class="hotel-image">
            <div class="price">
              SR. <%# Eval("pricePerPassenger")%>
            </div>
            <img src="<%# Eval("productDefaultImagePath")%>" class="media-image" />
          </div>
          <div class="clear"></div>
          <div class="margin10"></div>
          <h3>Guest Details</h3>
          <asp:Repeater ID="rptrGuests" runat="server" DataSource='<%# Eval("guestDetails") %>'>
            <HeaderTemplate>
              <table class="table table-bordered">
                <tr>
                  <th>Guest Type</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Age</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
              <tr>
                <td><%# Eval("type") %></td>
                <td><%# Eval("title") %>. <%# Eval("firstName") %></td>
                <td><%# Eval("lastName") %></td>
                <td><%# Eval("age") %></td>
              </tr>
            </ItemTemplate>
            <FooterTemplate>
              </table>
            </FooterTemplate>
          </asp:Repeater>
        </div>
      </ItemTemplate>
      <FooterTemplate>
      </FooterTemplate>
    </asp:Repeater>
  </div>
</asp:Content>

