<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/rtbtc/styles/search_box.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      window.city_autocomplete_url = '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>';
      window.room_index = <%= RoomsCount + 1 %>;
    </script>
    <script type="text/javascript" src="/rtbtc/scripts/home_page.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/custom_tabbing.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/hotel_search.js"></script>
    <style type="text/css">
        .no-close .ui-dialog-titlebar-close
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function ShowDialogBox() {
            setTimeout(function () {
                if (Page_IsValid) {
                    $("#hotel-search-dialog").dialog('open');
                }
            }, 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="row row_2 container_24">
    <div class="grid_24 main_slider">
      <div id="search-bar">
        <div id="div-search">
          <h3>Hotel Search</h3>
          <div id="div-destination">
            <label>Where do you want to go?</label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="txtCity txt-large" ValidationGroup="search"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ForeColor="#FF3300" 
            SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
            <label>Which hotel?</label>
            <asp:TextBox ID="txtHotelName" runat="server" CssClass="txt-large txtHotel" ValidationGroup="search"></asp:TextBox>
          </div>
          <div id="div-dates">
            <h4>When do you want to go?</h4>
            <div class="check-in">
              <label>Check In</label>
              <asp:TextBox ID="txtStartDate" runat="server" CssClass="start-date" ValidationGroup="search"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" ForeColor="#FF3300" 
              SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
            </div>
            <div class="check-out">
              <label>Check Out</label>
              <asp:TextBox ID="txtEndDate" runat="server" CssClass="end-date" ValidationGroup="search"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate" ForeColor="#FF3300" 
              SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
            </div>
          </div>
          <div id="div-rooms">
            <h4>How many of you?</h4>
            <div class="clear"></div>
            <table class="rooms-table">
              <tr>
                <th style="width:65px;">&nbsp;</th>
                <th style="width:47px;">Adults</th>
                <th style="width:67px;">Kids(2-12)</th>
                <th style="width:75px;">Infants(0-1)</th>
                <th style="width:40px;">&nbsp;</th>
              </tr>
              <% if(ShoppingRoomsList == null){ %>
                <tr id="room_1">
                  <td>Room 1</td>
                  <td>
                    <select name="rooms[1][adults]" class="ddl-small">
                      <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
                    </select>
                  </td>
                  <td>
                    <select name="rooms[1][kids]" class="ddl-small kids" data-id="1">
                      <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option>
                    </select>
                  </td>
                  <td>
                    <select name="rooms[1][infants]" class="ddl-small">
                      <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option>
                    </select>
                  </td>
                  <td>
                  </td>
                </tr>
              <%}else{%>
                <% int i = 1; %>
                <%foreach (var room in ShoppingRoomsList)
                  { %>
                  <tr id="room_<%= i %>">
                    <td><%= room.RoomName %></td>
                    <td>
                      <select name="rooms[<%= i %>][adults]" class="ddl-small old-ddl" data-value="<%= room.Adults %>" >
                        <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
                      </select>
                    </td>
                    <td>
                      <select name="rooms[<%= i %>][kids]" class="ddl-small kids old-ddl" data-id="<%= i %>"  data-value="<%= room.Kids %>">
                        <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option>
                      </select>
                    </td>
                    <td>
                      <select name="rooms[<%= i %>][infants]" class="ddl-small old-ddl"  data-value="<%= room.Infants %>">
                        <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option>
                      </select>
                    </td>
                    <% if ((i != 1) && (RoomsCount == i))
                     {%>
                     <td>
                       <input type="button" class="btn btn-danger remove-room" value="x" data-id="<%= i %>" id="remove_room_<%= i %>" />
                     </td>
                    <%}
                    else
                    { %>
                     <td>&nbsp;</td>
                    <%} %>
                  </tr>            
                  <% var count = room.ChildAge.Count; %>
                    <% if (count > 0)
                     { %>
                       <tr  id="child_<%= i %>">
                         <td>Child  Ages</td>
                         <% int x = 1; %>
                         <%foreach (var age in room.ChildAge)
                           { %>
                             <td class="td_<%= x %>">
                               <select name="rooms[<%= i %>][kids][age][<%= x %>]" class="ddl-small old-ddl" data-value="<%= age %>" data-id="<%= i %>">
                                 <option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
                               </select> 
                             </td>
                             <% x += 1; %>
                         <%} %>
                         <% if ((4 - count) != 0)
                           {%>
                             <%for (int k = 1; k <= (4 - count); k++)
                                {%>
                                  <td class="td_<%= 4 + k - count %>">&nbsp;</td>
                             <%} %>
                         <%} %>
                       </tr>
                     <%} %>
                     <% i += 1; %>
                   <%} %>
                 <%} %>
               </table>
               <input type="hidden" value="<%= RoomsCount %>" id="totalRooms" name="totalRooms" />
               <input type="hidden" value="<%= CityCode %>" id="cityCode" name="cityCode" />
               <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn custom-button hotel-search-btn " ValidationGroup="search" 
               onclick="btnSearch_Click" OnClientClick="ShowDialogBox();"/>
               <div id="hotel-search-dialog">
                 <h3 class="blue-font">
                   We are now searching hundreds of offers to find you the very best prices. This should only take a few seconds...
                 </h3>
                 <% var path = Route.GetRootPath("Images/ajax-loader.gif"); %>
                 <div class="loading-image">
                   <img alt="" src="<%= path %>" />
                 </div>
               </div>
          </div>
        </div>
      </div>
     <asp:Repeater ID="rptrSlider" runat="server">
          <HeaderTemplate>
            <div class="camera_wrap" id="camera_wrap_1">
          </HeaderTemplate>
          <ItemTemplate>
            <div data-src="<%# Eval("ImagePath") %>" data-thumb="<%# Eval("ImagePath") %>" class="slider_block">
              <div class="camera_caption moveFromRight">
                <span class="slider_text_1"><%# Eval("Title") %></span>
                <span class="slider_text_2">
                  <%# Eval("ImageDesc") %>
                </span>
                <span class="slider_text_3">
                  <small>for only</small>
                  <i><%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %></i>
                  <b><%# Eval("Price") %></b>
                </span>
                <span class="slider_text_4">
                  <a href="" target="_self">
                    <strong class="button_slider">
                      <strong class="button_bg">
                        <strong></strong>
                      </strong>
                      <strong class="button_text">BOOK NOW!</strong>
                    </strong>
                  </a>
                </span>
              </div>
            </div>
          </ItemTemplate>
          <FooterTemplate>
            </div>
          </FooterTemplate>
        </asp:Repeater>
      <div class="clear"></div>
    </div>
  </div>
  <% if (!User.Identity.IsAuthenticated) {%>
    <div class="row row_2 container_24">
      <div class="grid_24">
        <div class="contentContainer page_search">
          <div class="contentBlock" style="width:32%;">
            <div class="contentText">
              <div class="alert alert-danger" runat="server" id="errorDiv"></div>
              <table>
                <tbody>
                  <tr>
                    <td class="fieldKey">
                      <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="#FF3300" 
                      SetFocusOnError="True" ValidationGroup="subscribe">*</asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="#FF3300"
                      ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" ControlToValidate="txtEmail"
                      SetFocusOnError="True" ValidationGroup="subscribe">
                        Please enter valid email !
                      </asp:RegularExpressionValidator>
                    </td>
                    <td class="fieldValue">
                      <div style="margin-bottom: 25px;">
                        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-primary" 
                        onclick="btnSubscribe_Click" ValidationGroup="subscribe" />
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%} %>
  <div class="clear"></div>
  <div class="margin10"></div>
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_24 ">
      <div id="tabvanilla" class="widget">
        <ul class="tabnav" id="tabnav" style="border:none;">
          <li>
            <a href="#tabvanilla-packages">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Top Packages
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#tabvanilla-hotels">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Top Hotels
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#tabvanilla-cities">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Top Destinations
                </strong>
              </strong>
            </a>
          </li>
        </ul>
        <asp:Repeater ID="rptrPackages" runat="server">
          <HeaderTemplate>
            <div id="tabvanilla-packages" class="tabdiv">
              <div class="contentContainer module_new_product">
                <div id="tabs-new_grid">
                  <div class="contentBlock grid_view">
                    <div class="content ">
                      <ul class="row_new_products_name  row_new_products_block" id="view_grid-0">
          </HeaderTemplate>
          <ItemTemplate>
            <% var rootPath = Route.GetRootPath(""); %>
            <li class="responsive_block" style="width:258px">
              <div class="product_block equal-height_new_products_block">
                <div class="product_pic_wrapper" style="width:218px;height:218px;">
                  <a class="product_img" href="<%= rootPath + "packages/show.aspx" %>?id=<%# Eval("PacId") %>" style="width:218px;height:218px;">
                    <img src="<%# Eval("DisplayImage") %>" alt="<%# Eval("PacName") %>" width="218" height="218" style="width:218px;height:218px;"/>
                  </a>
                </div>
                <div class="product_info_wrapper">
                  <div class="row_01">
                    <h3 class="product_name_wrapper name equal-height_new_products_name">
                      <span>
                        <a href="<%= rootPath + "packages/show.aspx" %>?id=<%# Eval("PacId") %>">
                          <%# Eval("PacName") %>
                        </a>
                      </span>
                    </h3>
                  </div>
                  <div class="row_02">
                    <div class="cl_both block">
                      <div class="product_price_wrapper price ">
                        <b>Price:&nbsp;&nbsp;</b>
                        <span class="productSpecialPrice"> <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> &nbsp; <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("PacValueB2C"), masterCurrencyValue) %></span>
                      </div>
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content1">
                        <strong class="button bg_button">
                          <a href="<%= rootPath + "packages/show.aspx" %>?id=<%# Eval("PacId") %>" role="button">
                            <span class="ui-button-text">Details</span>
                          </a>
                        </strong>
                      </strong>
                      <strong class="button_content button_content2">
                        <strong class="button bg_button">
                          <a href="<%= rootPath + "packages/show.aspx" %>?id=<%# Eval("PacId") %>" role="button">
                            <span class="ui-button-text">Details</span>
                          </a>
                        </strong>
                      </strong>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ItemTemplate>
          <SeparatorTemplate>
             <li class="prods_vseparator equal-height_new_products_block">
              <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
            </li>
          </SeparatorTemplate>
          <FooterTemplate>
                      </ul>
                    </div>
                    <strong class="button_content button_content3">
                      <strong class="button bg_button">
                        <a href="<%= Route.GetRootPath("packages/index.aspx") %>" role="button">
                          <span class="ui-button-text">
                            See all Packages
                          </span>
                        </a>
                      </strong>
                    </strong>
                  </div>
                </div>
              </div>
            </div>
          </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="rptrHotels" runat="server">
          <HeaderTemplate>
            <div id="tabvanilla-hotels" class="tabdiv">
              <div class="contentContainer module_new_product">
                <div id="tabs-new_grid">
                  <div class="contentBlock grid_view">
                    <div class="content ">
                      <ul class="row_new_products_name  row_new_products_block" id="view_grid-0">
          </HeaderTemplate>
          <ItemTemplate>
            <% var rootPath = Route.GetRootPath(""); %>
            <li class="responsive_block" style="width:258px">
              <div class="product_block equal-height_new_products_block">
                <div class="product_pic_wrapper" style="width:218px;height:218px;">
                  <a class="product_img top_hotels" data-productname="<%# Eval("ProductName")%>" data-id="<%# Eval("CityCode") %>" data-name="<%# Eval("City") %>"  href="<%= rootPath + "hotels/show.aspx" %>?id=<%# Eval("ProductMasterId") %>" style="width:218px;height:218px;">
                    <img src="<%# Eval("ProductImagePath") %>" alt="<%# Eval("ProductName") %>" width="218" height="218" style="width:218px;height:218px;"/>
                  </a>
                </div>
                <div class="product_info_wrapper">
                  <div class="row_01">
                    <h3 class="product_name_wrapper name equal-height_new_products_name">
                      <span>
                        <%# Eval("ProductName")%>
                      </span>
                    </h3>
                  </div>
                  <div class="row_02">
                    <div class="cl_both block">
                      <div class="product_price_wrapper price ">
                        <b>City:&nbsp;&nbsp;</b>
                        <span class="productSpecialPrice"><%# Eval("City") %></span>
                      </div>
                      <br /><br /><br />
                      <img src="<%# Eval("ProductStarsImagePath") %>" alt="" />
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ItemTemplate>
          <SeparatorTemplate>
             <li class="prods_vseparator equal-height_new_products_block">
              <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
            </li>
          </SeparatorTemplate>
          <FooterTemplate>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="rptrCities" runat="server">
          <HeaderTemplate>
            <div id="tabvanilla-cities" class="tabdiv">
              <div class="contentContainer module_new_product">
                <div id="tabs-new_grid">
                  <div class="contentBlock grid_view">
                    <div class="content ">
                      <ul class="row_new_products_name  row_new_products_block" id="view_grid-0">
          </HeaderTemplate>
          <ItemTemplate>
            <li class="responsive_block" style="width:258px">
              <div class="product_block equal-height_new_products_block">
                <div class="product_pic_wrapper" style="width:218px;height:218px;">
                  <a class="product_img top_destination" href="#" style="width:218px;height:218px;" data-id="<%# Eval("CityId") %>" data-name="<%# Eval("CityName") %>">
                    <img src="<%# Eval("ImgPath") %>" alt="<%# Eval("CityName") %>" width="218" height="218" style="width:218px;height:218px;"/>
                  </a>
                </div>
                <div class="product_info_wrapper">
                  <div class="row_01">
                  </div>
                  <div class="row_02">
                    <div class="cl_both block">
                      <div class="product_price_wrapper price ">
                        <span class="productSpecialPrice"><%# Eval("CityName") %></span>
                      </div>
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content2">
                        <%# Eval("CountryMaster.CountryName") %>
                      </strong>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ItemTemplate>
          <SeparatorTemplate>
             <li class="prods_vseparator equal-height_new_products_block">
              <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
            </li>
          </SeparatorTemplate>
          <FooterTemplate>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </FooterTemplate>
        </asp:Repeater>
      </div>
    </section>
  </div>
<div class="row row_7 container_24">
  <div class="grid_24">
    <div class="boxes_above_footer">
      <div class="banner_set">
        <ul>
          <li class="item-1 grid_8">
            <div class="bannershow_block">
              <img src="/rtbtc/images/template/slider/banner_static_01.png" alt="Banner01 for banner-show" title="Banner01 for banner-show" width="78" height="66" />
            <div class="bannershow_wrapper">
            <div class="bannershow_caption">
              <span class="slider_text_1">
                <b>AUTUMN SALE</b>
              </span>
              <span class="slider_text_2"> 
                up to 70% off
              </span>
              <span class="slider_text_3">
              </span>
              <span class="slider_text_4">
                <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=111&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_blank">
                  <strong class="button_bannershow">
                    <strong class="button_bg">
                    </strong>
                    <strong class="button_text">
                      SHOP NOW!
                    </strong>
                  </strong>
                </a>
              </span>
            </div>
          </div>
        </div>
     </li>
     <li class="item-2 grid_8">
       <div class="bannershow_block">
         <img src="/rtbtc/images/template/slider/banner_static_02.png" alt="Banner02 for banner-show" title="Banner02 for banner-show" width="78" height="66" />
         <div class="bannershow_wrapper">
           <div class="bannershow_caption">
             <span class="slider_text_1">become a fan</span>
             <span class="slider_text_2"><b>ON FACEBOOK</b></span>
             <span class="slider_text_3"></span>
             <span class="slider_text_4">
               <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=112&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_blank">
                 <strong class="button_bannershow">
                   <strong class="button_bg"></strong>
                   <strong class="button_text">CLICK HERE!</strong>
                 </strong>
               </a>
             </span>
           </div>
         </div>
       </div>
     </li>
     <li class="item-3 grid_8">
       <div class="bannershow_block">
         <img src="/rtbtc/images/template/slider/banner_static_03.png" alt="Banner03 for banner-show" title="Banner03 for banner-show" width="78" height="54" />
           <div class="bannershow_wrapper">
             <div class="bannershow_caption">
               <span class="slider_text_1">
                 <b>FREE SHIPPING</b>
               </span>
               <span class="slider_text_2">
                 on orders over $399</span>
               <span class="slider_text_3">
               </span>
               <span class="slider_text_4">
                 <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=113&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_blank">
                   <strong class="button_bannershow">
                     <strong class="button_bg"></strong> 
                     <strong class="button_text">LEARN MORE!</strong>
                   </strong>
                 </a>
               </span>
             </div>
           </div>
         </div>
       </li>
     </ul>
   </div>
   <div class="brands_wrapper">
     <div id="foo1">
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_1.png" alt="manufacturers/brand_example_1.png" title="manufacturers/brand_example_1.png" width="152" height="101" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-2?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_2.png" alt="manufacturers/brand_example_2.png"  title="manufacturers/brand_example_2.png" width="152" height="101" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-3?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_3.png" alt="manufacturers/brand_example_3.png" title="manufacturers/brand_example_3.png" width="152" height="101" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-4?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_4.png" alt="manufacturers/brand_example_4.png" title="manufacturers/brand_example_4.png" width="152" height="101" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-5?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_5.png" alt="manufacturers/brand_example_5.png" title="manufacturers/brand_example_5.png" width="152" height="102" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-6?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_6.png" alt="manufacturers/brand_example_6.png" title="manufacturers/brand_example_6.png" width="152" height="102" />
       </a>
       <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-7?osCsid=qKSS-ugxZQ37A3jke2owD0">
         <img src="/rtbtc/images/template/manufacturers/brand_example_7.png" alt="manufacturers/brand_example_7.png" title="manufacturers/brand_example_7.png" width="152" height="102" />
       </a>
     </div>
     <div class="clearfix">
     </div>
     <a class="prev" id="foo1_prev" href="#">
       <span>prev</span>
     </a>
     <a class="next" id="foo1_next" href="#">
       <span>next</span>
     </a>
   </div>
  </div>
</div>
</div>
<script id='add-remove-room-button-template' type='text/html'>
<input type="button" class="btn btn-danger remove-room" value="x" data-id="{{index}}" id="remove_room_{{index}}" />
</script>
<script id='add-room-template' type='text/html'>
<tr id="room_{{index}}">
<td>Room {{index}}</td>
<td><select name="rooms[{{ index }}][adults]" class="ddl-small"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select> </td>
<td><select name="rooms[{{ index }}][kids]" class="ddl-small kids" data-id="{{index}}"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select></td>
<td><select name="rooms[{{ index }}][infants]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
<td><input type="button" class="btn btn-danger remove-room" value="x" data-id="{{index}}" id="remove_room_{{index}}" /></td>
</tr>
</script>
<script id='add-child-ages-template' type='text/html'>
<tr id="child_{{index}}">
<td>Child Ages</td>
<td class="td_1"></td>
<td class="td_2"></td>
<td class="td_3"></td>
<td class="td_4"></td>
</tr>
</script>
<script id='child-age-dropdown-template' type='text/html'>
<select name="rooms[{{ index }}][kids][age][{{age_index}}]" class="ddl-small" data-id="{{index}}">
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  <option>6</option>
  <option>7</option>
  <option>8</option>
  <option>9</option>
  <option>10</option>
  <option>11</option>
  <option>12</option>
</select> 
</script>
</asp:Content>
