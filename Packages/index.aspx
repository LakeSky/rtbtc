<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Packages_index" %>
<%@ Register Src="/rtbtc/Pager.ascx" TagName="Pager" TagPrefix="userControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      .pager
      {
          float:right;
          margin-bottom: 15px;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <div class="row row_4 container_24">
    <section id="bodyContent" class="col grid_24 ">
      <div class="title_wrapper">
        <div class="title_inner">
          <span class="title-icon"></span>
          <h2>All Packages</h2>
        </div>
      </div>
      <div class="tabs ui-tabs ui-widget ui-widget-content ui-corner-all">
        <div class="contentContainer page_new_product">
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom">
            <div class="contentBlock grid_view">
              <div class="content t_view">
                <ul class="row_products_desc row_products_block row_products_name" style="padding-left:0;">
                  <asp:UpdatePanel ID="UpdatePanelStartRatings" runat="server"  UpdateMode="Conditional">
                    <ContentTemplate>
                      <div class="pager">
                        <userControl:Pager ID="Pager" runat="server" Separator=" | " FirstText="First" PreviousText="<" NextText=">" LastText="Last" PageSize="12" NumberOfPages="3" ShowGoTo="True" OnChange="Pager_Changed" />
                      </div>
                      <div class="clear"></div>
                      <asp:Repeater ID="rptrPackages" runat="server">
                        <ItemTemplate>
                          <li class="responsive_block" style="width:162px">
                            <div class="product_block equal-height_products_block" style="min-height: 284px;">
                              <div>
                                <div class="product_pic_wrapper" style="width:122px;height:122px;">
                                  <a class="product_img" href="show.aspx?id=<%# Eval("PacId") %>" style="width:122px;height:122px;">
                                    <img src="<%# Eval("DisplayImage") %>" alt="" width="122" height="122" style="width:122px;height:122px;">
                                  </a>
                                </div>
                                <div class="product_info_wrapper">
                                  <div class="row_01">
                                    <h3 class="name equal-height_products_name first_h3" style="min-height: 38px;">
                                      <div>
                                        <span>
                                          <a href="<%= Route.GetRootPath("packages/show.aspx")%>?id=<%# Eval("PacId") %>">
                                            <%# Eval("PacName")%>
                                          </a>
                                        </span>
                                      </div>
                                    </h3>
                                  </div>
                                  <div class="row_02">
                                    <div class="cl_both block">
                                      <div class="product_price_wrapper price ">
                                        <span class="productSpecialPrice">
                                          <%= ApplicationObject.GetMasterCurrency(masterCurrencyValue) %>
                                          &nbsp;
                                          <%# ApplicationObject.FormattedCurrencyDisplayPrice(Eval("PacValueB2C"), masterCurrencyValue) %>
                                        </span>
                                      </div>
                                    </div>
                                    <div class="product_button_wrapper">
                                      <strong class="button_content button_content1">
                                        <strong class="button bg_button">
                                          <a href="book.aspx?id=<%# Eval("PacId") %>" role="button">
                                            <span class="ui-button-text">
                                              Add&nbsp;to&nbsp;Cart
                                            </span>
                                          </a>
                                        </strong>
                                      </strong>
                                      <strong class="button_content button_content2">
                                        <strong class="button bg_button">
                                          <a href="show.aspx?id=<%# Eval("PacId") %>" role="button">
                                            <span class="ui-button-text">Details</span>
                                          </a>
                                        </strong>
                                      </strong>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </li>
                          <%# Container.ItemIndex != 0 && Container.ItemIndex % 5 == 0 ? "<div class='clear'></div><div class='margin10'></div><div class='margin10'></div>" : ""%>
                        </ItemTemplate>
                        <SeparatorTemplate>
                          <li class="prods_vseparator <%# Container.ItemIndex != 0 && Container.ItemIndex % 5 == 0 ? "custom-hide" : "" %>">
                            <div class="equal-height_products_block" style="min-height: 286px;">
                              <div>
                                <img src="<%= Route.GetRootPath("images/template")%>/spacer.gif" alt="" width="10" height="1">
                              </div>
                            </div>
                          </li>
                        </SeparatorTemplate>
                      </asp:Repeater>
                    </ContentTemplate>
                  </asp:UpdatePanel>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
       
</asp:Content>

