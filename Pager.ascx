<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pager.ascx.cs" Inherits="PagerWebControls.Pager" %>
<asp:LinkButton ID="LinkButtonFirst" runat="server" Text="|<" OnClick="LinkButtonFirst_Click" />
&nbsp;<asp:LinkButton ID="LinkButtonPrevious" runat="server" Text="<" OnClick="LinkButtonPrevious_Click" />
&nbsp;<asp:Repeater ID="RepeaterNumbers" runat="server">
    <ItemTemplate>
        <asp:LinkButton ID="LinkButtonNumber" runat="server" Enabled="<%#!IsCurrentPage((int)Container.DataItem) %>" CssClass="<%#CssClass%>" Text="<%#(int)Container.DataItem%>" OnClick="LinkButtonNumber_Click" /></ItemTemplate>
    <SeparatorTemplate>
        <%#Separator%></SeparatorTemplate>
</asp:Repeater>
&nbsp;<asp:LinkButton ID="LinkButtonNext" runat="server" Text=">" OnClick="LinkButtonNext_Click" />
&nbsp;<asp:LinkButton ID="LinkButtonLast" runat="server" Text=">|" OnClick="LinkButtonLast_Click" />