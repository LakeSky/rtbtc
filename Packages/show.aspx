<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="show.aspx.cs" Inherits="Packages_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../Styles/slider_default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../Styles/slider.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../Scripts/slider.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#slider').nivoSlider({
                controlNav: false,
                effect: 'fold'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row row_2 container_24">
        <div class="grid_24">
            <h3 class="custom-h3 blue-font">
                <asp:Label ID="lblPacName" runat="server" CssClass="left"></asp:Label>
                <asp:Label ID="lblPacPrice" runat="server" CssClass="right"></asp:Label>
                <div class="clear">
                </div>
            </h3>
            <div class="slider-wrapper theme-default" style="height: 200px;">
                <asp:Repeater ID="rptrSlider" runat="server">
                    <HeaderTemplate>
                        <div id="slider" class="nivoSlider" style="height: 200px;">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <img src="<%# Eval("ImageURL") %>" alt="" style="height: 200px;" />
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="clear">
            </div>
            <hr />
            <div class="margin10">
            </div>
            <div id="content-2" class="row-fluid">
                <div id="pacDescription" runat="server">
                </div>
                <div class="margin10">
                </div>
                <div id="fromBasketDiv" runat="server">
                    <strong class="button_content button_content1"><strong class="button bg_button" style="margin-bottom: 9px;">
                        <a id="fromBasketDivAnchor" runat="server"><span class="ui-button-text">Back To Basket</span></a>
                    </strong></strong>
                    <div class="clear">
                    </div>
                </div>
                <div id="fromIndexDiv" runat="server">
                    <strong class="button_content button_content1"><strong class="button bg_button" style="margin-bottom: 9px;">
                        <a id="fromIndexDivAnchor" runat="server"><span class="ui-button-text">Book </span>
                        </a></strong></strong>
                    <div class="clear">
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong class="button_content button_content1">
                        <strong class="button bg_button" style="margin-bottom: 9px;"><a href="index.aspx"><span
                            class="ui-button-text">View More </span></a></strong></strong>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
