<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        function updateDatePickerOfToDate(minSelectedDate) {
            minSelectedDate.setDate(minSelectedDate.getDate());
            var maxDate = new Date(minSelectedDate);
            maxDate.setDate(maxDate.getDate() + 15);
            $(".end-date").datepicker('destroy');
            $(".end-date").datepicker({
                constrainInput: true,
                dateFormat: "dd-mm-yy",
                changeMonth: true,
                changeYear: true,
                minDate: minSelectedDate,
                maxDate: maxDate
            });
        }

        $(".start-date").datepicker({
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true,
            minDate: 1,
            onSelect: function (dateText, inst) {
                var dateArray = dateText.split('-');
                var minSelectedDate = new Date(dateArray[2], parseInt(dateArray[1]) - 1, dateArray[0]);
                $(".end-date").val("");
                updateDatePickerOfToDate(minSelectedDate);
            }
        });

        $(".end-date").datepicker({
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true
        });

        $(".start-date, .end-date").attr("readonly", true);

        $(".txtCity").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>',
                    data: "{ 'q': '" + request.term + "'}",
                    dataType: "json",
                    success: function (data) {
                        response(data.d);
                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
            }
        });

        window.room_index = 2;

        $('.add-room').click(function (e) {
            e.preventDefault();
            var row = _.template($("#add-room-template").html(), { index: window.room_index });
            $(".rooms-table").append(row);
            window.room_index = window.room_index + 1;
            if (window.room_index != 3) {
                var remove_button_id = "#remove_room_" + (window.room_index - 2);
                $(remove_button_id).remove();
            }
        });

        $("#middle-content").delegate('.remove-room', 'click', function (e) {
            e.preventDefault();
            var roomId = "tr#room_" + $(this).data('id');
            $(roomId).remove();
            window.room_index = window.room_index - 1;
            if (window.room_index != 2) {
                console.log(window.room_index);
                var index = window.room_index - 1;
                var button = _.template($("#add-remove-room-button-template").html(), { index: index });
                roomId = "tr#room_" + index;
                $(roomId + " td:last").html(button);
            }
        });

    });
  </script>
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
      <tr class="1">
        <td>Room 1</td>
        <td><select name="rooms[1][adult]" class="ddl-small"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select> </td>
        <td><select name="rooms[1][kids]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
        <td><select name="rooms[1][infants]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
        <td></td>
      </tr>
    </table>
    <br />
    <asp:Button ID="txtSearch" runat="server" Text="Search" 
          CssClass="btn btn-success" ValidationGroup="search"/>
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
<td><select name="rooms[{{ index }}][adult]" class="ddl-small"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select> </td>
<td><select name="rooms[{{ index }}][kids]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
<td><select name="rooms[{{ index }}][infants]" class="ddl-small"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select> </td>
<td><input type="button" class="btn btn-danger remove-room" value="x" data-id="{{index}}" id="remove_room_{{index}}" /></td>
</tr>
</script>  
</asp:Content>

