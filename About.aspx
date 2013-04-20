<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About Us => <%= Session.SessionID %>
    </h2>
    <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
        <table>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th></th>
          </tr>
      </HeaderTemplate>
    <ItemTemplate>
      <tr>
        <td><%# Eval("CustomerSNo")%></td>
        <td><%# Eval("PaxFirstName")%></td>
        <td>
        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("B2CPaxinfo") %>'>
          <ItemTemplate>
            <%# Eval("PaxFirstName")%>
          </ItemTemplate>
          <SeparatorTemplate>,</SeparatorTemplate>
          </asp:Repeater>
          </td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
  </asp:Repeater>
      <asp:Repeater ID="Repeater3" runat="server">
      <HeaderTemplate>
        <table>
          <tr>
            <th>Id</th>
            <th>Basic Price</th>
            <th></th>
          </tr>
      </HeaderTemplate>
    <ItemTemplate>
      <tr>
      <td>
        <%# Eval("ProductName")%>
        </td>
        <td><%# Eval("BasicPrice")%>
        </td>
        <td>
        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("Rooms") %>'>
          <ItemTemplate>
            <%# Eval("RoomId")%>
          </ItemTemplate>
          <SeparatorTemplate>,</SeparatorTemplate>
          </asp:Repeater>
          </td>
          </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
  </asp:Repeater>
</asp:Content>
