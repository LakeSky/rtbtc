<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="Hotels_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
    #container {
      min-height: 900px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="hotelsList" style="width:100%;">
  <div class="hotel-div">
    <div class="hotel-content">
      <h3><%= bookingHotelDetails.productName %></h3>
      <img src="<%= bookingHotelDetails.productStarsImagePath %>" />
      <br />
      <h4><%= bookingHotelDetails.cityName %></h4>
      <div class="margin10"></div>
      <h4>Stay: <%= bookingHotelDetails.stay %></h4>
      <h4>Room: <%= bookingHotelDetails.room %></h4>
      <h4>Guest: <%= bookingHotelDetails.guests %></h4>
      <h4>Total Price SR.<%= bookingHotelDetails.totalPrice %></h4>
    </div>
    <div class="hotel-image">
      <div class="price">
        Price Per Person SR. <%= bookingHotelDetails.pricePerPerson %>
      </div>
      <img src="<%= bookingHotelDetails.productDefaultImagePath %>" class="media-image" />
    </div>
    <div class="clear"></div>
  </div>
  <div class="margin10"></div>
  <asp:Repeater ID="rptrBookingGuests" runat="server">
    <HeaderTemplate>
      <table class="table">
        <tr>
          <th>Guest Type</th>
          <th>Title</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Age</th>
        </tr>  
    </HeaderTemplate>
    <ItemTemplate>
      <tr>
        <td>
          <asp:HiddenField ID="hdnFldType" runat="server" Value='<%# Eval("type") %>' />
          <asp:HiddenField ID="hdnFldAge" runat="server" Value='<%# Eval("age") %>' />
          <%# Eval("type") %>
        </td>
        <td>
          <asp:DropDownList ID="ddlTitle" runat="server">
            <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem>Mr</asp:ListItem>
            <asp:ListItem>Mrs</asp:ListItem>
            <asp:ListItem>Miss</asp:ListItem>
            <asp:ListItem>Ms</asp:ListItem>
            <asp:ListItem>Dr</asp:ListItem>
            <asp:ListItem>Master</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                      ControlToValidate="ddlTitle" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
        </td>
        <td>
          <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                      ControlToValidate="txtFirstName" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </td>
        <td>
          <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                      ControlToValidate="txtLastName" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </td>
        <td>
          <%# Eval("age")%>
        </td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
        <tr>
          <td colspan="5">
            <asp:Button ID="btnAddToBasket" runat="server" Text="Add to Basket" CssClass="btn btn-success" OnClick="btnAddToBasket_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn btn-primary" Enabled="false" />
          </td>
        </tr>    
      </table>
    </FooterTemplate>
  </asp:Repeater>
</div>
</asp:Content>

