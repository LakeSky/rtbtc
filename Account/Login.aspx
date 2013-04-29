<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row row_2 container_24">
        <div class="grid_24">
            <div class="contentContainer page_search">
                <div class="contentBlock">
                    <div>
                        <h4>
                            Login
                        </h4>
                    </div>
                    <div class="contentText">
                        <div class="alert alert-danger" runat="server" id="errorDiv">
                            <h4>
                                Invalid login !</h4>
                        </div>
                        <div class="alert alert-danger" runat="server" id="errorDivForInactiveUsers">
                            <h4>
                                Please confirm your account !</h4>
                        </div>
                        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="fieldKey">
                                        <asp:Label ID="lblEmail" runat="server" Text="Login Id" AssociatedControlID="txtEmail"></asp:Label>
                                    </td>
                                    <td class="fieldValue">
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                            ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fieldKey">
                                        <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                                    </td>
                                    <td class="fieldValue">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                            ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fieldKey">
                                    </td>
                                    <td class="fieldValue">
                                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Sign in" CssClass="btn btn-primary" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
