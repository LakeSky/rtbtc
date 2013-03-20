<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h3>
  Riyadh Travels
</h3>
<div id="subscribe-block">
  <div class="subscribe-wrapper">
    <div class="subscribe-content">
      <h5 class="inline" class="inline">Subscribe</h5>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" 
            onclick="btnSubscribe_Click" />
    </div>
  </div>
</div>
</asp:Content>

