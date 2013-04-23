<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Bookings_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="hotelsList" style="width:100%;">
    <h3 class="custom-h3 blue-font left">My Bookings</h3>
    <div class="clear"></div>
    <asp:Repeater ID="rptrBookingIndex" runat="server">
      <HeaderTemplate>
       <div class="bookings">
      </HeaderTemplate>
      <ItemTemplate>
        <div class="block-div">
          <div class="block-content left" style="width:710px;">
            <h3><%# Eval("name")%></h3>
            <img src="<%# Eval("starsImagePath")%>" />
            <h4><%# Eval("city") %> <%# Eval("country") %></h4>
            <div class="margin10"></div>
            <h4>Stay: <%# Eval("stay") %></h4>
            <h4>Room: <%# Eval("room") %></h4>
            <h4>Guest: <%# Eval("guests") %></h4>
            <h4>Total Price SR.<%# Eval("totalPrice") %></h4>
          </div>      
          <div class="hotel-image right">
            <div class="price">
              SR. <%# Eval("pricePerPassenger")%> / pax
            </div>
            <img src="<%# Eval("defaultImagePath")%>" alt="" class="media-image" style="width:200px; height:200px" />
          </div>
          <div class="clear"></div>
          <div class="margin10"></div>
          <h3 class="custom-h3 blue-font">Cancellation Policy</h3>
          <div class="div-default div-bordered">
            Cancellation Policy Text
          </div>
          <div class="margin10"></div>
          <h3>Guest Details</h3>
          <asp:Repeater ID="rptrGuests" runat="server" DataSource='<%# Eval("guestDetails") %>'>
            <HeaderTemplate>
              <table class="table table-bordered">
                <tr>
                  <th>Guest Name</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
              <tr>
                <td><%# Eval("name") %></td>
              </tr>
            </ItemTemplate>
            <FooterTemplate>
              </table>
            </FooterTemplate>
          </asp:Repeater>
        </div>
      </ItemTemplate>
      <SeparatorTemplate>
        <hr />
        <div class="margin10"></div>
      </SeparatorTemplate>
      <FooterTemplate>
        </div>
      </FooterTemplate>
    </asp:Repeater>
  </div>
  <div class="clear"></div>
</asp:Content>

