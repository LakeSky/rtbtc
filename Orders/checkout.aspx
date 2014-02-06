<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Orders_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <div class="row row_2 container_24">
    <div class="grid_24">
      <div class="contentContainer page_search">
        <div class="contentBlock">
          <div>
            <h4>
              Order Check Out  &nbsp;&nbsp;&nbsp;
              Total Price: SR. <%= basketHelper.totalPrice %>
            </h4>
          </div>
          <div class="contentText">
            <div class="grid_11">
              <asp:UpdatePanel ID="updatePanelCity" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                  <table>
                    <tbody>
                      <tr>
                        <td class="fieldKey">
                        <h3>Payment Information</h3>
                      </td>
                      <td class="fieldValue">
                          <label>
                          <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <td class="fieldKey">
                        <label>Credit Card First Name</label>
                      </td>
                      <td class="fieldValue">
                        <asp:TextBox ID="txtCCFirstName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfcCCFirstName" runat="server" ControlToValidate="txtCCFirstName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                        <label>Credit Card Last Name</label>
                      </td>
                      <td class="fieldValue">
                        <asp:TextBox ID="txtCCLastName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCCLastName" runat="server" ControlToValidate="txtCCLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                         <label>Credit Card Type</label>
                      </td>
                      <td class="fieldValue">
                        <asp:DropDownList ID="ddlCCType" runat="server">
                          <asp:ListItem Value="visa">Visa</asp:ListItem>
                          <asp:ListItem Value="mastercard">Master Card</asp:ListItem>
                          <asp:ListItem Value="discover">Discover</asp:ListItem>
                          <asp:ListItem Value="amex">Amex</asp:ListItem>
                        </asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                         <label>Credit Card Number</label>
                      </td>
                      <td class="fieldValue">
                        <asp:TextBox ID="txtCreditCardNumber" runat="server" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfCreditCardNumber" runat="server" ControlToValidate="txtCreditCardNumber" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revCreditCardNumber" ControlToValidate="txtCreditCardNumber" runat="server"  ForeColor="#FF3300"  ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                        <label>CVV</label>
                      </td>
                      <td class="fieldValue">
                        <asp:TextBox ID="txtCCCVV" runat="server" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCCCVV" runat="server" ControlToValidate="txtCCCVV" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revCCCVV" ControlToValidate="txtCCCVV" runat="server"  ForeColor="#FF3300"  ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                        <label>Expiration Month</label>
                      </td>
                      <td class="fieldValue">
                        <asp:DropDownList ID="ddlCCExpirationMonth" runat="server"></asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                      <td class="fieldKey">
                        <label>Expiratioin Year</label>
                      </td>
                      <td class="fieldValue">
                        <asp:DropDownList ID="ddlCCExpirationYear" runat="server"></asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                     <td class="fieldKey">
                        <label>Billing Address</label>
                      </td>
                       <td class="fieldValue">
                        <asp:TextBox ID="txtBillingAddress" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBillingAddress" runat="server" ControlToValidate="txtBillingAddress" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>        
                    <tr>
                     <td class="fieldKey">
                        <label>Postal Code</label>
                      </td>
                       <td class="fieldValue">
                        <asp:TextBox ID="txtPostalCode" runat="server" MaxLength="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="refPostalCode" runat="server" ControlToValidate="txtPostalCode" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPostalCode" ControlToValidate="txtPostalCode" runat="server"  ForeColor="#FF3300"  ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                      </td>
                    </tr>        
                    <tr>
                      <td class="fieldKey">
                        <label>Billing Country</label>
                      </td>
                      <td class="fieldValue">
                        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="CountryName" 
                        DataValueField="CountryID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
                        SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster] ORDER BY [CountryName]">
                        </asp:SqlDataSource>
                      </td>
                    </tr>
                    <tr>
                      <td class="fieldKey">
                        <label>Billing City</label>
                      </td>
                      <td class="fieldValue">
                        <asp:DropDownList ID="ddlBillingCity" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityName"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
                        SelectCommand="SELECT [CityID], [CityName] FROM [CityMaster] WHERE ([CountryID] = @CountryID) ORDER BY [CityName]">
                        <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCountry" Name="CountryID" 
                          PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </ContentTemplate>
            </asp:UpdatePanel>
          </div>
          <div class="grid_11">
            <table>
                <tbody>
                  <tr>
                    <td class="fieldKey">
                      <h3>Order Information</h3>
                    </td>
                    <td class="fieldValue">
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      <label>First Name</label>
                    </td>
                    <td class="fieldValue">
                      <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
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
                      <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td class="fieldKey">
                      <label>Mobile</label>
                    </td>
                    <td class="fieldValue">
                      <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
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
                      <label>Remarks</label>
                    </td>
                    <td class="fieldValue">
                      <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                  </tr>
                    <tr>
                  <td class="fieldKey">
                    <asp:Button ID="btnConfirmOrder" runat="server" onclick="btnConfirmOrder_Click" Text="Confirm Order"  CssClass="btn btn-save btn-primary"/>
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
</asp:Content>

