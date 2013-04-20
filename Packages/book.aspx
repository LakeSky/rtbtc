<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="Packages_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      .display-price
      {
          text-align: center;
          font-weight: bold;
      }
  </style>
  <script type="text/javascript">
    window.minDate = "<%= minDate %>";
    window.maxDate = "<%= maxDate %>";
  </script>
  <script type="text/javascript" src="/rtbtc/Scripts/package_book.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row-fluid">
    <div class="span9 left">
      <h3 class="custom-h3 blue-font"><%= packageHeader.PacName %></h3>
      <span class="bold-font"> Package Start Date: </span>
      <%= packageHeader.Validfrom.ToString("dd MMM yyyy") %>
      <br />
      <span class="bold-font"> Package End Date: </span>
      <%= packageHeader.Validto.ToString("dd MMM yyyy")%>
    </div>
    <div class="span3 right">
      <div class="display-price">Price Per Person SR. <%= packageHeader.Pacvalue %></div>
      <img src="<%= packageHeader.DisplayImage %>" alt="" style=""/>
    </div>
    <div class="clear"></div>
  </div>
  <hr />
  <div class="margin10"></div>
  <div class="row-fluid">
    <div class="alert alert-error hide custom-message">
      <h4> <span id="message"> </span></h4>
      <div class="clear"></div>        
    </div>
    <div class="span12">
      <h3 class="blue-font custom-h3 left" >Passenger Details</h3>
      <a class="btn btn-success right add-passenger" href="#">Add</a>
      <div class="clear"></div>
      <div class="margin10"></div>
      <table class="table">
        <tr>
          <td><label>From Date</label></td>
          <td>
            <asp:TextBox ID="txtFromDate" runat="server" CssClass="start-date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
          </td>
        </tr>
      </table>
      <table class="table table-bordered">
        <tr>
          <th>Title</th>
          <th>First Name</th>
          <th>Middle Name</th>
          <th>Last Name</th>
          <th></th>
        </tr>  
        <tr>
          <td>
            <select name="passengers[1][title]">
              <option>Mr</option>
              <option>Mrs</option>
              <option>Miss</option>
              <option>Ms</option>
              <option>Dr</option>
              <option>Master</option>
            </select>
          </td>
          <td>
            <input type="text" name="passengers[1][firstname]" class="firstname"/>
          </td>
          <td>
            <input type="text" name="passengers[1][middlename]" class="middlename" />
          </td>
          <td>
            <input type="text" name="passengers[1][lastname]" class="lastname" />
          </td>
          <td></td>
        </tr>
        <tr id="row-to-add">
          <td colspan="5">
            <asp:HiddenField ID="hdnFldPackageId" runat="server"/>
            <input type="hidden" name="passengers_count" value="1" id="passengers_count" />
            <%if (User.Identity.IsAuthenticated)
              { %>
              <asp:CustomValidator ID="CustomValidator" runat="server" ErrorMessage="" ClientValidationFunction = "ValidateForm" Text=""  ForeColor="#FF3300"></asp:CustomValidator>  
              <asp:Button ID="btnAddToBasket" runat="server" Text="Add to basket" CssClass="btn btn-success" ValidationGroup="" OnClick="btnAddToBasket_Click" />
            <%}
              else
              { %>
                <% var path = CurrentUser.GetRootPath("account"); %>
                To Book or add to basket use 
                <a href="<%= path %>/login.aspx?bookingtype=package&bookingid=<%= hdnFldPackageId.Value %>">Existing Account</a>
                |
                <a href="<%= path %>/register.aspx?bookingtype=package&bookingeid=<%= hdnFldPackageId.Value %>">New Account</a>
            <%} %>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <script id='add-remove-passenger-button-template' type='text/html'>
    <input type="button" class="btn btn-danger remove-passenger" value="x" data-id="{{index}}" id="remove_passenger_{{index}}" />
  </script>
  <script id='add-passenger-template' type='text/html'>
    <tr id="passenger_{{index}}">
      <td><select name="passengers[{{index}}][title]"><option>Mr</option><option>Mrs</option><option>Miss</option><option>Ms</option><option>Dr</option><option>Master</option></select></td>
      <td><input type="text" name="passengers[{{index}}][firstname]" class="firstname" /></td>
      <td><input type="text" name="passengers[{{index}}][middlename]" class="middlename" /></td>
      <td><input type="text" name="passengers[{{index}}][lastname]" class="lastname" /></td>
      <td><input type="button" class="btn btn-danger remove-passenger" value="x" data-id="{{index}}" id="remove_passenger_{{index}}" /></td>
    </tr>
  </script>
</asp:Content>

