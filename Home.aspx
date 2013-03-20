<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h3>
  Riyadh Travels
</h3>
<%= this.Session["x"] %>
</asp:Content>

