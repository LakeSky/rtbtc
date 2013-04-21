<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Hotels_Index" %>
<%@ Register Src="/rtbtc/Pager.ascx" TagName="Pager" TagPrefix="userControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      #otherCriterias .div-wrapper label {
        display:inline-block;
        margin-left: 5px;
      }
      .no-close .ui-dialog-titlebar-close {display: none}
  </style>
  <script type="text/javascript">
      window.city_autocomplete_url = '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>';
      window.room_index = <%= RoomsCount + 1 %>;
  </script>
  <script type="text/javascript" src="/rtbtc/Scripts/hotel_search.js"></script>
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
<!-- <div id="hotelsListMain"> -->
  <div id="searchCriteria">
    <div id="mainSearch">
      <div class="div-wrapper">
        <h3>Hotel Search</h3>
        <label>Where do you want to go?</label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="txtCity" 
          ValidationGroup="search"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    ControlToValidate="txtCity" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
        <label>When do you want to go?</label>
        <asp:TextBox ID="txtStartDate" runat="server" CssClass="start-date" 
          ValidationGroup="search"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                    ControlToValidate="txtStartDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtEndDate" runat="server" CssClass="end-date" 
          ValidationGroup="search"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" 
                    ControlToValidate="txtEndDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
        <br />
        <span class="difference-nights"></span>
        <br />
        <input type="button" class="btn btn-success right add-room" value="Add Room" />
        <div class="clear"></div>
        <br />
        <table class="table table-bordered rooms-table">
          <tr>
            <th>&nbsp;</th>
            <th>Adults</th>
            <th>Kids(2-12)</th>
            <th>Infants(0-1)</th>
            <th>&nbsp;</th>
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
            <%foreach (var room in ShoppingRoomsList)
              { %>
                <tr id="room_<%= i %>">
                  <td><%= room.RoomName %></td>
                  <td><select name="rooms[<%= i %>][adults]" class="ddl-small old-ddl" data-value="<%= room.Adults %>" ><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select></td>
                  <td><select name="rooms[<%= i %>][kids]" class="ddl-small kids old-ddl" data-id="<%= i %>"  data-value="<%= room.Kids %>"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                  <td><select name="rooms[<%= i %>][infants]" class="ddl-small old-ddl"  data-value="<%= room.Infants %>"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
                  <% if ((i != 1) && (RoomsCount == i))
                    {%>
                      <td><input type="button" class="btn btn-danger remove-room" value="x" data-id="<%= i %>" id="remove_room_<%= i %>" /></td>
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
                           <select name="rooms[<%= i %>][kids][age][<%= x %>]" class="ddl-small old-ddl" data-value="<%= age %>" data-id="<%= i %>"><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option></select> 
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
      <br />
      <input type="hidden" value="<%= RoomsCount %>" id="totalRooms" name="totalRooms" />
      <asp:Button ID="btnSearch" runat="server" Text="Search" 
          CssClass="btn btn-success" ValidationGroup="search" 
          onclick="btnSearch_Click" OnClientClick="ShowDialogBox();"/>
      <div id="hotel-search-dialog">
        <h3 class="blue-font">
          We are now searching hundreds of offers to find you the very best prices. This should only take a few seconds...
        </h3>
        <% var path = CurrentUser.GetRootPath("Images/ajax-loader.gif"); %>
        <div class="loading-image">
          <img alt="" src="<%= path %>" />
        </div>
      </div>
    </div>
  </div>
  <div id="otherCriterias">
    <div class="div-wrapper">
      <asp:UpdatePanel ID="UpdatePanelStartRatings" runat="server"  UpdateMode="Conditional">
         <ContentTemplate>
           <h3>Star Ratings</h3>
           <asp:Repeater ID="rptrStarRatings" runat="server" >
             <ItemTemplate>
               <asp:CheckBox ID="chkBoxStar" runat="server" AutoPostBack="true" Text='<%#Bind("ClsName")%>' OnCheckedChanged="CheckBox_Changed" />
             </ItemTemplate>
             <SeparatorTemplate>
               <br />
             </SeparatorTemplate>
           </asp:Repeater>
         </ContentTemplate>
       </asp:UpdatePanel>
    </div>
  </div>
  </div>
  <div id="hotelsList">
     <asp:UpdatePanel ID="UpdatePanelHotelList" runat="server"  UpdateMode="Conditional">
       <ContentTemplate>
        <div class="left">
          <userControl:Pager ID="Pager" runat="server" Separator=" | " FirstText="First"
            PreviousText="<" NextText=">" LastText="Last" PageSize="2" NumberOfPages="3"
            ShowGoTo="True" OnChange="Pager_Changed" />
        </div>
        <div class="right">
          <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlSort_SelectedIndexChanged">
            <asp:ListItem Value="plf">Price - Lowest First</asp:ListItem>
            <asp:ListItem Value="phf">Price - Highest First</asp:ListItem>
            <asp:ListItem Value="aa">Alphabets - Ascending</asp:ListItem>
            <asp:ListItem Value="ad">Alphabets - Descending</asp:ListItem>
          </asp:DropDownList>
        </div>
        <div class="clear"></div>
        <asp:Repeater ID="rptrHotels" runat="server">
          <HeaderTemplate>
          </HeaderTemplate>
          <ItemTemplate>
            <div class="hotel-div">
              <div class="hotel-content">
                <h3><%# Eval("ProductName")%></h3>
                <div class="left">
                  <img src="<%# Eval("ProductStarsImagePath")%>" />
                  <br />
                  <h4><%# Eval("City") %></h4>
                </div>
                <% var path = CurrentUser.GetRootPath("hotels/show.aspx?from=search"); %>
                <div class="right paddingT10">
                  <a href="<%= path %>&sid=<%# Eval("Id") %>&id=<%# Eval("ProductMasterId")%>" class="btn btn-primary">More Info ></a>
                </div>
                <div class="clear"></div>
                <div class="margin10"></div>
                <%# Eval("ProdcutDescription")%>
              </div>      
              <div class="hotel-image">
                <div class="price">
                  SR. <%# Eval("BasicPrice")%>
                </div>
                <img src="<%# Eval("ProductImagePath")%>" class="media-image" style="width:200px;height:200px;" />
              </div>
              <div class="clear"></div>
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
                    <td>SR. <%# Eval("Price") %></td>
                    <td><a href="#" class="btn btn-small btn-warning" title="View Cancellation Policy">!</a></td>
                    <% var path = CurrentUser.GetRootPath("Hotels/book.aspx"); %>
                    <td><a href="<%= path %>?id=<%# Eval("HotelInfoId")%>" class="btn btn-success">Book</a></td>
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
    </ContentTemplate>
  </asp:UpdatePanel>
  </div>
  <div class="clear"></div>
  <!-- </div> -->
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

