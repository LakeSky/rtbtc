<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="show.aspx.cs" Inherits="Hotels_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../Styles/slider_default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../Styles/slider.css" type="text/css" media="screen" />
    <style type="text/css">
        .ui-dialog
        {
            background-color: #FFF;
        }
    </style>
    <script type="text/javascript" src="../Scripts/slider.js"></script>
    <script type="text/javascript">
        window.cancellation_policy_url = '<%=ResolveUrl("~/ApplicationWebService.asmx/CancellationPolicies") %>';
        $(function () {
            $('#slider').nivoSlider({
                controlNav: false,
                effect: 'fold'
            });

            $("ul#stringball").stringball({
                camd: 900,
                radi: 0,
                speed: 15
            });
        });
    </script>
    <script type="text/javascript" src="../Scripts/cancellation_policy.js"></script>
    <script type="text/javascript">
        function initialize() {
            var myLatlng = new google.maps.LatLng(parseFloat("<%= latitude %>"), parseFloat("<%= longitude %>"));
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
            script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAg01VbP_azqa_x2pEJYcPu83WfaCoo9sI&sensor=false&callback=initialize";
            document.body.appendChild(script);
        }

        window.onload = loadScript;
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <progresstemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
                right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/ajax-loader.gif"
                    AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed;
                    top: 45%; left: 50%;" />
            </div>
        </progresstemplate>
    </asp:UpdateProgress>
    <asp:HiddenField ID="hdnFldLatitude" runat="server" />
    <asp:HiddenField ID="hdnFldLongitude" runat="server" />
    <asp:HiddenField ID="hdnFldAddress" runat="server" />
    <asp:HiddenField ID="hdnFldHotelName" runat="server" />
    <asp:HiddenField ID="hdnFldCityName" runat="server" />
    <asp:HiddenField ID="hdnFldCountryName" runat="server" />
    <asp:HiddenField ID="hdnFldStarsImagePath" runat="server" />
    <asp:HiddenField ID="hdnFldRequestFrom" runat="server" />
    <asp:HiddenField ID="hdnFldTotalRoomsBook" runat="server" />
    <div class="row row_4 container_24">
        <section id="bodyContent" class="col grid_6">
      <div class="ui-widget infoBoxContainer box_list" style="min-height:580px;"> 
        <div class="ui-widget-header infoBoxHeading">
          Current Search
        </div>
        <div class="infoBoxContents">
            <div id="fromSearchDiv" runat="server">
                <ul>
                    <li>
                        <div class="inner">
                            City:&nbsp;
                            <asp:Label ID="lblSHCity" runat="server"></asp:Label>
                        </div>
                    </li>
                    <li>
                        <div class="inner">
                            Date:&nbsp;
                            <asp:Label ID="lblSHDate" runat="server"></asp:Label>
                            (
                            <asp:Label ID="lblSHNights" runat="server"></asp:Label>
                            )
                        </div>
                    </li>
                    <li>
                        <div class="inner">
                            Guest:&nbsp;
                            <asp:Label ID="lblSHGuest" runat="server"></asp:Label>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="fromBasketDiv" runat="server">
                <ul>
                    <li>
                        <div class="inner">
                            Stay:&nbsp;
                            <asp:Label ID="lblBHDStay" runat="server"></asp:Label>
                        </div>
                    </li>
                    <li>
                        <div class="inner">
                            Room:&nbsp;
                            <asp:Label ID="lblBHDRoom" runat="server"></asp:Label>
                        </div>
                    </li>
                    <li>
                        <div class="inner">
                            Guest:&nbsp;
                            <asp:Label ID="lblBHDGuest" runat="server"></asp:Label>
                        </div>
                    </li>
                    <li>
                        <div class="inner">
                            Total Price &nbsp;
                            <asp:Label ID="lblBHDtotalPrice" runat="server"></asp:Label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
      </div>
    </section>
        <aside id="columnRight" class="col grid_18">
      <div class="info">
        <asp:Repeater ID="rptrProductImages" runat="server">
            <HeaderTemplate>
                <div id="slider" style="width:200px;height:200px;float:left;">
            </HeaderTemplate>
            <ItemTemplate>
                    <img alt="" src='<%# Eval("ImageAddress") %>'  style="width:200px;height:200px;"/>
                </ItemTemplate>
                <FooterTemplate>
                </div>
                </FooterTemplate>
            </asp:Repeater>
        
        
        <div id="gmap" style="width:620px;height:200px;float:right">
        </div>
        <div class="clear"></div>
        <hr />
        <div class="margin10"></div>
        <h3 style="margin-bottom:15px;">
          <asp:Label ID="lblHotelName" runat="server"></asp:Label>
          &nbsp;
          <img id="imgStars" alt="" runat="server" src=""/>
        </h3>
        <p class="small-font">
          <asp:Label ID="lblAddress" runat="server"></asp:Label>
                &#44;&nbsp;
                <asp:Label ID="lblCityName" runat="server"></asp:Label>
                &#44;&nbsp;
                <asp:Label ID="lblCountryName" runat="server"></asp:Label>
                &nbsp;
        </p>
        <div class="box_bottom_content">
          <div class="ui-widget infoBoxContainer" style="width:100%;">
            <div class="ui-widget-header infoBoxHeading">
              Description
            </div>
            <div class="infoBoxContents">
                <asp:Label ID="lblProductShortDescription" runat="server"></asp:Label>
            </div>
          </div>
        </div>
        <div class="box_bottom_content">
          <div class="ui-widget infoBoxContainer">
            <div class="ui-widget-header infoBoxHeading">
              Hotel Amenities
            </div>
            <div class="infoBoxContents">
              
                <asp:Repeater ID="rptrHotelAmenities" runat="server">
                <HeaderTemplate>
                <ul id="stringball" style="visibility: visible;">
                </HeaderTemplate>
                <ItemTemplate>
                    <li><%# Eval("Name") %></li>
                </ItemTemplate>
                <FooterTemplate>
                </ul>
                </FooterTemplate>
                </asp:Repeater>
              
            </div>
          </div>
        </div>
        <div class="box_bottom_content">
          <div class="ui-widget infoBoxContainer" style="width:100%;margin-bottom:23px;">
            <div class="ui-widget-header infoBoxHeading">
              Rooms & Facilities
            </div>
          </div>
        </div>
         <asp:Repeater ID="rptrRoomFacilities" runat="server">
                <HeaderTemplate>
                <table class="table table-bordered">
          <thead>
            <tr>
              <th>Room Type</th>
              <th>Room Detail</th>
              <th>Facilities</th>
            </tr>
          </thead>
          <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("RoomTypeHeaderName")%>
                        </td>
                        <td>
                            <%# Eval("RoomTypeDetailName")%>
                        </td>
                        <td>
                             <asp:Repeater ID="roomFacilites" runat="server" DataSource='<%# Eval("Facilities") %>'>
                                <ItemTemplate>
                                    <%# Eval("Facility.FacilityName")%>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                </tbody>
                </table>
                </FooterTemplate>
                </asp:Repeater>
        <div class="box_bottom_content">
          <div class="ui-widget infoBoxContainer" style="width:100%;margin-bottom:23px;">
            <div class="ui-widget-header infoBoxHeading">
              Rooms Detail Prices
            </div>
          </div>
        </div>
           <asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional">
            <contenttemplate>
        <asp:Repeater ID="rptrRooms" runat="server">
          <HeaderTemplate>
            <table class="table table-bordered">
              <tr>
                <th>Room type</th>
                <th>Room Name</th>
                <th>Price</th>
                <% if (requestFrom == "search")
                   {%>
                  <th></th>
                  <th>Book</th>
                <%} %>
              </tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td><%# Eval("RoomType") %></td>
              <td><%# Eval("RoomName") %></td>
              <td><%# Eval("FormattedPrice") %></td>
              <% if (requestFrom == "search")
                 {%>
                 <td>
                <a href="#" class="btn btn-small btn-warning show_cancellation_policy" 
                title="View Cancellation Policy" data-id="<%# Eval("HotelInfoId")%>"
                data-name="<%# Eval("SupplierName") %>" data-from="<%= fromDate %>"
                data-to="<%= toDate %>">
                  !
                </a>
              </td>
                <td>
                <asp:HiddenField ID="hdnFldHoyelInfoId" runat="server" Value='<%# Eval("HotelInfoId") %>' />
                            <asp:CheckBox ID="ckbBookRoom" runat="server" OnCheckedChanged="ckbBookRoom_CheckedChanged"
                                AutoPostBack="true" />
                                </td>
              <%} %>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
                <tr>
                    <td colspan="3">
                    </td>
                    <% if (requestFrom == "search")
                       {%>
                    <td></td>
                      <td>
                        <asp:Button ID="Button1" runat="server" Text="Book" CssClass="btn btn-success" Enabled="false"
                            OnClick="btnBook_Click" />
                        <td>
                    <%} %>
                    
                </tr>
            </table>
          </FooterTemplate>
        </asp:Repeater>
           </contenttemplate>
        </asp:UpdatePanel>
      </div>
    </aside>
    </div>
    <div id="cancellation_policy_dialog">
        <div class="loading-image">
            <img id="imgAjaxLoader" alt="" runat="server" />
        </div>
        <table class="table custom-hide">
        </table>
    </div>
</asp:Content>
