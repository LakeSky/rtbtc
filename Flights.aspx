<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Flights.aspx.cs" Inherits="Flights" %>

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
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                minDate: minSelectedDate,
                maxDate: maxDate
            });
        }

        $(".start-date").datepicker({
            constrainInput: true,
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            minDate: 1,
            onSelect: function (dateText, inst) {
                var dateArray = dateText.split('/');
                var minSelectedDate = new Date(dateArray[2], parseInt(dateArray[1]) - 1, dateArray[0]);
                $(".end-date").val("");
                updateDatePickerOfToDate(minSelectedDate);
            }
        });

        $(".end-date").datepicker({
            constrainInput: true,
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true
        });

        $(".start-date, .end-date").attr("readonly", true);

        $("#departure, #arrival").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '<%=ResolveUrl("~/ViewHelperWebService.asmx/AmadeusSearch") %>',
                    data: "{ 'q': '" + request.term + "'}",
                    dataType: "json",
                    success: function (data) {
                        var array = [];
                        $.each(data.d, function (i, text) {
                            var obj = {}
                            var textArray = text.split("#");
                            obj['id'] = textArray[1];
                            obj['label'] = textArray[0];
                            obj['name'] = textArray[0];
                            array.push(obj);
                        });
                        response(array);
                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
            },
            select: function (e, ui) {
                var inputId = "#" + $(this).data('id');
                $(inputId).val(ui.item.id);
                console.log($(inputId).val())
            }
        });

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <fieldset>
    <legend>Search Flights</legend>
    <form action="http://staging.amadeusepower.com/artksa/portals/artksa/flightfaresearch.aspx" method="get" >
    <input type="hidden" value="true" name="IsExternalAccess" /> 
    <input   type="hidden"   id="External_FlightFareSearch_From"   name="External_FlightFareSearch_From"/>
    <input type="hidden" value="4tLHLmdkTxRadijjpqQyTCWwpVkz" name="h1h" />
    <input id="External_FlightFareSearch_To" name="External_FlightFareSearch_To" type="hidden" />
    <label class="inline-block marginR10">
      <input type="radio" checked="checked"  name="External_FlightFareSearch_SearchType" value="RoundTrip" class="inline" />
      Round Trip
    </label>
    <label class="inline-block marginR10">
      <input type="radio"  name="External_FlightFareSearch_SearchType" value="OneWay" class="inline" />
      One Way
    </label>
    <label class="inline-block marginR10">
      <input type="radio"  name="External_FlightFareSearch_SearchType" value="radiobutton" class="inline" />
      Advanced Search
    </label>
    <br />
    <table style="width:100%;">
      <tr>
        <td>
          Class of Travel
        </td>
        <td>
          <select  style="width:100px;"  name="External_FlightFareSearch_FlightClass"> 
            <option value="" >Select</option> 
	        <option  value="Y" selected="selected" >Economy</option> 
	        <option  value="C">Business</option> <option value="F">First</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Departure</td>
        <td><input  id="departure"  name="External_FlightFareSearch_DepartureAirport" data-id="External_FlightFareSearch_From" /></td>
      </tr>
      <tr>
        <td>Arrival</td>
        <td><input  id="arrival"  name="External_FlightFareSearch_ArrivalAirport" data-id="External_FlightFareSearch_To" /></td>
      </tr>
      <tr>
        <td>From</td>
        <td>
          <input  class="start-date"  name="External_FlightFareSearch_DepartureDate" />
          <select name="External_FlightFareSearch_DepartureFlexibility"> 
            <option value="">Exact Date</option>
            <option value="2M">-2 Days</option>
            <option value="1M">-1 Day</option>
            <option value="1C">-1/+1 Day</option>
            <option value="1P">+1 Day</option>
            <option value="2P">+2 Days</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>To</td>
        <td>
          <input  class="end-date" name="External_FlightFareSearch_ReturnDate" /> 
          <select name="External_FlightFareSearch_ArrivalFlexibility">
            <option value="">Exact Date</option>
            <option value="2M">-2 Days</option>
            <option value="1M">-1 Day</option>
            <option value="1C">-1/+1 Day</option>
            <option value="1P">+1 Day</option>
            <option value="2P">+2 Days</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Adults</td>
        <td>
          <select name="External_FlightFareSearch_NumberOfAdults">
            <option value="0" >0</option>
            <option value="1" selected ="selected">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Children</td>
        <td>
          <select name="External_FlightFareSearch_NumberOfChilds">
            <option value="0" >0</option>
            <option value="1" selected ="selected">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
         </td>
       </tr>
       <tr>
         <td>Infants</td>
         <td>
           <select name="External_FlightFareSearch_NumberOfInfants">
             <option value="0" >0</option>
             <option value="1" selected ="selected">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
           </select>
         </td>
      </tr>
      <tr>
        <td colspan="2">
          <label>Show only direct flight options <input type="checkbox" name="External_FlightFareSearch_OnlyDirectFlights" value="ON" class="inline" /></label>
        </td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit"  value="SEARCH" class="btn btn-success margin10" onclick="showSplit();" /></td>
      </tr>
    </table>
  </form>
  </fieldset>
</asp:Content>

