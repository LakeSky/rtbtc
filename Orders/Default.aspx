<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Orders_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <form method="post" action="<%= aliasUrl %>" id="checkOutForm">
        <input id="PSPID" name="PSPID" type="hidden" value="<%= pspId %>" />
        <input id="ACCEPTURL" name="ACCEPTURL" type="hidden" value="<%= acceptUrl %>" />
        <input id="EXCEPTIONURL" name="EXCEPTIONURL" type="hidden" value="<%= exceptionUrl %>" />
        <input id="ORDERID" name="ORDERID" type="hidden" value="<%= orderId %>" />
        <input id="SHASIGN" name="SHASIGN" type="hidden" value="<%= sha %>" />
        <input id="COM" name="COM" type="hidden" value="<%= orderDes %>" />
        <input id="RTIMEOUT " name="RTIMEOUT" type="hidden" value="<%= reqTimeOut %>" />
        <div class="row row_2 container_24">
            <div class="grid_24">
                <div class="contentContainer page_search">
                    <div class="contentBlock">
                        <div>
                            <h4>
                                Order Check Out &nbsp;&nbsp;&nbsp; Total Price: SR.
                                <%= basketHelper.totalPrice %>
                            </h4>
                        </div>
                        <div class="contentText">
                            <div class="grid_11">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="fieldKey">
                                                <h3>
                                                    Payment Information</h3>
                                            </td>
                                            <td class="fieldValue">
                                                <label>
                                                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <label>
                                                    Credit Card Holder Name</label>
                                            </td>
                                            <td class="fieldValue">
                                                <input id="CN" type="text" name="CN" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <label>
                                                    Credit Card Number</label>
                                            </td>
                                            <td class="fieldValue">
                                                <input id="CARDNO" type="text" name="CARDNO" maxlength="50" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <label>
                                                    CVV</label>
                                            </td>
                                            <td class="fieldValue">
                                                <input id="CVC" type="text" name="CVC" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <label>
                                                    Expiration Month</label>
                                            </td>
                                            <td class="fieldValue">
                                                <select id="ECOM_CARDINFO_EXPDATE_MONTH" name="ECOM_CARDINFO_EXPDATE_MONTH">
                                                    <%foreach (var obj in monthsList)
                                                      { %>
                                                    <option value="<%= obj.Value %>">
                                                        <%= obj.Text %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <label>
                                                    Expiratioin Year</label>
                                            </td>
                                            <td class="fieldValue">
                                                <select id="ECOM_CARDINFO_EXPDATE_YEAR" name="ECOM_CARDINFO_EXPDATE_YEAR">
                                                    <%foreach (var obj in yearList)
                                                      { %>
                                                    <option value="<%= obj.Value %>">
                                                        <%= obj.Text %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fieldKey">
                                                <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" CssClass="btn btn-save btn-primary"
                                                    ClientIDMode="Static" />
                                            </td>
                                            <td class="fieldValue">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
</asp:Content>

