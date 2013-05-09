<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cancelled.aspx.cs" Inherits="Bookings_cancelled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="row row_2 container_24">
    <div class="grid_24">
      <strong class="button_content button_content1 left">
        <strong class="button bg_button" style="margin-bottom: 9px;">
          <a href="index.aspx">
            <span class="ui-button-text">
              Show Active Bookings
            </span>
          </a>
        </strong>
      </strong>
      <div class="clear"></div>
      <asp:GridView ID="gvBookings" runat="server" 
          onpageindexchanging="gvBookings_PageIndexChanging" 
          onrowdatabound="gvBookings_RowDataBound" Width="100%" 
          CssClass="table table-bordered" AllowPaging="True" PageSize="10">
      </asp:GridView>
    </div>
  </div>
</asp:Content>

