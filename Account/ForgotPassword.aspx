<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Account_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset class="login" >
      <legend>Send Password</legend>
      <div>
      <div class="alert alert-danger" runat="server" id="errorDiv">
        <h4>Email Not Found !</h4>
      </div>
      <p>
          <asp:Label ID="lblEmail" runat="server" Text="Email" 
              AssociatedControlID="txtEmail"></asp:Label>
          <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
              ControlToValidate="txtEmail" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
      </p>
      <p>
          <asp:Button ID="btnEmailPassword" runat="server" onclick="btnEmailPassword_Click" 
              Text="Email Password" CssClass="btn btn-primary" />
      </p>
      </div>
    </fieldset>
</asp:Content>

