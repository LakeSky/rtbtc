<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Hotels_Details" %>

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
  <h3 style="margin-bottom:15px;">
    <%= hotelName %>
    &nbsp;
    <img src="<%= starsImagePath %>"/>
  </h3>
  <div class="slider-wrapper theme-default left" style="width:200px">
    <div id="slider" class="nivoSlider" style="width:200px">
      <%foreach (var x in productMaster.ProductImages)
      {%>
        <%if(!string.IsNullOrEmpty(x.ImageAddress)){%>
          <img src="<%= x.ImageAddress %>"/>
        <%}%>
      <%}%>
    </div>          
  </div>
  <div class="right" id="gmap">
  </div>
  <div class="clear"></div>
  <br />
  <p class="small-font">
    <%= address %>,&nbsp;
    <%= cityName %>,&nbsp;
    <%= countryName %>
  </p>
  <br />
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
  <hr class="margin10" />
  <div class="div-bordered">
    <h3 class="custom-h3 blue-font">Current Search</h3>
    <% if(requestFrom == "search") {%>
      <span class="bold-font">City:</span> <%= shoppingHotelDetailDynamic.city %>
      <br />
      <span class="bold-font">Date:</span> <%= shoppingHotelDetailDynamic.dates %> ( <%= shoppingHotelDetailDynamic.nights %> )
      <br />
      <span class="bold-font">Guest:</span> <%= shoppingHotelDetailDynamic.guestDetails %>
    <%}else{ %>
      <span class="bold-font">Stay:</span> <%= basketHotelDetailsObj.stay %>
      <br />
      <span class="bold-font">Room:</span> <%= basketHotelDetailsObj.room%>
      <br />
      <span class="bold-font">Guest:</span> <%= basketHotelDetailsObj.guests %>
      <br />
      <span class="bold-font">Total Price</span> SR.<%= basketHotelDetailsObj.totalPrice %>
    <%} %>
  </div>
  <hr class="margin10" />
  <div class="left" style="width:70%;">
    <h3 class="custom-h3 blue-font">Description</h3>
    <p>
      <%= productMaster.ShortDescription %>
    </p>
    <div class="margin10"></div>
    <h3 class="custom-h3 blue-font">Hotel Amenities</h3>
    <%foreach (var x in productMaster.ProductAmenities)
      {%>
        <%= x.Amenity.AmenitiesName %>
        <br />
    <%} %>
    <div class="margin10"></div>
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
              <%foreach (var z in x.ProductFacilities)
                {%>
                <%= z.Facility.FacilityName%>
                |
              <%} %>
            </td>
          </tr>
        <%} %>
      <%}%>
    </tbody>
  </table>
  <div class="margin10"></div>
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
        <td>SR. <%# Eval("Price") %></td>
        <td><a href="#" class="btn btn-small btn-warning" title="View Cancellation Policy">!</a></td>
        <% if (requestFrom == "search"){%>
          <% var path = CurrentUser.GetRootPath("Hotels/book.aspx"); %>
          <td><a href="<%= path %>?id=<%# Eval("HotelInfoId")%>" class="btn btn-success">Book</a></td>
        <%} %>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
      </table>
    </FooterTemplate>
  </asp:Repeater>
  <div class="margin10"></div>
  </div>
  <div class="right">
    <%foreach (var x in productMaster.ProductImages)
      {%>
        <%if(!string.IsNullOrEmpty(x.ImageAddress)){%>
          <div class="media-image">
            <img src="<%= x.ImageAddress %>" />
          </div>
          <br/>
        <%} %>
    <%} %>
  </div>
  <div class="clear"></div>
</asp:Content>

