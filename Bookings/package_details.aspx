<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="package_details.aspx.cs" Inherits="Bookings_package_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row row_2 container_24">
        <div class="grid_24">
            <strong class="button_content button_content1" style="float: right;"><strong class="button bg_button"
                style="margin-bottom: 9px;"><a href="<%= Route.GetRootPath("bookings/index.aspx") %>">
                    <span class="ui-button-text">My Package Bookings </span></a></strong></strong>
            <div class="clear">
            </div>
            <div class="contentContainer page_new_product">
                <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="">
                    <div class="contentBlock row_view" style="visibility: visible;">
                        <div class="content t_view">
                            <ul id="view_row-0">
                                <li class="responsive_block first" style="width: 100%;">
                                    <asp:Repeater ID="rptrBookingIndex" runat="server">
                                        <ItemTemplate>
                                            <div class="product_block equal-height_products_block">
                                                <div class="product_pic_wrapper" style="width: 195px; height: 195px;">
                                                    <img src="<%# Eval("DisplayImage")%>" alt="" width="195" height="195" style="width: 195px;
                                                        height: 195px;" />
                                                </div>
                                                <div class="product_info_wrapper">
                                                    <div class="row_02">
                                                        <div class="product_price_wrapper price ">
                                                            <span class="productSpecialPrice">Total Price
                                                                <%# Eval("CurrencyCode") %>.
                                                                <%# Eval("TotalPrice") %>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row_01">
                                                        <h3 class="name equal-height_products_name">
                                                            <span>
                                                                <%# Eval("PackageName") %>
                                                            </span>
                                                        </h3>
                                                        <div class="manuf">
                                                            <span>
                                                                <%# Eval("City") %></span>, &nbsp <span>
                                                                    <%# Eval("Country") %></span>
                                                        </div>
                                                    </div>
                                                    <div class="margin10">
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                    <h4>
                                                        Package Start Date:
                                                        <%# ((DateTime)Eval("ValidFrom")).ToString("dd MMM yyyy") %>
                                                    </h4>
                                                    <h4>
                                                        Package End Date:
                                                        <%# ((DateTime)Eval("ValidTo")).ToString("dd MMM yyyy") %>
                                                    </h4>
                                                    <h4>
                                                        Travelling From:
                                                        <%# ((DateTime)Eval("From")).ToString("dd MMM yyyy") %>
                                                    </h4>
                                                    <asp:Repeater ID="rptrPackagePassengers" runat="server" DataSource='<%# Eval("Passengers") %>'>
                                                        <HeaderTemplate>
                                                            <table class="table table-bordered">
                                                                <tr>
                                                                    <th>
                                                                        Passenger Name
                                                                    </th>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%# Eval("FirstName") %>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
