<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
  <legend>Register</legend>
  <p>
    <label>First Name</label>
    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ControlToValidate="txtFirstName" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Middle Name</label>
    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
  </p>
  <p>
    <label>Last Name</label>
    <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Email</label>
    <asp:TextBox ID="txtEmail" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
                    ControlToValidate="txtEmail" SetFocusOnError="True">Please enter valid email !</asp:RegularExpressionValidator>
  </p>
  <p>
    <label>Password</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                    ControlToValidate="txtPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                    ForeColor="#FF3300" ValidationExpression=".{6}.*" 
                    ControlToValidate="txtPassword" SetFocusOnError="True">*</asp:RegularExpressionValidator>
  </p>
  <p>
    <label>Confirm Password</label>
    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                    ControlToValidate="txtConfirmPassword" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvConfirmPassword" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                    ForeColor="#FF3300" SetFocusOnError="True">*</asp:CompareValidator>
    </p>
     <p>
    <label>Mobile</label>
    <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" 
                    ControlToValidate="txtMobile" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Telephone</label>
    <asp:TextBox ID="txtTelephone" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTelephone" runat="server" 
                    ControlToValidate="txtTelephone" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>City</label>
    <asp:TextBox ID="txtCity" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    ControlToValidate="txtCity" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Address 1</label>
    <asp:TextBox ID="txtAddress1" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvtxtAddress1" runat="server" 
                    ControlToValidate="txtAddress1" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Address 2</label>
    <asp:TextBox ID="txtAddress2" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
  </p>
    <p></p>
    <p>
      <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Register"  CssClass="btn btn-save btn-primary"/>
      &nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                    onclick="btnCancel_Click" Text="Cancel"  CssClass="btn"/>
    </p>
  </fieldset>
</asp:Content>

