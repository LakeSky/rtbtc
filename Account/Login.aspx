<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset class="login" >
      <legend>Log in</legend>
      <div>
      <div class="alert alert-danger" runat="server" id="errorDiv">
    <h4>Invalid login !</h4>
  </div>
      <p>
          <asp:Label ID="lblErrorMsg" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
      </p>
      <p>
          <asp:Label ID="lblEmail" runat="server" Text="Login Id" 
              AssociatedControlID="txtEmail"></asp:Label>
          <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
              ControlToValidate="txtEmail" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
      </p>
      <p>
          <asp:Label ID="lblPassword" runat="server" Text="Password" 
              AssociatedControlID="txtPassword"></asp:Label>
          <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
              ControlToValidate="txtPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
      </p>
      <p>
          <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" 
              Text="Sign in" CssClass="btn btn-primary" />
      </p>
      </div>
    </fieldset>
</asp:Content>

