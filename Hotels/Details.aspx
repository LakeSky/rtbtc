<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Hotels_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <h3 style="margin-bottom:15px;"><%= productMaster.ProductName %>
    <%if(!string.IsNullOrEmpty(productMaster.Classification.ImagePath)){%>
      <img src="<%= productMaster.Classification.ImagePath %>"/>
    <%} %>
  </h3>
  <img src="http://totalstay.ivector.co.uk/content/DataObjects/ThirdPartyProperty/Image/ext781/image_780138_v1.jpg" width="950px" height="243px" class="media-image"/>
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

