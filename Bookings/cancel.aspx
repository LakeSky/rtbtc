<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cancel.aspx.cs" Inherits="Bookings_cancel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="row row_2 container_24">
    <div class="grid_24">
      <asp:HiddenField ID="hdnBookingId" runat="server" />
      <strong class="button_content button_content1" style="float:right;">
        <strong class="button bg_button" style="margin-bottom: 9px;">
          <a href="<%= Route.GetRootPath("bookings/index.aspx") %>">
            <span class="ui-button-text">
              My Bookings
            </span>
          </a>
        </strong>
      </strong>
      <div class="clear"></div>
      <div class="contentContainer page_new_product">
        <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="">
          <div class="contentBlock row_view" style="visibility: visible;">
            <div class="content t_view">
              <ul id="view_row-0">  
                <li class="responsive_block first" style="width:100%;">
                  <asp:Repeater ID="rptrBookingIndex" runat="server">
                    <ItemTemplate>
                      <div class="product_block equal-height_products_block">
                        <div class="product_pic_wrapper" style="width:195px;height:195px;">
                          <img src="<%# Eval("defaultImagePath")%>" alt="" width="195" height="195" style="width:195px;height:195px;" />
                        </div>
                        <div class="product_info_wrapper">
                          <div class="data">
                            <div class="fl_left">
                             <img src="<%# Eval("starsImagePath")%>" class="media-image" alt="" />
                            </div>
                            <div class="fl_right">
                          </div>
                        </div>                
                        <div class="row_02">
                          <div class="product_price_wrapper price ">
                            <b>Price:&nbsp;&nbsp;</b>
                            <span class="productSpecialPrice">
                              Price Per Person SR. <%# Eval("pricePerPassenger")%>
                              <br /><br /><br />
                              Total Price SR. <%# Eval("totalPrice") %>
                            </span>
                          </div>
                        </div>
                        <div class="row_01">
                          <h3 class="name equal-height_products_name">
                            <span>
                              <%# Eval("name")%>
                            </span>
                          </h3>
                          <div class="manuf">
                            <span><%# Eval("city") %></span>
                          </div>
                        </div>                
                        <div class="margin10"></div>
                      <div class="clear"></div>
                      <h4><%= CancelText %></h4>
                      <h4>
                        <asp:Button ID="btnCancelBooking" OnClientClick="return confirm('Are you sure?')" OnClick="btnCancelBooking_Click" runat="server" Text="Cancel Booking" CssClass="btn" />
                      </h4>              
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

