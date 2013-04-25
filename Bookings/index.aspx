<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Bookings_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <script type="text/javascript">
      $(function () {
          $(".txtBookingSearch").autocomplete({
              change: function (event, ui) {
                  if (ui.item == null) {
                      $(".txtBookingSearch").val('');
                      $(".txtBookingSearch").focus();
                  }
              },
              source: function (request, response) {
                  $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: '<%=ResolveUrl("~/ApplicationWebService.asmx/SearchBooking") %>',
                      data: "{ 'q': '" + request.term + "'}",
                      dataType: "json",
                      success: function (data) {
                          var array = [];
                          $.each(data.d, function (i, x) {
                              var obj = {}
                              obj['id'] = x.Id;
                              obj['label'] = x.Text;
                              obj['name'] = x.Text;
                              array.push(obj);
                          });
                          response(array);
                      },
                      error: function (result) {
                          console.log(result);
                      }
                  });
              },
              select: function (e, ui) {
                  window.location = "show.aspx?id=" + ui.item.id;
              }
          });
      });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="hotelsList" style="width:100%;">
    <h3 class="custom-h3 blue-font left">My Bookings</h3>
    <input id="txtBookingSearch" type="text" class="txtBookingSearch right" placeholder="Search Booking" />
    <div class="clear"></div>
    <asp:GridView ID="gvBookings" runat="server" 
          onpageindexchanging="gvBookings_PageIndexChanging" 
          onrowdatabound="gvBookings_RowDataBound" Width="100%" 
          CssClass="table table-bordered" AllowPaging="True" PageSize="10">
    </asp:GridView>
  </div>
  <div class="clear"></div>
</asp:Content>

