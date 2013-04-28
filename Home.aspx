<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/rtbtc/Styles/packages_slider.css" rel="stylesheet" type="text/css" />
    <link href="/rtbtc/Styles/home_page.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      window.city_autocomplete_url = '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>';
      window.room_index = <%= RoomsCount + 1 %>;
    </script>
    <script type="text/javascript" src="/rtbtc/Scripts/packages_slider.js"></script>
    <script type="text/javascript" src="/rtbtc/Scripts/hotel_search.js"></script>
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
    <div class="grid_24">
      <div class="camera_wrap" id="camera_wrap_1">
        <div data-src="/rtbtc/images/template/slider/banner_slider_01.jpg" data-thumb="/rtbtc/images/template/slider/banner_slider_01.jpg" class="slider_block">
          <div class="camera_caption moveFromRight">
            <span class="slider_text_1">The New Canon PowerShot SX240 HS</span> <span class="slider_text_2">
              English Description - Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
              sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
              Ut wisi enim ad minim...
            </span>
            <span class="slider_text_3">
              <small>for only</small>
              <i>$</i>
              <b>139.95</b>
            </span>
            <span class="slider_text_4">
              <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=101&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_self">
                <strong class="button_slider">
                  <strong class="button_bg">
                    <strong></strong>
                  </strong>
                  <strong class="button_text">SHOP NOW!</strong>
                </strong>
              </a>
            </span>
          </div>
        </div>
        <div data-src="/rtbtc/images/template/slider/banner_slider_02.jpg" data-thumb="/rtbtc/images/template/slider/banner_slider_02.jpg" class="slider_block">
          <div class="camera_caption moveFromRight">
            <span class="slider_text_1">
              iMac All-in-One Poweful Desktop
            </span>
            <span class="slider_text_2">
              English Description - Veniam, quis nostrud exerci tation ullamcorper suscipit lobortis
              nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit
              in vulputate velit esse...
            </span>
            <span class="slider_text_3">
              <small>for only</small>
              <i>$</i>
              <b>1199.00</b>
            </span>
            <span class="slider_text_4">
              <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=102&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_self">
                <strong class="button_slider">
                  <strong class="button_bg">
                    <strong></strong>
                  </strong>
                  <strong class="button_text">SHOP NOW!</strong>
                </strong>
              </a>
            </span>
          </div>
        </div>
        <div data-src="/rtbtc/images/template/slider/banner_slider_03.jpg" data-thumb="/rtbtc/images/template/slider/banner_slider_03.jpg" class="slider_block">
          <div class="camera_caption moveFromRight">
            <span class="slider_text_1">iPod Touch The Brilliant New Design</span>
            <span class="slider_text_2">
              English Description - Accumsan et iusto odio dignissim qui blandit praesent luptatum
              zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum
              soluta nobis eleifend option...
            </span>
            <span class="slider_text_3">
              <small>for only</small>
              <i>$</i>
              <b>199.00</b>
            </span>
            <span class="slider_text_4">
              <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=103&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" target="_self">
                <strong class="button_slider">
                  <strong class="button_bg">
                    <strong></strong>
                  </strong>
                  <strong class="button_text">SHOP NOW!</strong>
                </strong>
              </a>
            </span>
          </div>
        </div>
      </div>
      <div class="customer_greeting">
        <strong>
          Welcome <span class="greetUser">Guest!</span>
        </strong>
          Would you like to
          <a href="http://www.responsive-shop.com/osc/tstore/3/login.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
            <u>log yourself in</u>
          </a>
          ? Or would you prefer to
          <a href="http://www.responsive-shop.com/osc/tstore/3/create_account.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
            <u>create an account</u>
          </a>
          ?
      </div>
      <div class="welcome">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex.
      </div>
    </div>
  </div>
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_24 ">
      <div id="tabvanilla" class="widget">
        <ul class="tabnav" id="tabnav">
          <li>
            <a href="#new">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  New
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#featured">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Featured
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#box_toogle_pos_1">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Popular
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#box_toogle_pos_2">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Special
                </strong>
              </strong>
            </a>
          </li>
          <li>
            <a href="#box_toogle_pos_3">
              <strong class="title_wrapper">
                <strong class="title_inner">
                  <span class="title-icon"></span>
                  Reviews
                </strong>
              </strong>
            </a>
          </li>
        </ul>
        <asp:Repeater ID="rptrPackages" runat="server">
          <HeaderTemplate>
            <div id="new" class="tabdiv">
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
                    <img src="<%# Eval("DisplayImage") %>" alt="<%# Eval("PacName") %>" title="Product #001" width="218" height="218" style="width:218px;height:218px;"/>
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
                  </div>
                </div>
              </div>
            </div>
          </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="rptrHotels" runat="server">
          <HeaderTemplate>
            <div id="featured" class="tabdiv">
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
                  <a class="product_img" href="<%= rootPath + "hotels/show.aspx" %>?id=<%# Eval("ProductMasterId") %>" style="width:218px;height:218px;">
                    <img src="<%# Eval("ProductImagePath") %>" alt="<%# Eval("ProductName") %>" title="Product #001" width="218" height="218" style="width:218px;height:218px;"/>
                  </a>
                </div>
                <div class="product_info_wrapper">
                  <div class="row_01">
                    <h3 class="product_name_wrapper name equal-height_new_products_name">
                      <span>
                        <a href="<%= rootPath + "hotels/show.aspx" %>?id=<%# Eval("ProductMasterId") %>">
                          <%# Eval("ProductName")%>
                        </a>
                      </span>
                    </h3>
                  </div>
                  <div class="row_02">
                    <div class="cl_both block">
                      <div class="product_price_wrapper price ">
                        <b>City:&nbsp;&nbsp;</b>
                        <span class="productSpecialPrice"><%# Eval("City") %></span>
                      </div>
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content2">
                        <img src="<%# Eval("ProductStarsImagePath") %>" alt="" />
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
      <div id="box_toogle_pos_1" class="tabdiv">
        <div class="ui-widget infoBoxContainer additional_box">
          <div class="infoBoxContents">
            <div class="content ">
              <ul class="best_sellers row_products_name_11" id="box_11-0">
                <li class="responsive_block" style="width:258px">
                  <div class="product_block ">
                    <div>
                      <h3 class="product_name_wrapper name equal-height_products_name_11">
                        <span>
                          <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-008-tempus-elementum-magna-p-8?osCsid=qKSS-ugxZQ37A3jke2owD0">
                            Product #008 tempus elementum magna
                          </a>
                        </span>
                      </h3>
                      <div class="row_00">
                        <div class="product_pic_wrapper" style="width:103px;">
                          <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-008-tempus-elementum-magna-p-8?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-008_1.jpg" alt="Product #008 tempus elementum magna" title="Product #008 tempus elementum magna" width="103" height="103" style="width:103px;height:103px;"/>
                          </a>
                          <div class="sale_percent ">
                            <strong>-94%</strong>
                          </div>
                        </div>
                      </div>
                      <div class="row_01">
                        <div class="product_price_wrapper price ">
                          <b>Price:&nbsp;&nbsp;</b>
                          <del>$&nbsp;35.99</del>
                          <span class="productSpecialPrice">
                            $&nbsp;2.00
                          </span>
                        </div>
                        <div class="product_button_wrapper">
                          <strong class="button_content button_content1">
                            <strong class="button bg_button">
                              <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=8&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=8?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                <span class="ui-button-text">Details</span>
                              </a>
                            </strong>
                          </strong>
                        </div>
                      </div>
                      <div class="row_02">
                        <div class="product_desc_wrapper desc">
                          Suspendisse bibendum consequat elit, non convallis mauris ornare et. Vestibulum mollis ante libero. Donec...
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="prods_vseparator">
                  <div>
                    <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
                  </div>
                </li>
                <li class="responsive_block" style="width:258px">
                  <div class="product_block ">
                    <div>
                      <h3 class="product_name_wrapper name equal-height_products_name_11">
                        <span>
                          <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-009-p-9?osCsid=qKSS-ugxZQ37A3jke2owD0">
                            Product #009
                          </a>
                        </span>
                      </h3>
                      <div class="row_00">
                        <div class="product_pic_wrapper" style="width:103px;">
                          <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-009-p-9?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-009_1.jpg" alt="Product #009" title="Product #009" width="103" height="103" style="width:103px;height:103px;"/>
                          </a>
                        </div>
                      </div>
                      <div class="row_01">
                        <div class="product_price_wrapper price extra">
                          <b>
                            Price:&nbsp;&nbsp;
                          </b>
                          <span class="productSpecialPrice">
                            $&nbsp;29.99
                          </span>
                        </div>
                        <div class="product_button_wrapper">
                          <strong class="button_content button_content1">
                            <strong class="button bg_button">
                              <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=9&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=9?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                <span class="ui-button-text">Details</span>
                              </a>
                            </strong>
                          </strong>
                        </div>
                      </div>
                      <div class="row_02">
                        <div class="product_desc_wrapper desc">
                          Ut tellus elit, ultricies at porttitor non, vulputate at dolor. Vivamus vehicula libero et sem varius dap...
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="prods_vseparator">
                  <div>
                    <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
                  </div>
                </li>
                <li class="responsive_block" style="width:258px">
                  <div class="product_block ">
                    <div>
                      <div class="featured_label ">
                        <strong></strong>
                      </div>
                      <h3 class="product_name_wrapper name equal-height_products_name_11">
                        <span>
                          <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0">
                            Product #010
                          </a>
                        </span>
                      </h3>
                      <div class="row_00">
                        <div class="product_pic_wrapper" style="width:103px;">
                          <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-010_1.jpg" alt="Product #010" title="Product #010" width="103" height="103" style="width:103px;height:103px;"/>
                          </a>
                        </div>
                      </div>
                      <div class="row_01">
                        <div class="product_price_wrapper price ">
                          <b>Price:&nbsp;&nbsp;</b>
                          <span class="productSpecialPrice">
                            $&nbsp;29.99
                          </span>
                        </div>
                        <div class="product_button_wrapper">
                          <strong class="button_content button_content1">
                            <strong class="button bg_button">
                              <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=10&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=10?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                <span class="ui-button-text">Details</span>
                              </a>
                            </strong>
                          </strong>
                        </div>
                      </div>
                      <div class="row_02">
                        <div class="product_desc_wrapper desc">
                          In hac habitasse platea dictumst. Pellentesque ornare, justo non dignissim auctor, arcu nunc congue lorem...
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="prods_vseparator">
                  <div>
                    <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
                  </div>
                </li>
                <li class="responsive_block" style="width:258px">
                  <div class="product_block ">
                    <div>
                      <div class="featured_label ">
                        <strong></strong>
                      </div>
                      <h3 class="product_name_wrapper name equal-height_products_name_11">
                        <span>
                          <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0">
                            Product #012 convallis magna a diam egestas vitae
                          </a>
                        </span>
                      </h3>
                      <div class="row_00">
                        <div class="product_pic_wrapper" style="width:103px;">
                          <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-012_1.jpg" alt="Product #012 convallis magna a diam egestas vitae" title="Product #012 convallis magna a diam egestas vitae" width="103" height="103" style="width:103px;height:103px;"/>
                          </a>
                          <div class="sale_percent ">
                            <strong>-94%</strong>
                          </div>
                        </div>
                      </div>
                      <div class="row_01">
                        <div class="product_price_wrapper price ">
                          <b>Price:&nbsp;&nbsp;</b>
                          <del>$&nbsp;49.99</del>
                          <span class="productSpecialPrice">
                            $&nbsp;2.99
                          </span>
                        </div>
                        <div class="product_button_wrapper">
                          <strong class="button_content button_content1">
                            <strong class="button bg_button">
                              <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=12&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=12?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                <span class="ui-button-text">Details</span>
                              </a>
                            </strong>
                          </strong>
                        </div>
                      </div>
                      <div class="row_02">
                        <div class="product_desc_wrapper desc">
                          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices convallis sodales. Curabitur aliq...
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            <strong class="button_content button_content3">
              <strong class="button bg_button">
                <a href="http://www.responsive-shop.com/osc/tstore/3/topsellers_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
                  <span class="ui-button-text">
                    See all Popular
                  </span>
                </a>
              </strong>
            </strong>
          </div>
        </div>
      </div>
    <div id="box_toogle_pos_2" class="tabdiv">
      <div class="ui-widget infoBoxContainer additional_box">
        <div class="infoBoxContents">
          <div class="content ">
            <ul class="specials row_products_name_12" id="box_12-0">
              <li class="responsive_block" style="width:258px">
                <div class="product_block ">
                  <div>
                    <h3 class="product_name_wrapper name equal-height_products_name_12">
                      <span>
                        <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-003-p-3?osCsid=qKSS-ugxZQ37A3jke2owD0">
                          Product #003
                        </a>
                      </span>
                    </h3>
                    <div class="row_00">
                      <div class="product_pic_wrapper" style="width:103px;">
                        <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-003-p-3?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-003_1.jpg" alt="Product #003" title="Product #003" width="103" height="103" style="width:103px;height:103px;"/>
                        </a>
                      <div class="sale_percent ">
                        <strong>-20%</strong>
                      </div>
                    </div>
                  </div>
                  <div class="row_01">
                    <div class="product_price_wrapper price ">
                      <b>Price:&nbsp;&nbsp;</b>
                      <del>$&nbsp;49.99</del>
                      <span class="productSpecialPrice">
                        $&nbsp;39.99
                      </span>
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content1">
                        <strong class="button bg_button">
                          <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=3&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=3?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
                            <span class="ui-button-text">Details</span>
                          </a>
                        </strong>
                      </strong>
                    </div>
                  </div>
                  <div class="row_02">
                    <div class="product_desc_wrapper desc">
                      Ut tellus elit, ultricies at porttitor non, vulputate at dolor. Vivamus vehicula libero et sem variu...
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li class="prods_vseparator">
              <div>
                <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
              </div>
            </li>
            <li class="responsive_block" style="width:258px">
              <div class="product_block ">
                <div>
                  <h3 class="product_name_wrapper name equal-height_products_name_12">
                    <span>
                      <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-005-p-5?osCsid=qKSS-ugxZQ37A3jke2owD0">
                        Product #005
                      </a>
                    </span>
                  </h3>
                  <div class="row_00">
                    <div class="product_pic_wrapper" style="width:103px;">
                      <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-005-p-5?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-005_1.jpg" alt="Product #005" title="Product #005" width="103" height="103" style="width:103px;height:103px;"/>
                      </a>
                      <div class="sale_percent ">
                        <strong>-17%</strong>
                      </div>
                    </div>
                  </div>
                  <div class="row_01">
                    <div class="product_price_wrapper price extra">
                      <b>Price:&nbsp;&nbsp;</b>
                      <del>$&nbsp;35.99</del>
                      <span class="productSpecialPrice">
                        $&nbsp;30.00
                      </span>
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content1">
                        <strong class="button bg_button">
                          <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=5&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=5?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
                            <span class="ui-button-text">Details</span>
                          </a>
                        </strong>
                      </strong>
                    </div>
                  </div>
                  <div class="row_02">
                    <div class="product_desc_wrapper desc">
                      Aliquam ut justo ipsum. Integer euismod tempor odio ut fermentum. Fusce arcu sem, ultrices id ullamc...
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li class="prods_vseparator">
              <div>
                <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
              </div>
            </li>
            <li class="responsive_block" style="width:258px">
              <div class="product_block ">
                <div>
                  <h3 class="product_name_wrapper name equal-height_products_name_12">
                    <span>
                      <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-006-p-6?osCsid=qKSS-ugxZQ37A3jke2owD0">
                        Product #006
                      </a>
                    </span>
                  </h3>
                  <div class="row_00">
                    <div class="product_pic_wrapper" style="width:103px;">
                      <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-006-p-6?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-006_1.jpg" alt="Product #006" title="Product #006" width="103" height="103" style="width:103px;height:103px;"/>
                      </a>
                    <div class="sale_percent ">
                      <strong>-88%</strong>
                    </div>
                  </div>
                </div>
                <div class="row_01">
                  <div class="product_price_wrapper price extra">
                    <b>Price:&nbsp;&nbsp;</b>
                    <del>$&nbsp;39.99</del>
                    <span class="productSpecialPrice">
                      $&nbsp;4.99
                    </span>
                  </div>
                  <div class="product_button_wrapper">
                    <strong class="button_content button_content1">
                      <strong class="button bg_button">
                        <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=6&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=6?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
                          <span class="ui-button-text">Details</span>
                        </a>
                      </strong>
                    </strong>
                  </div>
                </div>
                <div class="row_02">
                  <div class="product_desc_wrapper desc">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices convallis sodales. Curabitur...
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li class="prods_vseparator">
            <div>
              <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
            </div>
          </li>
          <li class="responsive_block" style="width:258px">
            <div class="product_block ">
              <div>
                <div class="featured_label ">
                  <strong></strong>
                </div>
                <h3 class="product_name_wrapper name equal-height_products_name_12">
                  <span>
                    <a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                      Product #001
                    </a>
                  </span>
                </h3>
                <div class="row_00">
                  <div class="product_pic_wrapper" style="width:103px;">
                    <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/>
                    </a>
                    <div class="sale_percent ">
                      <strong>-90%</strong>
                    </div>
                  </div>
                </div>
                <div class="row_01">
                  <div class="product_price_wrapper price extra">
                    <b>Price:&nbsp;&nbsp;</b>
                    <del>$&nbsp;299.99</del>
                    <span class="productSpecialPrice">
                      $&nbsp;29.19
                    </span>
                  </div>
                  <div class="product_button_wrapper">
                    <strong class="button_content button_content1">
                      <strong class="button bg_button">
                        <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=1&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=1?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
                          <span class="ui-button-text">Details</span>
                        </a>
                      </strong>
                    </strong>
                  </div>
                </div>
                <div class="row_02">
                  <div class="product_desc_wrapper desc">
                    Integer bibendum placerat orci et interdum. Aliquam viverra egestas risus ut gravida. Proin et aucto...
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <strong class="button_content button_content3">
        <strong class="button bg_button">
          <a href="http://www.responsive-shop.com/osc/tstore/3/specials.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
            <span class="ui-button-text">See all Specials</span>
          </a>
        </strong>
      </strong>
    </div>
  </div>
