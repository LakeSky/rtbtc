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
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_24">
      <div class="title_wrapper">
        <div class="title_inner">
          <span class="title-icon"></span>
          <h2>What's In My Basket?</h2>
        </div>
      </div>
      <div class="contentContainer page_cart">
        <div class="contentBlock">
          <table style="width:100%; border-collapse:collapse;" class="prods_content cart">
            <tbody>
              <tr>
                <th class="th1" style="width:700px;">Product(s)</th>
                <th style="width:70px;"></th>
                <th class="th3" style="border-right-width: 0px;"  width="220px">Total</th>
              </tr>
              <asp:Repeater ID="rptrPackages" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                  <% var rootPath = Route.GetRootPath(""); %>
                  <% var path = Route.GetRootPath("packages/show.aspx"); %>
                  <tr class="packages_row" id="package_<%# Eval("Id") %>">
                    <td class="cart_prods" style="border-width: 0px 1px 1px 0px;width:700px;">
                      <table>
                        <tbody>
                          <tr>
                            <td colspan="2">
                              <div class="name equal-height" style="min-height: 21px;">
                                <div>
                                  <span>
                                    <a href="<%= path %>?id=<%# Eval("PackageId")%>&from=basket">
                                      <%# Eval("PackageName") %>
                                    </a>
                                  </span>
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="text-align:center;" width="120px">
                              <div class="product_pic_wrapper" style="width:120px;height:104px;">
                                <a class="product_img" href="" style="width:120px;height:104px;">
                                  <img src="<%# Eval("DisplayImage") %>" alt="" width="120" height="104" style="width:120px;height:104px;">
                                </a>
                              </div>
                            </td>
                            <td>
                              <h4>Package Start Date: <%# ((DateTime)Eval("ValidFrom")).ToString("dd MMM yyyy") %></h4>
                              <h4>Package End Date: <%# ((DateTime)Eval("ValidTo")).ToString("dd MMM yyyy") %></h4>
                              <h4>Travelling From: <%# ((DateTime)Eval("From")).ToString("dd MMM yyyy") %></h4>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="2">
                            <asp:Repeater ID="rptrPackagePassengers" runat="server"  DataSource='<%# Eval("Passengers") %>'>
                              <HeaderTemplate>
                                <div class="span12" style="margin-left:0;">
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
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                    <td class="cart_update" style="border-width: 0px 1px 1px 0px;">
                      <div class="name equal-height" style="min-height: 22px;">
                        <div>&nbsp;</div>
                      </div>
                      <div class="buttonSet">
                        <strong class="button_content button_content1">
                          <strong class="button bg_button">
                            <a href="<%= path %>?id=<%# Eval("PackageId")%>&from=basket">
                              <span class="ui-button-text">
                                Details
                              </span>
                            </a>
                          </strong>
                        </strong>
                        <br/>
                        <br/>
                        <strong class="button_content button_content2 remove-basket-item" data-id='<%# Eval("Id")%>' data-type="package">
                          <strong class="button bg_button">
                            <a href="#" title="Remove from basket.">
                              <span class="ui-button-text">
                                Remove
                              </span>
                            </a>
                          </strong>
                        </strong>
                      </div>
                    </td>
                    <td class="cart_price" style="border-width: 0px 0px 1px;" width="220px">
                      <div class="name equal-height" style="min-height: 22px;">
                        <div>&nbsp;</div>
                      </div>
                      <span class="productSpecialPrice" style="font-size: 18px;">
                        Price Per Person: <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                        &nbsp;
                        <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("PricePerPerson"), masterCurrencyValue) %>
                        <br />
                        Total Price: <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                        &nbsp;
                        <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("TotalPrice"), masterCurrencyValue) %>
                      </span>
                    </td>
                  </tr>
                </ItemTemplate>
                <SeparatorTemplate>
                  <tr>
                    <td colspan="3" class="cart_hseparator">
                      <% var path = Route.GetRootPath("images/template/spacer.gif"); %>
                        <img src="<%= path %>" alt="" width="1" height="1">
                    </td>
                  </tr>
                </SeparatorTemplate>
                <FooterTemplate>
                </FooterTemplate>
              </asp:Repeater>
              <asp:Repeater ID="rptrHotels" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                  <% var path = Route.GetRootPath("hotels/show.aspx?from=basket"); %>
                  <tr class="hotels_row" id="package_<%# Eval("hotelInfoId") %>">
                    <td class="cart_prods" style="border-width: 0px 1px 1px 0px;width:700px;">
                      <table>
                        <tbody>
                          <tr>
                            <td colspan="2">
                              <div class="name equal-height" style="min-height: 21px;">
                                <div>
                                  <span>
                                    <a href="<%= path %>&sid=<%# Eval("hotelInfoId") %>&id=<%# Eval("productId")%>">
                                      <%# Eval("ProductName")%>
                                      <img src="<%# Eval("productStarsImagePath") %>" alt="" />
                                    </a>
                                  </span>
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="text-align:center;" width="120px">
                              <div class="product_pic_wrapper" style="width:120px;height:104px;">
                                <a class="product_img" href="" style="width:120px;height:104px;">
                                  <img src="<%# Eval("productDefaultImagePath")%>" alt="" width="120" height="104" style="width:120px;height:104px;">
                                </a>
                              </div>
                            </td>
                            <td>
                               <h4>Stay: <%# Eval("stay") %></h4>
                               <h4>Room: <%# Eval("room") %></h4>
                               <h4>Guest: <%# Eval("guests") %></h4>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="2">
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
                          </td>
                        </tbody>
                      </table>
                    </td>
                    <td class="cart_update" style="border-width: 0px 1px 1px 0px;">
                      <div class="name equal-height" style="min-height: 22px;">
                        <div>&nbsp;</div>
                      </div>
                      <div class="buttonSet">
                        <strong class="button_content button_content1">
                          <strong class="button bg_button">
                            <a href="<%= path %>&sid=<%# Eval("hotelInfoId") %>&id=<%# Eval("productId")%>">
                              <span class="ui-button-text">
                                Details
                              </span>
                            </a>
                          </strong>
                        </strong>
                        <br/>
                        <br/>
                        <strong class="button_content button_content2 remove-basket-item" data-id='<%# Eval("hotelInfoId") %>' data-type="hotel">
                          <strong class="button bg_button">
                            <a href="#" title="Remove from basket.">
                              <span class="ui-button-text">
                                Remove
                              </span>
                            </a>
                          </strong>
                        </strong>
                      </div>
                    </td>
                    <td class="cart_price" style="border-width: 0px 0px 1px;" width="220px">
                      <div class="name equal-height" style="min-height: 22px;">
                        <div>&nbsp;</div>
                      </div>
                      <span class="productSpecialPrice" style="font-size: 18px;">
                        Total Price: <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                        &nbsp;
                        <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("totalPrice"), masterCurrencyValue) %>
                      </span>
                    </td>
                  </tr>
                </ItemTemplate>
                <SeparatorTemplate>
                  <tr>
                    <td colspan="3" class="cart_hseparator">
                      <% var path = Route.GetRootPath("images/template/spacer.gif"); %>
                        <img src="<%= path %>" alt="" width="1" height="1">
                    </td>
                  </tr>
                </SeparatorTemplate>
                <FooterTemplate>
                </FooterTemplate>
              </asp:Repeater>
              <tr>
                <td class="cart_prods" style="border-width: 0px 1px 1px 0px; width: 700px;">
                </td>
                <td class="cart_update" style="border-width: 0px 1px 1px 0px;">
                </td>
                <td class="cart_price" style="border-width: 0px 0px 1px;" width="220px">
                  <div class="name equal-height" style="min-height: 22px;">
                    <div>&nbsp;</div>
                  </div>
                  <span class="productSpecialPrice" style="font-size: 18px;">
                    <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                    <%= ApplicationObject.FormattedCurrencyDisplayPrice(basketHelper.totalPrice, masterCurrencyValue) %>
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
  </div>
</asp:Content>

