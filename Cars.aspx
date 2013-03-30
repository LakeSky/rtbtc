<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        function updateDatePickerOfToDate(minSelectedDate) {
            minSelectedDate.setDate(minSelectedDate.getDate() + 1);
            var maxDate = new Date(minSelectedDate);
            maxDate.setDate(maxDate.getDate() + 15);
            $(".end-date").datepicker('destroy');
            $(".end-date").datepicker({
                constrainInput: true,
                dateFormat: "dd-mm-yy",
                changeMonth: true,
                changeYear: true,
                minDate: minSelectedDate,
                maxDate: maxDate
            });
        }

        $(".start-date").datepicker({
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true,
            minDate: 1,
            onSelect: function (dateText, inst) {
                var dateArray = dateText.split('-');
                var minSelectedDate = new Date(dateArray[2], parseInt(dateArray[1]) - 1, dateArray[0]);
                $(".end-date").val("");
                updateDatePickerOfToDate(minSelectedDate);
            }
        });

        $(".end-date").datepicker({
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true
        });

        $(".start-date, .end-date").attr("readonly", true);

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <fieldset>
    <legend>Cars</legend>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanelCity" runat="server" UpdateMode="Conditional">
      <ContentTemplate>
        <p>
          <label>Pickup Country</label>
          <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CountryName" 
            DataValueField="CountryID">
          <asp:ListItem Value="0">Select</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
            SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster]">
          </asp:SqlDataSource>
          <asp:RequiredFieldValidator ID="rfvCountry" runat="server" 
                    ControlToValidate="ddlCountry" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
        </p>
        <p>
          <label>Pickup Location</label>
          <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" 
            DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityID" 
            EnableViewState="False">
          <asp:ListItem Value="0">Select</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
            SelectCommand="SELECT [CityID], [CityName] FROM [CityMaster] WHERE ([CountryID] = @CountryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCountry" Name="CountryID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>
          <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    ControlToValidate="ddlCity" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
        </p>
      </ContentTemplate>
    </asp:UpdatePanel>
    <p>
      <label>Pickup Date & time</label>
      <asp:TextBox ID="txtPickupDate" runat="server" CssClass="start-date"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvPickupDate" runat="server" 
                    ControlToValidate="txtPickupDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" >*</asp:RequiredFieldValidator>
      <asp:DropDownList ID="ddlPickuptime" runat="server" AppendDataBoundItems="True" CssClass="ddl-small">
          <asp:ListItem>00</asp:ListItem>
          <asp:ListItem>01</asp:ListItem>
          <asp:ListItem>02</asp:ListItem>
          <asp:ListItem>03</asp:ListItem>
          <asp:ListItem>04</asp:ListItem>
          <asp:ListItem>05</asp:ListItem>
          <asp:ListItem>06</asp:ListItem>
          <asp:ListItem>07</asp:ListItem>
          <asp:ListItem>08</asp:ListItem>
          <asp:ListItem>09</asp:ListItem>
          <asp:ListItem>10</asp:ListItem>
          <asp:ListItem>11</asp:ListItem>
          <asp:ListItem>12</asp:ListItem>
          <asp:ListItem>13</asp:ListItem>
          <asp:ListItem>14</asp:ListItem>
          <asp:ListItem>15</asp:ListItem>
          <asp:ListItem>16</asp:ListItem>
          <asp:ListItem>17</asp:ListItem>
          <asp:ListItem>18</asp:ListItem>
          <asp:ListItem>19</asp:ListItem>
          <asp:ListItem>20</asp:ListItem>
          <asp:ListItem>21</asp:ListItem>
          <asp:ListItem>22</asp:ListItem>
          <asp:ListItem>23</asp:ListItem>
      </asp:DropDownList>
    </p>
    <p>
      <label>Drop off Date & time</label>
      <asp:TextBox ID="txtDropoffDate" runat="server" CssClass="end-date"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvDropoffDate" runat="server" 
                    ControlToValidate="txtDropoffDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" >*</asp:RequiredFieldValidator>
      <asp:DropDownList ID="ddlDropoffTime" runat="server" AppendDataBoundItems="True" CssClass="ddl-small">
          <asp:ListItem>00</asp:ListItem>
          <asp:ListItem>01</asp:ListItem>
          <asp:ListItem>02</asp:ListItem>
          <asp:ListItem>03</asp:ListItem>
          <asp:ListItem>04</asp:ListItem>
          <asp:ListItem>05</asp:ListItem>
          <asp:ListItem>06</asp:ListItem>
          <asp:ListItem>07</asp:ListItem>
          <asp:ListItem>08</asp:ListItem>
          <asp:ListItem>09</asp:ListItem>
          <asp:ListItem>10</asp:ListItem>
          <asp:ListItem>11</asp:ListItem>
          <asp:ListItem>12</asp:ListItem>
          <asp:ListItem>13</asp:ListItem>
          <asp:ListItem>14</asp:ListItem>
          <asp:ListItem>15</asp:ListItem>
          <asp:ListItem>16</asp:ListItem>
          <asp:ListItem>17</asp:ListItem>
          <asp:ListItem>18</asp:ListItem>
          <asp:ListItem>19</asp:ListItem>
          <asp:ListItem>20</asp:ListItem>
          <asp:ListItem>21</asp:ListItem>
          <asp:ListItem>22</asp:ListItem>
          <asp:ListItem>23</asp:ListItem>
      </asp:DropDownList>
    </p>
    <p>
      <label>Car Type</label>
      <asp:DropDownList ID="ddlCarType" runat="server">
          <asp:ListItem Value="0">Select</asp:ListItem>
          <asp:ListItem>Mini</asp:ListItem>
          <asp:ListItem>Economy</asp:ListItem>
          <asp:ListItem>Compact</asp:ListItem>
          <asp:ListItem>Intermediate</asp:ListItem>
          <asp:ListItem>Standard</asp:ListItem>
          <asp:ListItem>Fullsize</asp:ListItem>
          <asp:ListItem>Luxary</asp:ListItem>
          <asp:ListItem>Premium</asp:ListItem>
          <asp:ListItem>Minivan</asp:ListItem>
          <asp:ListItem>12 Passenger Van</asp:ListItem>
          <asp:ListItem>Exotic</asp:ListItem>
        </asp:DropDownList>
      <asp:RequiredFieldValidator ID="rfvCarType" runat="server" 
                    ControlToValidate="ddlCarType" ForeColor="#FF3300" 
                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
    </p>
    <p>
      <asp:Button ID="btnSearch" runat="server" Text="Search"  
            CssClass="btn btn-success margion10" onclick="btnSearch_Click"/>
    </p>
 </fieldset>
</asp:Content>

