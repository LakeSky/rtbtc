<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Packages_index" %>
<%@ Register Src="/rtbtc/Pager.ascx" TagName="Pager" TagPrefix="userControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      .caption .package-name {
        color: #000;
        font-size : 14px;
        text-decoration: none;
        font-weight: bold;
        text-align: center;
      }
      .row-fluid .span3 a:hover{
        text-decoration: none;
      }
      .caption .package-pirce {
        font-size : 15px;
        text-decoration: none;
        font-weight: bold;
        text-align: center;
      }
      .caption
      {
          text-align: center;
          width: 260px;
      }
      .thumbnails{
        list-style: none;
      }
      .thumbnails li
      {
          width: 200px;
          display: inline-block;
          margin-left: 140px;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <div class="content-1">
    <asp:UpdatePanel ID="UpdatePanelStartRatings" runat="server"  UpdateMode="Conditional">
      <ContentTemplate>
        <userControl:Pager ID="Pager" runat="server" Separator=" | " FirstText="First" PreviousText="<" NextText=">" LastText="Last" PageSize="9" NumberOfPages="3" ShowGoTo="True" OnChange="Pager_Changed" />
        <asp:Repeater ID="rptrPackages" runat="server">
          <HeaderTemplate>
            <ul class="thumbnails">
          </HeaderTemplate>
          <ItemTemplate>
            <%# Container.ItemIndex != 0 && Container.ItemIndex % 3 == 0 ? "<div class='margin10'></div>" : "" %>
            <li class="span3" style="<%# Container.ItemIndex % 3 == 0 ? "margin-left:0;" : "" %>">
              <a class="thumbnail" href="<%= Route.GetRootPath("packages/show.aspx")%>?id=<%# Eval("PacId") %>">
                <img src="<%# Eval("DisplayImage") %>" alt="" style="width:260px;height:180px;" />
                <div class="caption"> 
                  <span class="package-pirce blue-font">Price <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %> <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("PacValueB2C"), masterCurrencyValue) %></span><br />
                  <span class="package-name"><%# PackageHelper.FormattedPackageName(Eval("PacName"), 23)%></span>
                </div>
              </a>
            </li>
          </ItemTemplate>
          <FooterTemplate>
            </ul>
          </FooterTemplate>
        </asp:Repeater>
      </ContentTemplate>
    </asp:UpdatePanel>
  </div>
  <div class="clear"></div>
  <div class='margin10'></div>
</asp:Content>

