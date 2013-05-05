<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>
<%@ Register src="/rtbtc/MyCaptcha.ascx" tagname="MyCaptcha" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
      .fieldValue input[type="text"] {
        width: 90%;
      }
      .fieldKey table input {
          margin-left: 35px;
      }
      .fieldKey table img {
          margin: 0 0 7px 35px;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row row_2 container_24">
    <div class="grid_12">
      <div class="contentContainer page_search">
        <div class="contentBlock">
          <div>
            <h4>Register</h4>
          </div>
          <div class="contentText">
            <table>
              <tbody>
                <tr>
                  <td class="fieldKey">
                    <label>Title</label>
                  </td>
                  <td class="fieldValue">
                    <asp:DropDownList ID="ddlTitle" runat="server">
                      <asp:ListItem Value="0">Select</asp:ListItem>
                      <asp:ListItem>Mr</asp:ListItem>
                      <asp:ListItem>Mrs</asp:ListItem>
                      <asp:ListItem>Miss</asp:ListItem>
                      <asp:ListItem>Ms</asp:ListItem>
                      <asp:ListItem>Dr</asp:ListItem>
                      <asp:ListItem>Master</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="ddlTitle" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>First Name</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Middle Name</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Last Name</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Email</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
                    ControlToValidate="txtEmail" SetFocusOnError="True">Please enter valid email !</asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Password</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                    ControlToValidate="txtPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                    ForeColor="#FF3300" ValidationExpression=".{6}.*" 
                    ControlToValidate="txtPassword" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Confirm Password</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                    ControlToValidate="txtConfirmPassword" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                   <asp:CompareValidator ID="cvConfirmPassword" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                    ForeColor="#FF3300" SetFocusOnError="True">*</asp:CompareValidator>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="grid_12">
      <div class="contentContainer page_search">
        <div class="contentBlock">
          <div>
            <h4>Address</h4>
          </div>
          <div class="contentText">
            <table>
              <tbody>
                <tr>
                  <td class="fieldKey">
                    <label>Mobile</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Telephone</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtTelephone" runat="server" MaxLength="300"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>City</label>
                  </td>
                  <td class="fieldValue">
                    <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID">
                      <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
                    SelectCommand="SELECT [CityID], [CityName] FROM [CityMaster]">
                    </asp:SqlDataSource>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Address 1</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtAddress1" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td class="fieldKey">
                    <label>Address 2</label>
                  </td>
                  <td class="fieldValue">
                    <asp:TextBox ID="txtAddress2" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                <tr>
                  <td class="fieldKey" colspan="2">
                    <uc1:MyCaptcha ID="MyCaptchaControl" runat="server" />
                  </td>
                  
                </tr>
                  <td class="fieldKey">
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Register"  CssClass="btn btn-save btn-primary"/>
                  </td>
                  <td class="fieldValue">
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                    onclick="btnCancel_Click" Text="Cancel"  CssClass="btn"/>
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

