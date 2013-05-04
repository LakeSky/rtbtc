<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Hotels_Index" %>
<%@ Register Src="/rtbtc/Pager.ascx" TagName="Pager" TagPrefix="userControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      .infoBoxContents .inner label {
        display:inline-block;
        margin-left: 5px;
      }
      .no-close .ui-dialog-titlebar-close {display: none}
      
  </style>
  <link href="/rtbtc/styles/search_box.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript">
      window.city_autocomplete_url = '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>';
      window.cancellation_policy_url = '<%=ResolveUrl("~/ApplicationWebService.asmx/CancellationPolicies") %>';
      window.room_index = <%= RoomsCount + 1 %>;
  </script>
  <script type="text/javascript" src="/rtbtc/Scripts/hotel_search.js"></script>
  <script type="text/javascript" src="/rtbtc/Scripts/cancellation_policy.js"></script>
  <script type = "text/javascript">
      function ShowDialogBox() {
          setTimeout(function () {
               if (Page_IsValid) {
                   $("#hotel-search-dialog").dialog('open');
               }
           }, 500);
       }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_6">
      <div class="ui-widget infoBoxContainer box_list" style="min-height:620px;"> 
        <div class="ui-widget-header infoBoxHeading">
          Hotels Search
        </div>
        <div id="search-bar" style="float:none;height:auto;width:100%;background-image:none;">
          <div id="div-search" style="margin-left:0;padding-top:0;">
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
            <span class="difference-nights"></span>
            <div id="div-rooms">
              <h4>How many of you?</h4>
              <input type="button" class="btn btn-success right add-room" value="Add Room" />
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
                    <td><select name="rooms[1][adults]" class="ddl-small"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select> </td>
                    <td><select name="rooms[1][kids]" class="ddl-small kids" data-id="1"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                    <td><select name="rooms[1][infants]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                    <td></td>
                  </tr>
                <%}else{%>
                  <% int i = 1; %>
                  <%foreach (var room in ShoppingRoomsList) {%>
                    <tr id="room_<%= i %>">
                      <td><%= room.RoomName %></td>
                      <td><select name="rooms[<%= i %>][adults]" class="ddl-small old-ddl" data-value="<%= room.Adults %>" ><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select></td>
                      <td><select name="rooms[<%= i %>][kids]" class="ddl-small kids old-ddl" data-id="<%= i %>"  data-value="<%= room.Kids %>"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                      <td><select name="rooms[<%= i %>][infants]" class="ddl-small old-ddl"  data-value="<%= room.Infants %>"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                      <% if ((i != 1) && (RoomsCount == i)) {%>
                        <td><input type="button" class="btn btn-danger remove-room" value="x" data-id="<%= i %>" id="remove_room_<%= i %>" /></td>
                      <%} else {%>
                        <td>&nbsp;</td>
                      <%} %>
                    </tr>
                    <% var count = room.ChildAge.Count; %>
                    <% if (count > 0) {%>
                      <tr  id="child_<%= i %>">
                        <td>Child  Ages</td>
                        <% int x = 1; %>
                        <%foreach (var age in room.ChildAge) {%>
                          <td class="td_<%= x %>">
                            <select name="rooms[<%= i %>][kids][age][<%= x %>]" class="ddl-small old-ddl" data-value="<%= age %>" data-id="<%= i %>"><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option></select> 
                          </td>
                          <% x += 1; %>
                        <%} %>
                        <% if ((4 - count) != 0) {%>
                          <%for (int k = 1; k <= (4 - count); k++) {%>
                            <td class="td_<%= 4 + k - count %>">&nbsp;</td>
                          <%} %>
                        <%} %>
                      </tr>
                    <%} %>
                    <% i += 1; %>
                  <%} %>
                <%} %>
              </table>
              <br />
              <input type="hidden" value="<%= RoomsCount %>" id="totalRooms" name="totalRooms" />
              <input type="hidden" value="<%= CityCode %>" id="cityCode" name="cityCode" />
              <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" ValidationGroup="search" 
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
      </div>
      <div class="ui-widget infoBoxContainer box_list">
        <h2 class="ui-widget-header infoBoxHeading">
          Star Ratings
        </h2>      
        <asp:UpdatePanel ID="UpdatePanelStartRatings" runat="server"  UpdateMode="Conditional">
          <ContentTemplate>
            <asp:Repeater ID="rptrStarRatings" runat="server" >
              <HeaderTemplate>
                <div class="infoBoxContents">
                  <ul>
              </HeaderTemplate>
              <ItemTemplate>
                <li>
                  <div class="inner">
                    <asp:CheckBox ID="chkBoxStar" runat="server" AutoPostBack="true" Text='<%#Bind("ClsName")%>' OnCheckedChanged="CheckBox_Changed" />
                  </div>
                 </li>
              </ItemTemplate>
              <FooterTemplate>
                  </ul>
                </div>
             </FooterTemplate>
            </asp:Repeater>
          </ContentTemplate>
         </asp:UpdatePanel>
      </div>
    </section>
    <aside id="columnRight" class="col grid_18">
      <asp:UpdatePanel ID="UpdatePanelHotelList" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>
          <div class="result result1_top">
            <div class="result1_bottom">
              <div class="result_top_padd">
                <div class="result_left">
                  <userControl:Pager ID="Pager" runat="server" Separator=" | " FirstText="First" PreviousText="<" NextText=">"
                  LastText="Last" PageSize="5" NumberOfPages="3" ShowGoTo="True" OnChange="Pager_Changed" />
                </div>
                <div class="result_right">
                  <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" 
                  onselectedindexchanged="ddlSort_SelectedIndexChanged">
                    <asp:ListItem Value="plf">Price - Lowest First</asp:ListItem>
                    <asp:ListItem Value="phf">Price - Highest First</asp:ListItem>
                    <asp:ListItem Value="aa">Alphabets - Ascending</asp:ListItem>
                    <asp:ListItem Value="ad">Alphabets - Descending</asp:ListItem>
                   </asp:DropDownList>
                </div>
              </div>
            </div>
          </div>
         <asp:Repeater ID="rptrHotels" runat="server">
           <HeaderTemplate>
             <div class="contentContainer page_new_product">
               <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="">
                 <div class="contentBlock row_view" style="visibility: visible;">
                     <div class="content t_view">
                       <ul id="view_row-0">
           </HeaderTemplate>
           <ItemTemplate>
             <% var rootPath = Route.GetRootPath(""); %>
             <% var detailsPath = rootPath + "hotels/show.aspx?from=search"; %>
             <li class="responsive_block first" style="width:100%;">
               <div class="product_block equal-height_products_block">
                 <div class="product_pic_wrapper" style="width:195px;height:195px;">
                   <a class="product_img" href="<%= detailsPath %>&sid=<%# Eval("Id") %>&id=<%# Eval("ProductMasterId")%>" style="width:195px;height:195px;">
                     <img src="<%# Eval("ProductImagePath") %>" alt="<%# Eval("ProductName") %>" width="195" height="195" style="width:195px;height:195px;">
                   </a>
                 </div>
                 <div class="product_info_wrapper">
                   <div class="data">
                     <div class="fl_left">
                       <img src="<%#  Eval("ProductStarsImagePath") %>" class="media-image" alt="" />
                     </div>
                     <div class="fl_right">
                     </div>
                   </div>                
                 <div class="row_02">
                   <div class="product_price_wrapper price ">
                     <b>Price:&nbsp;&nbsp;</b>
                     <span class="productSpecialPrice">
                       <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                       &nbsp;
                       <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("BasicPrice"), masterCurrencyValue) %>
                     </span>
                   </div>
                   <strong class="button_content button_content2">
                     <strong class="button bg_button">
                       <a href="<%= detailsPath %>&sid=<%# Eval("Id") %>&id=<%# Eval("ProductMasterId")%>" role="button">
                         <span class="ui-button-text">Details</span>
                       </a>
                     </strong>
                   </strong>
                 </div>
                 <div class="row_01">
                   <h3 class="name equal-height_products_name">
                     <span>
                       <a href="<%= detailsPath %>&sid=<%# Eval("Id") %>&id=<%# Eval("ProductMasterId")%>">
                         <%# Eval("ProductName") %>
                       </a>
                     </span>
                   </h3>
                   <div class="manuf">
                     <span><%# Eval("City") %></span>
                   </div>
                   <div class="desc equal-height_products_desc">
                     <%# Eval("ProdcutDescription") %>
                   </div>
                 </div>                
               <div class="margin10"></div>
               <asp:Repeater ID="rptrRooms" runat="server" DataSource='<%# Eval("Rooms") %>'>
                 <HeaderTemplate>
                   <table class="table table-bordered">
                     <tr>
                       <th>Room type</th>
                       <th>Room Name</th>
                       <th>Price</th>
                       <th></th>
                       <th></th>
                     </tr>
                 </HeaderTemplate>
                 <ItemTemplate>
                   <tr>
                     <td><%# Eval("RoomType") %></td>
                     <td><%# Eval("RoomName") %></td>
                     <td> <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("Price"), masterCurrencyValue) %></td>
                     <td>
                       <a href="#" class="btn btn-small btn-warning show_cancellation_policy" 
                       title="View Cancellation Policy" data-id="<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.Id")%>"
                       data-name="<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.SupplierName")%>" data-from="<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.FromDate")%>"
                       data-to="<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.ToDate")%>">
                         !
                       </a>
                     </td>
                     <% var path = Route.GetRootPath("hotels/book.aspx"); %>
                     <td>
                       <strong class="button_content button_content1">
                         <strong class="button bg_button">
                           <a href="<%= path %>?id=<%# Eval("HotelInfoId")%>" role="button">
                             <span class="ui-button-text">Book</span>
                           </a>
                         </strong>
                       </strong>
                     </td>
                   </tr>
                 </ItemTemplate>
                 <FooterTemplate>
                   </table>
                 </FooterTemplate>
               </asp:Repeater>
                </div>
              </div>
            </li>
          </ItemTemplate>
          <SeparatorTemplate>
            <li class="prods_vseparator">
              <div class="equal-height_products_block">
                <img src="<%= Route.GetRootPath("images/template/spacer.gif") %>" alt="" width="10" height="1">
              </div>
            </li>
          </SeparatorTemplate>
          <FooterTemplate>
          </FooterTemplate>
        </asp:Repeater>
      </ContentTemplate>
    </asp:UpdatePanel>
  </div>
  <div class="clear"></div>
  </aside>
  <div id="cancellation_policy_dialog">
      <div class="loading-image">
        <img alt="" src="<%= Route.GetRootPath("Images/ajax-loader.gif") %>" />
      </div>
      <table class="table custom-hide">
      </table>
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

