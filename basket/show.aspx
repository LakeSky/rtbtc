<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="basket_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {
        $(".remove-basket-item").click(function (e) {
            e.preventDefault();
            if (!confirm("Are you sure?")) {
                return false;
            }
            var id = $(this).data('id');
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%=ResolveUrl("~/BasketWebService.asmx/RemoveItem") %>',
                data: "{'id': '" + id + "'}",
                dataType: "json",
                success: function (data) {
                    var array = data.d.split('#');
                    if (array[0] == 'False') {
                        window.location = "/rtbtc/home.aspx";
                    }
                    $("#basket-items-count").text(array[1]);
                    $("#" + id).remove();
                },
                error: function (result) {
                    console.log(result);
                }
            });
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div id="hotelsList" style="width:100%;">
    <asp:Repeater ID="rptrHotels" runat="server">
      <HeaderTemplate>
      </HeaderTemplate>
      <ItemTemplate>
        <div class="hotel-div" id='<%# Eval("hotelInfoId") %>'>
          <div class="hotel-content" style="width:710px;">
            <h3><%# Eval("ProductName")%></h3>
            <div class="left">
              <img src="<%# Eval("productStarsImagePath")%>" />
              <br />
              <h4><%# Eval("cityName") %></h4>
            </div>
            <% var path = CurrentUser.GetRootPath("Hotels/Details.aspx"); %>
            <div class="right paddingT10">
              <a href="<%= path %>?id=<%# Eval("productId")%>" class="btn btn-primary">More Info ></a>
            </div>
            <div class="clear"></div>
            <div class="margin10"></div>
            <h4>Stay: <%# Eval("stay") %></h4>
            <h4>Room: <%# Eval("room") %></h4>
            <h4>Guest: <%# Eval("guests") %></h4>
            <h4>Total Price SR.<%# Eval("totalPrice") %></h4>
          </div>      
          <div class="hotel-image">
            <div class="price">
              <span class="left">SR. <%# Eval("pricePerPassenger")%> / pax</span>
              <a  href="#" title="Remove from basket." class="btn btn-danger right remove-basket-item" data-id='<%# Eval("hotelInfoId") %>'>X</a>
              <div class="clear"></div>
            </div>
            <img src="<%# Eval("productDefaultImagePath")%>" class="media-image" />
          </div>
          <div class="clear"></div>
          <div class="margin10"></div>
          <h3 class="custom-h3 blue-font">Cancellation Policy</h3>
          <div class="div-default div-bordered">
            Cancellation Policy Text
          </div>
          <div class="margin10"></div>
          <hr />
          <h3>Guest Details</h3>
          <asp:Repeater ID="rptrGuests" runat="server" DataSource='<%# Eval("guestDetails") %>'>
            <HeaderTemplate>
              <table class="table table-bordered">
                <tr>
                  <th>Guest Type</th>
                  <th>First Name</th>
                  <th>Middle Name</th>
                  <th>Last Name</th>
                  <th>Age</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
              <tr>
                <td><%# Eval("type") %></td>
                <td><%# Eval("title") %>. <%# Eval("firstName") %></td>
                <td><%# Eval("middleName") %></td>
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
  <div class="clear"></div>
</asp:Content>

