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
      <div id="hotel-search">
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
                      <strong class="button_text">SHOP NOW!</strong>
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
                      <br /><br /><br />
                      <img src="<%# Eval("ProductStarsImagePath") %>" alt="" />
                    </div>
                    <div class="product_button_wrapper">
                      <strong class="button_content button_content2">
                        <strong class="button bg_button">
                          <a href="<%= rootPath + "hotels/show.aspx" %>?id=<%# Eval("ProductMasterId") %>" role="button">
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
                  <a class="product_img" href="#" style="width:218px;height:218px;">
                    <img src="<%# Eval("ImgPath") %>" alt="<%# Eval("CityName") %>" title="Product #001" width="218" height="218" style="width:218px;height:218px;"/>
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
</asp:Content>
