<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="Account_MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h3>My Account</h3>
<table>
  <tr>
    <td>First Name: &nbsp;&nbsp;<%= b2CCustomerinfo.PaxFirstName %> </td>
    <td>Middle Name: &nbsp;&nbsp;<%= b2CCustomerinfo.PaxMiddleName %></td>
    <td>Last Name: &nbsp;&nbsp;<%= b2CCustomerinfo.PaxLastName %></td>
  </tr>
  <tr>
    <td>Email:&nbsp;&nbsp;<%= b2CCustomerinfo.PaxEmail %></td>
    <td>Mobile:&nbsp;&nbsp;<%= b2CCustomerinfo.PaxmobileNo %></td>
    <td>Telephone:&nbsp;&nbsp;<%= b2CCustomerinfo.PaxTelNo %></td>
  </tr>
  <tr>
    <td>City:&nbsp;&nbsp;<%= cityName %></td>
    <td>Address 1:&nbsp;&nbsp;<%= b2CCustomerinfo.PaxAdd1 %></td>
    <td>Address 2:&nbsp;&nbsp;<%= b2CCustomerinfo.PaxAdd2 %></td>
  </tr>
</table>
</asp:Content>

