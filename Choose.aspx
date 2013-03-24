<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Choose.aspx.cs" Inherits="Choose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <h3>Select Hotels!</h3>
  <table class="table table-bordered">
    <tr>
      <td><span>City: </span></td>
      <td><span>From: </span></td>
      <td><span>To: </span></td>
    </tr>
  </table>
  <h3>Room Details</h3>
  <table class="table table-bordered">
  <tr>
    <th>&nbsp;</th>
    <th>Adults</th>
    <th>Kids</th>
    <th>Infants</th>
  </tr>
  <% foreach (var x in ShoppingHelperList)
     { %>
       <tr>
         <td><%= x.RoomName %></td>
         <td><%= x.Adults %></td>
         <td><%= x.Kids %></td>
         <td><%= x.Infants %></td>
       </tr>
       <% if (x.ChildAge.Count > 0)
          {%>
         <tr>
           <td>Child Age</td>
           <% var count = x.ChildAge.Count; %>
           <% foreach (var y in x.ChildAge)
              {%>
             <td><%= y%></td>
           <%} %>
           <% if ((4 - count) != 0)
              {%>
             <%for (int k = 1; k < (4 - count); k++)
               {%>
               <td>&nbsp;</td>
             <%} %>
           <%} %>
         </tr>
       <%}%>
   <%} %>
  </table>
</asp:Content>

