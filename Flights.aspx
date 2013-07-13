<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Flights.aspx.cs" Inherits="Flights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
      .fieldValue select {
        width: 82%;
      }
      .auto-style1 {
          width: 156px;
      }
      #Text2 {
          width: 251px;
      }
      #Text1 {
          width: 198px;
      }
      .trip {
          width: 14px;
      }
      .from-flexibilty {
          width: 205px;
      }
      .to-flexibilty {
          width: 260px;
          margin-right: 38px;
      }
      .start-date {
          width: 195px;
      }
      .end-date {
          width: 250px;
          margin-right: 10px;
      }
      .auto-style2 {
          width: 363px;
      }
      .auto-style6 {
          width: 103px;
      }
      .auto-style7 {
          width: 174px;
      }
      .adults {
          width: 56px;
      }
      .children {
          width: 48px;
      }
      .infants {
          width: 44px;
          margin-left: 41px;
      }
      .auto-style8 {
          width: 125px;
      }
      .direct-flight {
          width: 24px;
      }
      #departure {
          width: 195px;
      }
      #arrival {
          width: 248px;
      }
  </style>
  <script type="text/javascript">
    $(function () {

        function updateDatePickerOfToDate(minSelectedDate) {
            minSelectedDate.setDate(minSelectedDate.getDate() + 1);
            var maxDate = new Date(minSelectedDate);
            maxDate.setFullYear(maxDate.getFullYear() + 1);
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

        $("#departure, #arrival").autocomplete({
            change: function (event, ui) {
                if (ui.item == null) {
                    $(this).val('');
                    $(this).focus();
                }
            },
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '<%=ResolveUrl("~/ViewHelperWebService.asmx/AmadeusSearch") %>',
                    data: "{ 'q': '" + request.term + "'}",
                    dataType: "json",
                    success: function (data) {
                        var array = [];
                        $.each(data.d, function (i, x) {
                            var obj = {}
                            obj['id'] = x.Id;
                            obj['label'] = x.Text;
                            obj['name'] = x.Text;
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
            }
        });

        $(".flight-search").click(function (e) {
            e.preventDefault();
            $(".custom-error h3").html("");
            var departure = $("#External_FlightFareSearch_From").val();
            var arrival = $("#External_FlightFareSearch_To").val();
            var from = $(".start-date").val();
            var to = $(".end-date").val();
            var travelType = $(".travel-type").val();
            var trip = "";
            _.each($(".trip"), function (x) {
                if ($(x).is(":checked")) {
                    trip = $(x).val();
                }
            });
            var error = false;
            var message = "";
            if (departure == "") {
                message = "Departure is required!<br/>";
                error = true;
            }
            if (arrival == "") {
                message += "Arival is required!<br/>";
                error = true;
            }
            if (from == "") {
                message += "From date is required!<br/>";
                error = true;
            }
            if (to == "") {
                message += "To date is required!<br/>";
                error = true;
            }
            if (error) {
                $(".custom-error h3").html(message);
                $(".custom-error").removeClass("custom-hide");
                return false;
            }
            $(".custom-error").addClass("custom-hide");
            var trip = $(".trip").val();
            var fromFlexibilty = $(".from-flexibilty").val();
            var toFlexibilty = $(".to-flexibilty").val();
            var adults = $(".adults").val();
            var children = $(".children").val();
            var infants = $(".infants").val();
            var directFlights = $(".direct-flight").is(":checked");
            var amadeusUrl = "http://staging.amadeusepower.com/artksa/portals/artksa/FlightFareSearch.aspx?h1h=4tLHLmdkTxRadijjpqQyTCWwpVkz&IsExternalAccess=true";
            var url = "";
            if (trip == "radiobutton") {
                url = url + "&AdvancedSearch=True";
            } else {
                url = url + "&RoundTrip=" + trip;
            }
            url = url + "&External_FlightFareSearch_FlightClass=" + travelType;
            url = url + "&External_FlightFareSearch_From=" + departure;
            url = url + "&External_FlightFareSearch_To=" + arrival;
            url = url + "&External_FlightFareSearch_DepartureDate=" + from;
            url = url + "&External_FlightFareSearch_ReturnDate=" + to;
            url = url + "&External_FlightFareSearch_DepartureFlexibility=" + fromFlexibilty;
            url = url + "&External_FlightFareSearch_ArrivalFlexibility=" + toFlexibilty;
            url = url + "&External_FlightFareSearch_NumberOfAdults=" + adults;
            url = url + "&External_FlightFareSearch_NumberOfChilds=" + children;
            url = url + "&External_FlightFareSearch_NumberOfInfants=" + infants;
            if (directFlights) {
                url = url + "&External_FlightFareSearch_OnlyDirectFlights=ON";
            }
            url = escape(url);
            url = amadeusUrl + url;
            testwindow = window.open(url, target = "_top", "online", "resizable=1,toolbar=1,status=1,menubar=1,titlebar=1");
        });

    });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row row_2 container_24">
    <div class="grid_24">
      <div class="contentContainer page_search">
        <div class="contentBlock">
          <div>
            <h4>
              Search Flights
            </h4>
          </div>
            <div class="contentText">

                <form action="http://staging.amadeusepower.com/artksa/portals/artksa/flightfaresearch.aspx" method="get" >
              <input type="hidden" value="true" name="IsExternalAccess" /> 
              <input   type="hidden"   id="Hidden1"   name="External_FlightFareSearch_From"/>
              <input type="hidden" value="4tLHLmdkTxRadijjpqQyTCWwpVkz" name="h1h" />
              <input id="Hidden2" name="External_FlightFareSearch_To" type="hidden" />
                    <div class="alert alert-error custom-hide custom-error">
                        <h3></h3>
                    </div>
                    <label class="inline-block marginR10">
                        <input type="radio" checked="checked" name="External_FlightFareSearch_SearchType" value="RoundTrip" class="inline trip" />
                        Round Trip
                    </label>
                    <label class="inline-block marginR10">
                        <input type="radio" name="External_FlightFareSearch_SearchType" value="OneWay" class="inline trip" />
                        One Way
                    </label>
                    <label class="inline-block marginR10">
                        <input type="radio" name="External_FlightFareSearch_SearchType" value="radiobutton" class="inline trip" />
                        Advanced Search
                    </label>
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style6" style="font-weight:bold">From  </td>
                            <td class="auto-style7" style="font-weight:bold">To</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <input id="departure" type="text" name="External_FlightFareSearch_DepartureAirport" data-id="External_FlightFareSearch_From" /></td>
                            <td class="auto-style1" colspan="2">
                                <input id="arrival" type="text" name="External_FlightFareSearch_ArrivalAirport" data-id="External_FlightFareSearch_To" /></td>

                        </tr>
                        <tr>
                            <td class="auto-style6" style="font-weight:bold">Depart</td>
                            <td colspan="2" style="font-weight:bold">Return</td>

                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <input class="start-date" type="text" name="External_FlightFareSearch_DepartureDate" />
                            </td>
                            <td colspan="2">
                                <input class="end-date" type="text" name="External_FlightFareSearch_ReturnDate" />

                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style6">
                                <select name="External_FlightFareSearch_DepartureFlexibility1" class="from-flexibilty">
                                    <option value="">Exact Date</option>
                                    <option value="2M">-2 Days</option>
                                    <option value="1M">-1 Day</option>
                                    <option value="1C">-1/+1 Day</option>
                                    <option value="1P">+1 Day</option>
                                    <option value="2P">+2 Days</option>
                                </select>
                            </td>
                            <td colspan="2">
                                <select name="External_FlightFareSearch_ArrivalFlexibility" class="to-flexibilty">
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
                            <td class="auto-style6" style="font-weight:bold">Adults</td>
                            <td class="auto-style7" style="font-weight:bold">Children</td>
                            <td class="auto-style8" style="font-weight:bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Infants</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <select name="External_FlightFareSearch_NumberOfAdults" class="adults">
                                    <option value="0">0</option>
                                    <option value="1" selected="selected">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                            <td class="auto-style7">
                                <select name="External_FlightFareSearch_NumberOfChilds" class="children">
                                    <option value="0" selected="selected">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select></td>
                            <td class="auto-style8">
                                <select name="External_FlightFareSearch_NumberOfInfants" class="infants">
                                    <option value="0" selected="selected">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="auto-style6" style="font-weight:bold">Class of Travel</td>
                            <td colspan="2">
                                <label style="font-weight:bold">Show only direct flight options
                                    <input type="checkbox" name="External_FlightFareSearch_OnlyDirectFlights" value="ON" class="inline direct-flight" /></label></td>

                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <select style="width: 100px;" name="External_FlightFareSearch_FlightClass" class="travel-type">
                                    <option value="">Select</option>
                                    <option value="Y" selected="selected">Economy</option>
                                    <option value="C">Business</option>
                                    <option value="F">First</option>
                                </select>
                            </td>


                        </tr>
                        <tr>
                           <td>

                           </td>
                        
                            <td  class="fieldValue" style="text-align:right"><input  type="submit"  value="SEARCH" class="btn btn-success margin10 flight-search" /></td>

                        </tr>

                    </table>
            </div>








            <%--<div class="contentText">
            <form action="http://staging.amadeusepower.com/artksa/portals/artksa/flightfaresearch.aspx" method="get" >
              <input type="hidden" value="true" name="IsExternalAccess" /> 
              <input   type="hidden"   id="External_FlightFareSearch_From"   name="External_FlightFareSearch_From"/>
              <input type="hidden" value="4tLHLmdkTxRadijjpqQyTCWwpVkz" name="h1h" />
              <input id="External_FlightFareSearch_To" name="External_FlightFareSearch_To" type="hidden" />
              <div class="alert alert-error custom-hide custom-error">
                <h3></h3>
              </div>
              <label class="inline-block marginR10">
                <input type="radio" checked="checked"  name="External_FlightFareSearch_SearchType" value="RoundTrip" class="inline trip" />
                Round Trip
              </label>
              <label class="inline-block marginR10">
                <input type="radio"  name="External_FlightFareSearch_SearchType" value="OneWay" class="inline trip" />
                One Way
              </label>
              <label class="inline-block marginR10">
                <input type="radio"  name="External_FlightFareSearch_SearchType" value="radiobutton" class="inline trip" />
                Advanced Search
              </label>
              <br />
              <table>
                <tbody>
                  <tr>
                    <td class="fieldKey">
                      Class of Travel
                    </td>
                    <td class="fieldValue">
                      <select  style="width:100px;"  name="External_FlightFareSearch_FlightClass" class="travel-type"> 
                        <option value="" >Select</option> 
	                    <option  value="Y" selected="selected" >Economy</option> 
	                    <option  value="C">Business</option> <option value="F">First</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      Departure
                    </td>
                    <td class="fieldValue">
                      <input id="departure" type="text" name="External_FlightFareSearch_DepartureAirport" data-id="External_FlightFareSearch_From" />
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      Arrival
                    </td>
                    <td class="fieldValue">
                      <input  id="arrival" type="text"  name="External_FlightFareSearch_ArrivalAirport" data-id="External_FlightFareSearch_To" />
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      From
                    </td>
                    <td class="fieldValue">
                      <input  class="start-date" type="text"  name="External_FlightFareSearch_DepartureDate" />
                      <select name="External_FlightFareSearch_DepartureFlexibility" class="from-flexibilty"> 
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
                    <td class="fieldKey">
                      To
                    </td>
                    <td class="fieldValue">
                      <input  class="end-date" type="text" name="External_FlightFareSearch_ReturnDate" /> 
                      <select name="External_FlightFareSearch_ArrivalFlexibility" class="to-flexibilty">
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
                    <td class="fieldKey">
                      Adults
                    </td>
                    <td class="fieldValue">
                      <select name="External_FlightFareSearch_NumberOfAdults" class="adults">
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
                    <td class="fieldKey">
                      Children
                    </td>
                    <td class="fieldValue">
                      <select name="External_FlightFareSearch_NumberOfChilds" class="children">
                        <option value="0" selected ="selected" >0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      Infants
                    </td>
                    <td class="fieldValue">
                      <select name="External_FlightFareSearch_NumberOfInfants" class="infants">
                        <option value="0" selected ="selected" >0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      <label>Show only direct flight options <input type="checkbox" name="External_FlightFareSearch_OnlyDirectFlights" value="ON" class="inline direct-flight" /></label>
                    </td>
                    <td class="fieldValue">
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                    </td>
                    <td class="fieldValue">
                    <input type="submit"  value="SEARCH" class="btn btn-success margin10 flight-search" />
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>--%>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

