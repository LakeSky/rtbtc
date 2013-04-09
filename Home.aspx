<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <script type="text/javascript">
      window.city_autocomplete_url = '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>';
      window.room_index = <%= RoomsCount + 1 %>;
  </script>
  <script type="text/javascript" src="/rtbtc/Scripts/hotel_search.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="alert alert-danger" runat="server" id="errorDiv">Email already taken!</div>
<h3>
  Riyadh Travels
</h3>
<div id="hotel-search">
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
    &nbsp;&nbsp;&nbsp;
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
    <asp:Button ID="txtSearch" runat="server" Text="Search" 
          CssClass="btn btn-success" ValidationGroup="search" 
          onclick="txtSearch_Click"/>
  </div>
</div>
<br />
<div id="subscribe-block">
  <div class="div-wrapper">
    <div class="subscribe-content">
      <h5 class="inline">Subscribe</h5>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="subscribe">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
            ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
                    ControlToValidate="txtEmail" SetFocusOnError="True" 
            ValidationGroup="subscribe">Please enter valid email !</asp:RegularExpressionValidator>
        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-primary" 
            onclick="btnSubscribe_Click" ValidationGroup="subscribe" />

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

