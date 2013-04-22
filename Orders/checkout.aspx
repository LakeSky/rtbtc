<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Orders_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
  <legend>Check Out</legend>
  <h3 class="blue-font custom-h3">Total Price: SR. <%= basketHelper.totalPrice %></h3>
  <p>
    <label>First Name</label>
    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Middle Name</label>
    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
  </p>
  <p>
    <label>Last Name</label>
    <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Mobile</label>
    <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Telephone</label>
    <asp:TextBox ID="txtTelephone" runat="server" MaxLength="300"></asp:TextBox>
  </p>
  <p>
    <asp:Button ID="btnConfirmOrder" runat="server" onclick="btnConfirmOrder_Click" Text="Confirm Order"  CssClass="btn btn-save btn-primary"/>
  </p>
</fieldset>
</asp:Content>

