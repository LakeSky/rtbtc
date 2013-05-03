<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="Hotels_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
    #container {
      min-height: 900px;
    }
    td label{
        display: inline-block;
        margin-left: 5px;
    }
  </style>
  <script type = "text/javascript">
      function ValidateCheckBox(sender, args) {
        if (document.getElementById("ckbAgree").checked == true) {
          args.IsValid = true;
        } else {
          args.IsValid = false;
        }
      }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:HiddenField ID="hdnFldHotelInfoId" runat="server" />
  <asp:HiddenField ID="hdnFldFromDate" runat="server" />
  <asp:HiddenField ID="hdnFldToDate" runat="server" />
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_6">
      <div class="ui-widget infoBoxContainer box_list"> 
        <div class="ui-widget-header infoBoxHeading">
          Current Search
        </div>
        <div class="infoBoxContents">
          <ul>
            <li>Stay: <%= bookingHotelDetails.stay %></li>
            <li>Room: <%= bookingHotelDetails.room %></li>
            <li>Guest: <%= bookingHotelDetails.guests %></li>
            <li>Total Price <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%= ApplicationObject.FormattedCurrencyDisplayPrice(bookingHotelDetails.totalPrice, masterCurrencyValue) %></li>
          </ul>
        </div>
      </div>
      <div class="ui-widget infoBoxContainer box_list"> 
        <div class="ui-widget-header infoBoxHeading">
          Cancellation Policy
        </div>
        <div class="infoBoxContents">
          <ul>
             <asp:Repeater ID="rptrCancelPolicies" runat="server"  >
               <HeaderTemplate>
               </HeaderTemplate>
               <ItemTemplate>
                 <li>
                   <%# Eval("ChargingType")%>  <%# Eval("FromDate") %> <%# Eval("ToDate") %>
                 </li>
               </ItemTemplate>
               <FooterTemplate>
               </FooterTemplate>
             </asp:Repeater>
          </ul>
        </div>
      </div>
    </section>
    <aside id="columnRight" class="col grid_18">
      <div class="contentContainer page_new_product">
        <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="">
          <div class="contentBlock row_view" style="visibility: visible;">
            <div class="content t_view">
              <ul id="view_row-0">  
                <li class="responsive_block first" style="width:100%;">
                  <div class="product_block equal-height_products_block">
                    <div class="product_pic_wrapper" style="width:195px;height:195px;">
                      <img src="<%= bookingHotelDetails.productDefaultImagePath %>" alt="<%= bookingHotelDetails.productName %>" width="195" height="195" style="width:195px;height:195px;" />
                    </div>
                    <div class="product_info_wrapper">
                     <div class="data">
                       <div class="fl_left">
                         <img src="<%= bookingHotelDetails.productStarsImagePath %>" class="media-image" alt="" />
                       </div>
                       <div class="fl_right">
                       </div>
                     </div>                
                     <div class="row_02">
                       <div class="product_price_wrapper price ">
                         <b>Price:&nbsp;&nbsp;</b>
                         <span class="productSpecialPrice">
                            Price Per Person <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                           &nbsp;
                           <%= ApplicationObject.FormattedCurrencyDisplayPrice(bookingHotelDetails.totalPrice, masterCurrencyValue) %>
                         </span>
                       </div>
                     </div>
                     <div class="row_01">
                       <h3 class="name equal-height_products_name">
                         <span>
                           <a href="">
                             <%= bookingHotelDetails.productName %>
                           </a>
                         </span>
                       </h3>
                       <div class="manuf">
                         <span><%= bookingHotelDetails.cityName %></span>
                        </div>
                     </div>                
                     <div class="margin10"></div>
                   </div>                  
                   <h3 class="custom-h3 blue-font">
                     <% if(!User.Identity.IsAuthenticated) {%>
                       <% var path = Route.GetRootPath("account"); %>
                       <% var bookingId = Request.QueryString["id"]; %>
                       <span class="right">
                         To Book or add to basket use
                         <a href="<%= path %>/login.aspx?bookingtype=hotel&bookingid=<%= bookingId %>">Existing Account</a>
                         |
                         <a href="<%= path %>/register.aspx?bookingtype=hotel&bookingid=<%= bookingId %>">New Account</a>
                       </span>
                     <%} %>
                     <div class="clear"></div>
                   </h3>
                   <asp:Repeater ID="rptrBookingGuests" runat="server"  OnItemDataBound="rptrBookingGuests_ItemDataBound" >
                    <HeaderTemplate>
                      <table class="table">
                        <tr>
                          <th>Guest Type</th>
                          <th>Title</th>
                          <th>First Name</th>
                          <th>Middle Name</th>
                          <th>Last Name</th>
                          <th>Age</th>
                        </tr>  
                      </HeaderTemplate>
                      <ItemTemplate>
                        <tr>
                          <td>
                            <asp:HiddenField ID="hdnFldType" runat="server" Value='<%# Eval("type") %>' />
                            <asp:HiddenField ID="hdnFldAge" runat="server" Value='<%# Eval("age") %>' />
                            <asp:HiddenField ID="hdnFldTitle" runat="server" Value='<%# Eval("title") %>' />
                            <%# Eval("type") %>
                          </td>
                          <td>
                            <asp:DropDownList ID="ddlTitle" runat="server"  CssClass="input-small">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                              <asp:ListItem>Mr</asp:ListItem>
                              <asp:ListItem>Mrs</asp:ListItem>
                              <asp:ListItem>Miss</asp:ListItem>
                              <asp:ListItem>Ms</asp:ListItem>
                              <asp:ListItem>Dr</asp:ListItem>
                              <asp:ListItem>Master</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="ddlTitle" ForeColor="#FF3300" 
                            SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
                          </td>
                          <td>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-small" Text='<%# Eval("firstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="#FF3300" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                          </td>
                          <td>
                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="input-small" Text='<%# Eval("middleName") %>'></asp:TextBox>
                          </td>
                          <td>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="input-small" Text='<%# Eval("lastName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ForeColor="#FF3300" 
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
                            <% if (User.Identity.IsAuthenticated){%>
                              <asp:CheckBox ID="ckbAgree" runat="server" Text="I have read and  agree cancellation policy!" ClientIDMode="Static" />
                              <asp:CustomValidator ID="CustomValidator" runat="server" ErrorMessage="" ClientValidationFunction = "ValidateCheckBox" Text="*"  ForeColor="#FF3300"></asp:CustomValidator>
                            <%} %>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="5">
                            <% if (User.Identity.IsAuthenticated){%>
                              <asp:Button ID="btnAddToBasket" runat="server" Text="Add to Basket" CssClass="btn btn-success" OnClick="btnAddToBasket_Click" />
                            <%} %>
                          </td>
                        </tr>    
                      </table>
                      </FooterTemplate>
                    </asp:Repeater>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </aside>
  </div>
</asp:Content>

