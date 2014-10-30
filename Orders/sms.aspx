<%@ Page Title="" Language="C#" MasterPageFile="~/Payfort.master" AutoEventWireup="true"
    CodeFile="sms.aspx.cs" Inherits="Orders_sms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .ui-dialog
        {
            background-color: #FFF;
        }
        .no-close .ui-dialog-titlebar-close
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PayfortContentPlaceHolder" runat="Server">
    <div id="sms-authenticate-dialog">
        <div runat="server" id="smsHtml">
        </div>
    </div>
</asp:Content>
