<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MyCaptcha.ascx.cs" Inherits="MyCaptcha"  EnableViewState="true"%>
<style type="text/css">

</style>
<table >
    <tr>
        <td style="text-align: center" >
            <asp:Image ID="ImgCaptcha" runat="server" />
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <asp:Label ID="LblMsg" runat="server" Text="Enter the above code here:"></asp:Label>
            <asp:TextBox ID="TxtCpatcha" runat="server" Text=""></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <asp:LinkButton ID="btnTryNewWords" runat="server" Font-Names="Tahoma" 
                Font-Size="Smaller" onclick="btnTryNewWords_Click">Can&#39;t read? Try different 
            words.</asp:LinkButton>
        </td>
    </tr>
</table>
