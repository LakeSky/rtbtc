<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="checkout.aspx.cs" Inherits="Orders_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .fieldValue textarea
        {
            width: 159px;
        }
        .fieldValue select
        {
            margin-left: 3px;
            width: 167px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <form method="post" action="<%= aliasUrl %>" id="checkOutForm">
    <input id="PSPID" name="PSPID" type="hidden" value="<%= pspId %>" />
    <input id="ACCEPTURL" name="ACCEPTURL" type="hidden" value="<%= acceptUrl %>" />
    <input id="EXCEPTIONURL" name="EXCEPTIONURL" type="hidden" value="<%= exceptionUrl %>" />
    <input id="ORDERID" name="ORDERID" type="hidden" value="<%= orderId %>" />
    <input id="SHASIGN" name="SHASIGN" type="hidden" value="<%= sha %>" />
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
                                               <option value="<%= obj.Value %>"> <%= obj.Text %> </option>
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
                                               <option value="<%= obj.Value %>"> <%= obj.Text %> </option>
                                             <% } %>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="grid_11">
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="fieldKey">
                                            <h3>
                                                Order Information</h3>
                                        </td>
                                        <td class="fieldValue">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                First Name</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                                ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                Middle Name</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                Last Name</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                                ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                Mobile</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                                                ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                Telephone</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtTelephone" runat="server" MaxLength="300"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fieldKey">
                                            <label>
                                                Remarks</label>
                                        </td>
                                        <td class="fieldValue">
                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
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
