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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <h3 style="margin-bottom:15px;"><%= productMaster.ProductName %>
    <%if(!string.IsNullOrEmpty(productMaster.Classification.ImagePath)){%>
      <img src="<%= productMaster.Classification.ImagePath %>"/>
    <%} %>
  </h3>
  <div class="slider-wrapper theme-default" style="width:200px">
    <div id="slider" class="nivoSlider" style="width:200px">
      <%foreach (var x in productMaster.ProductImages)
      {%>
        <%if(!string.IsNullOrEmpty(x.ImageAddress)){%>
          <img src="<%= x.ImageAddress %>"/>
        <%}%>
      <%}%>
    </div>          
  </div>
  <p class="small-font">
    <%= productMaster.Address %>,&nbsp;
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
        <tr>
          <td><%= x.RoomTypeHeader.RoomTHName %></td>
          <td><%= x.RoomTypeDetail.RoomTDName  %></td>
          <td>
            <%foreach (var z in x.ProductFacilities){%>
              <%= z.Facility.FacilityName %>
              |
            <%} %>
          </td>
        </tr>
      <%}%>
    </tbody>
  </table>
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