</div>
<div id="box_toogle_pos_3" class="tabdiv">
  <div class="ui-widget infoBoxContainer additional_box">
    <div class="infoBoxContents">
      <div class="content "><ul class="best_sellers row_products_name_13" id="box_13-0">
        <li class="responsive_block" style="width:354px">
          <div class="product_block ">
            <div>
              <div class="featured_label ">
                <strong></strong>
              </div>
              <h3 class="product_name_wrapper name equal-height_products_name_13">
                <span>
                  <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                    Product #001
                  </a>
                </span>
              </h3>
              <div class="row_00">
                <div class="product_pic_wrapper" style="width:103px;">
                  <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="/rtbtc/images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/>
                  </a>
                <div class="sale_percent ">
                  <strong>-90%</strong>
                </div>
              </div>
            </div>
            <div class="product_desc_wrapper desc">
              <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                English Reviews Nullam male suada suscipit velit faucibus pulvinar. Vivamus a tortor in leo luctus hendrerit ut in risu
              </a>
              ...
            </div>
            <div class="stars">
              <img src="/rtbtc/images/template/icons/stars_3.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/>
            </div>
          </div>
        </div>
      </li>
      <li class="prods_vseparator">
        <div>
          <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
        </div>
      </li>
      <li class="responsive_block" style="width:354px">
        <div class="product_block ">
          <div>
            <div class="featured_label ">
              <strong></strong>
            </div>
            <h3 class="product_name_wrapper name equal-height_products_name_13">
              <span>
                <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                  Product #001
                </a>
              </span>
            </h3>
            <div class="row_00">
              <div class="product_pic_wrapper" style="width:103px;">
                <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;">
                  <img src="/rtbtc/images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/>
                </a>
              <div class="sale_percent ">
                <strong>-90%</strong>
              </div>
            </div>
          </div>
          <div class="product_desc_wrapper desc">
            <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
              English Reviews Integer adipiscing arcu a nisl imperdiet vulputate. In magna justo, suscipit non rhoncus sit amet, laor
            </a>
            ...
          </div>
          <div class="stars">
            <img src="/rtbtc/images/template/icons/stars_5.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/>
          </div>
        </div>
      </div>
    </li>
    <li class="prods_vseparator">
      <div>
        <img src="/rtbtc/images/template/spacer.gif" alt="" width="1" height="1"/>
      </div>
      <li class="responsive_block" style="width:354px">
        <div class="product_block ">
          <div>
            <div class="featured_label ">
              <strong></strong>
            </div>
            <h3 class="product_name_wrapper name equal-height_products_name_13">
              <span>
                <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                  Product #001
                </a>
              </span>
            </h3>
            <div class="row_00">
              <div class="product_pic_wrapper" style="width:103px;">
                <a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;">
                  <img src="/rtbtc/images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/>
                </a>
                <div class="sale_percent ">
                  <strong>-90%</strong>
                </div>
              </div>
            </div>
            <div class="product_desc_wrapper desc">
              <a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">English Reviews Maecenas nibh magna, viverra et posuere id, pharetra vel augue. Donec sed diam dolor, et varius ante. P
              </a>
              ...
            </div>
            <div class="stars">
              <img src="/rtbtc/images/template/icons/stars_1.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <strong class="button_content button_content3">
    <strong class="button bg_button">
      <a href="http://www.responsive-shop.com/osc/tstore/3/reviews.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button">
        <span class="ui-button-text">See all Reviews</span>
      </a>
    </strong>
  </strong>
</div>
</div>
</div>
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
</asp:Content>
