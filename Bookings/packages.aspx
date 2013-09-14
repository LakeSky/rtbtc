<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="packages.aspx.cs" Inherits="Bookings_packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        $(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);

            function endRequestHandler(sender, args) {
                $(".checkin-date").datepicker({
                    constrainInput: true,
                    dateFormat: "dd-mm-yy",
                    changeMonth: true,
                    changeYear: true
                });

                $(".checkin-date").attr("readonly", true);
            }

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row row_2 container_24">
        <div class="grid_24">
            <strong class="button_content button_content1 right"><strong class="button bg_button"
                style="margin-bottom: 9px;"><a href="index.aspx"><span class="ui-button-text">Show Hotel
                    Bookings </span></a></strong></strong>
            <div class="clear">
            </div>
            <asp:UpdatePanel ID="updatePanelCity" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th>
                                    Status
                                </th>
                                <th>
                                    Search Field
                                </th>
                                <th>
                                    Search Value
                                </th>
                                <th>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlSearchFields" runat="server" CssClass="search-fields" OnSelectedIndexChanged="ddlSearchFields_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <div id="checkInDateDiv" runat="server" class="checkin-date-div">
                                        <asp:TextBox ID="txtCheckinDate" runat="server" CssClass="checkin-date"></asp:TextBox>
                                    </div>
                                    <div id="statusDiv" runat="server" class="status-value-div">
                                        <asp:TextBox ID="txtSearchValue" runat="server" CssClass="search-value"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="updatePanelGV" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="gvBookings" runat="server" OnRowDataBound="gvBookings_RowDataBound"
                        Width="100%" CssClass="table table-bordered">
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
