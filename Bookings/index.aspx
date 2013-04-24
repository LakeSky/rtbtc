<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Bookings_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="hotelsList" style="width:100%;">
    <h3 class="custom-h3 blue-font left">My Bookings</h3>
    <div class="clear"></div>
    <asp:GridView ID="gvBookings" runat="server" 
          onpageindexchanging="gvBookings_PageIndexChanging" 
          onrowdatabound="gvBookings_RowDataBound" Width="100%" 
          CssClass="table table-bordered" AllowPaging="True" PageSize="10">
    </asp:GridView>
  </div>
  <div class="clear"></div>
</asp:Content>

