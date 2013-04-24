<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="basket_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        function removePackagesDiv() {
            if ($("#packages .package-div").length == 0) {
                $("#packages").remove();
            }
        }

        function removeHotelsDiv() {
            if ($("#hotels .hotel-div").length == 0) {
                $("#hotels").remove();
            }
        }

        removePackagesDiv();
        removeHotelsDiv();

        $(".remove-basket-item").click(function (e) {
            e.preventDefault();
            if (!confirm("Are you sure?")) {
                return false;
            }
            var id = $(this).data('id');
            var type = $(this).data('type');
            var masterCurrency = $(".ddlMasterCurrency").val();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%=ResolveUrl("~/BasketWebService.asmx/RemoveItem") %>',
                data: "{'id': '" + id + "', 'type': '" + type + "', 'masterCurrency': '" + masterCurrency + "'}",
                dataType: "json",
                success: function (data) {
                    var array = data.d.split('#');
                    if (array[0] == 'False') {
                        window.location = "/rtbtc/home.aspx";
                    }
                    $("#basket-items-count").text(array[1]);
                    $(".total-price").html(array[2]);
                    $("#" + type + "_" + id).remove();
                    removeHotelsDiv();
                    removePackagesDiv();
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
    <h3 class="custom-h3 blue-font left">Total Amount <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <span class="total-price"><%= ApplicationObject.FormattedCurrencyDisplayPrice(totalPrice, masterCurrencyValue) %></h3>
    <a class="btn btn-success right" href="<%= Route.GetRootPath("orders/checkout.aspx") %>">Checkout</a>
    <div class="clear"></div>
    <hr />

    <asp:Repeater ID="rptrPackages" runat="server">
      <HeaderTemplate>
        <div id="packages">
          <h3 class="package_heading"> Packages</h3>
      </HeaderTemplate>
      <ItemTemplate>
        <div class="package-div" id='package_<%# Eval("Id") %>'>
          <div class="span9 left">
            <h3 class="custom-h3"><%# Eval("PackageName") %></h3>
            <span class="bold-font"> Package Start Date: </span>
            <%# ((DateTime)Eval("ValidFrom")).ToString("dd MMM yyyy") %>
            <br />
            <span class="bold-font"> Package End Date: </span>
            <%# ((DateTime)Eval("ValidTo")).ToString("dd MMM yyyy") %>
            <br />
            <span class="bold-font">Travelling From: </span>
            <%# ((DateTime)Eval("From")).ToString("dd MMM yyyy") %>
            <br />
            <span class="bold-font">Price Per Person <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> </span>
            <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("PricePerPerson"), masterCurrencyValue) %>
            <br />
            <span class="bold-font">Total Price SR. </span>
            <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("TotalPrice"), masterCurrencyValue) %>
            <br />
            <% var path = Route.GetRootPath("packages/show.aspx"); %>
            <a class="btn btn-primary" href="<%= path %>?id=<%# Eval("PackageId")%>&from=basket">More Info</a>
          </div>
          <div class="span3 right">
            <div class="price">
              <span class="left">Price Per Person SR. <%# Eval("PricePerPerson") %></span>
              <a  href="#" title="Remove from basket." class="btn btn-danger right remove-basket-item" data-id='<%# Eval("Id")%>' data-type="package">X</a>
              <div class="clear"></div>
            </div>
            <img src="<%# Eval("DisplayImage") %>" alt="" class="media-image" style="width:200px; height:200px"/>
          </div>
          <div class="clear"></div>
        <asp:Repeater ID="rptrPackagePassengers" runat="server"  DataSource='<%# Eval("Passengers") %>'>
          <HeaderTemplate>
            <div class="span12" style="margin-left:0;">
              <h3 class="custom-h3 left" >Passenger Details</h3>
              <br />
              <table class="table table-bordered">
                <tr>
                  <th>Title</th>
                 <th>First Name</th>
                  <th>Middle Name</th>
                  <th>Last Name</th>
                </tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td><%# Eval("Title") %></td>
              <td><%# Eval("FirstName") %></td>
              <td><%# Eval("MiddleName") %></td>
              <td><%# Eval("LastName") %></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
              </table>
            </div>
            <hr />
          </FooterTemplate>
        </asp:Repeater>
        </div>
      </ItemTemplate>
      <FooterTemplate>
        </div>
        <hr />
      </FooterTemplate>
    </asp:Repeater>


    <asp:Repeater ID="rptrHotels" runat="server">
      <HeaderTemplate>
       <div id="hotels">
          <h3 class="hotel_heading">Hotels</h3>
      </HeaderTemplate>
      <ItemTemplate>
        <div class="hotel-div" id='hotel_<%# Eval("hotelInfoId") %>'>
          <div class="hotel-content" style="width:710px;">
            <h3><%# Eval("ProductName")%></h3>
            <div class="left">
              <img src="<%# Eval("productStarsImagePath")%>" />
              <br />
              <h4><%# Eval("cityName") %></h4>
            </div>
             <% var path = Route.GetRootPath("hotels/show.aspx?from=basket"); %>
            <div class="right paddingT10">
              <a href="<%= path %>&sid=<%# Eval("hotelInfoId") %>&id=<%# Eval("productId")%>" class="btn btn-primary">More Info ></a>
            </div>
            <div class="clear"></div>
            <div class="margin10"></div>
            <h4>Stay: <%# Eval("stay") %></h4>
            <h4>Room: <%# Eval("room") %></h4>
            <h4>Guest: <%# Eval("guests") %></h4>
            <h4>Total Price <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("totalPrice"), masterCurrencyValue) %></h4>
          </div>      
          <div class="hotel-image">
            <div class="price">
              <span class="left"> <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("pricePerPassenger"), masterCurrencyValue) %> / pax</span>
              <a  href="#" title="Remove from basket." class="btn btn-danger right remove-basket-item" data-id='<%# Eval("hotelInfoId") %>' data-type="hotel">X</a>
              <div class="clear"></div>
            </div>
            <img src="<%# Eval("productDefaultImagePath")%>" alt="" class="media-image" style="width:200px; height:200px" />
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
        </div>
      </FooterTemplate>
    </asp:Repeater>
  </div>
  <div class="clear"></div>
</asp:Content>

