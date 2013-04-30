<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="Hotels_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<link rel="stylesheet" href="/rtbtc/Styles/slider_default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/rtbtc/Styles/slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="/rtbtc/Scripts/slider.js"></script>
<script type="text/javascript">
  $(function(){
    $('#slider').nivoSlider({
      controlNav: false,
      effect: 'fold'
    });
  });
</script>
<script type="text/javascript">
    function initialize() {
        var myLatlng = new google.maps.LatLng(parseFloat("<%= latitude %>"),parseFloat("<%= longitude %>"));
        var mapOptions = {
            zoom: 16,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById("gmap"), mapOptions);
        var contentString = '<div id="content"><div id="siteNotice"></div>' + '<h2 id="firstHeading" class="firstHeading"><%= hotelName %>&nbsp;<img src="<%= starsImagePath %>"></h2>' + '<div id="bodyContent">' + '<p><%= address %>, <%= cityName %>, <%= countryName %></p></div></div>';
        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            animation: google.maps.Animation.DROP,
            title: "<%= hotelName %>"
        });
        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
        });
    }

    function loadScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAgRF5oG3fdfkCADHZLPyXMBu3WjUkn8GY&sensor=false&callback=initialize";
        document.body.appendChild(script);
    }

    window.onload = loadScript;
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_6">
      <div class="ui-widget infoBoxContainer box_list" style="min-height:580px;"> 
        <div class="ui-widget-header infoBoxHeading">
          Current Search
        </div>
        <div class="infoBoxContents">
          <ul>
           <% if(requestFrom == "search") {%>
             <li>
               <div class="inner">
                 City: <%= shoppingHotelDetailDynamic.city %>
               </div>
             </li>
             <li>
               <div class="inner">
                 Date: <%= shoppingHotelDetailDynamic.dates %> ( <%= shoppingHotelDetailDynamic.nights %> )
               </div>
             </li>
             <li>
               <div class="inner">
                 Guest: <%= shoppingHotelDetailDynamic.guestDetails %>
               </div>
             </li>
           <%}else{ %>
             <li>
               <div class="inner">
                 Stay: <%= basketHotelDetailsObj.stay %>
               </div>
             </li>
             <li>
               <div class="inner">
                 Room: <%= basketHotelDetailsObj.room%>
               </div>
             </li>
             <li>
               <div class="inner">
                 Guest: <%= basketHotelDetailsObj.guests %>
               </div>
             </li>
             <li>
               <div class="inner">
                  Total Price <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%= ApplicationObject.FormattedCurrencyDisplayPrice(basketHotelDetailsObj.totalPrice, masterCurrencyValue) %>
               </div>
             </li>
            <%} %>
          </ul>
        </div>
      </div>
    </section>
    <aside id="columnRight" class="col grid_18">
      <div class="info">
        <div id="slider" style="width:200px;height:200px;float:left;">
          <%foreach (var x in productMaster.ProductImages) {%>
            <%if(!string.IsNullOrEmpty(x.ImageAddress)){%>
              <img src="<%= x.ImageAddress %>"/>
            <%}%>
          <%}%>
        </div>
        <div id="gmap" style="width:620px;height:200px;float:right">
        </div>
        <div class="clear"></div>
        <hr />
        <div class="margin10"></div>
        <h3 style="margin-bottom:15px;">
          <%= hotelName %>
          &nbsp;
          <img src="<%= starsImagePath %>"/>
        </h3>
        <p class="small-font">
          <%= address %>,&nbsp;
          <%= cityName %>,&nbsp;
          <%= countryName %>
        </p>
        <p>
          <span class="bold-font">Check in Time:</span> <%= productMaster.CheckInTime %>
          &nbsp;|&nbsp;
          <span class="bold-font">Check out Time:</span> <%= productMaster.CheckOutTime %>
        </p>
        <p>
          <span class="bold-font">Telephone:</span> <%= productMaster.Tel %>
          &nbsp;|&nbsp;
          <span class="bold-font">Fax:</span> <%= productMaster.Fax %>
          &nbsp;|&nbsp;
          <span class="bold-font">Website:</span> <%= productMaster.WebSite %>
        </p>
        <h3 class="custom-h3 blue-font">Description</h3>
        <p>
          <%= productMaster.ShortDescription %>
        </p>
        <h3 class="custom-h3 blue-font">Hotel Amenities</h3>
        <%foreach (var x in productMaster.ProductAmenities) {%>
          <%= x.Amenity.AmenitiesName %>
          <br />
        <%} %>
        <h3 class="custom-h3 blue-font">Rooms & Facilities</h3>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Room Type</th>
              <th>Room Detail</th>
              <th>Facilities</th>
            </tr>
          </thead>
          <tbody>
            <%foreach(var x in productMaster.ProductRRCs){%>
              <%if (roomName == "" || roomName == x.RoomTypeHeader.RoomTHName){%>
                <tr>
                  <td><%= x.RoomTypeHeader.RoomTHName%></td>
                  <td><%= x.RoomTypeDetail.RoomTDName%></td>
                  <td>
                    <%foreach (var z in x.ProductFacilities){%>
                      <%= z.Facility.FacilityName%>
                      |
                    <%} %>
                  </td>
                </tr>
              <%} %>
            <%}%>
          </tbody>
        </table>
        <h3 class="custom-h3 blue-font">Rooms Detail Prices</h3>
        <asp:Repeater ID="rptrRooms" runat="server">
          <HeaderTemplate>
            <table class="table table-bordered">
              <tr>
                <th>Room type</th>
                <th>Room Name</th>
                <th>Price</th>
                <th></th>
                <% if(requestFrom == "search") {%>
                  <th></th>
                <%} %>
              </tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td><%# Eval("RoomType") %></td>
              <td><%# Eval("RoomName") %></td>
              <td> <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("Price"), masterCurrencyValue) %></td>
              <td><a href="#" class="btn btn-small btn-warning" title="View Cancellation Policy">!</a></td>
              <% if (requestFrom == "search"){%>
                <% var path = Route.GetRootPath("hotels/book.aspx"); %>
                <td><a href="<%= path %>?id=<%# Eval("HotelInfoId")%>" class="btn btn-success">Book</a></td>
              <%} %>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
            </table>
          </FooterTemplate>
        </asp:Repeater>
      </div>
    </aside>
  </div>
</asp:Content>

