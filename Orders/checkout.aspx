<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Orders_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
    .fieldValue textarea
    {
      width: 159px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
            <table>
              <tbody>
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
</asp:Content>

