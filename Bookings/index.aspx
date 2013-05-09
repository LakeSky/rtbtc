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
  <div class="row row_2 container_24">
    <div class="grid_24">
      <strong class="button_content button_content1 left">
        <strong class="button bg_button" style="margin-bottom: 9px;">
          <a href="cancelled.aspx">
            <span class="ui-button-text">
              Show Cancelled Bookings
            </span>
          </a>
        </strong>
      </strong>
      <div class="clear"></div>
      <input id="txtBookingSearch" type="text" class="txtBookingSearch right" placeholder="Search Booking" />
      <div class="clear"></div>
      <asp:GridView ID="gvBookings" runat="server" 
          onpageindexchanging="gvBookings_PageIndexChanging" 
          onrowdatabound="gvBookings_RowDataBound" Width="100%" 
          CssClass="table table-bordered" AllowPaging="True" PageSize="10">
      </asp:GridView>
    </div>
  </div>
</asp:Content>

