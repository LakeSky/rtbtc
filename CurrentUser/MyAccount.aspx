<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="Account_MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        var minDate = new Date();
        var currentDate = new Date();
        minDate.setFullYear(minDate.getFullYear() - 120);
        var diffYears = currentDate.getFullYear() - minDate.getFullYear();
        $("#dob").datepicker({
            yearRange: "-" + diffYears + ":+0",
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true,
            minDate: minDate,
            maxDate: 0
        });
        $("#dob").attr("readonly", true);

        $("#add-passenger-div").dialog({
            autoOpen: false,
            width: 700,
            height: 650,
            modal: true,
            open: function () {
                if ($("#action").val() == "new") {
                    $("#title").val("Mr");
                    $("#firstName").val("");
                    $("#middleName").val("");
                    $("#lastName").val("");
                    $("#dob").val("");
                    $("#ddlNationality").val("");
                } else {
                    var passenger = window.passenger;
                    $("#title").val(passenger.title);
                    $("#firstName").val(passenger.firstname);
                    $("#middleName").val(passenger.middlename);
                    $("#lastName").val(passenger.lastname);
                    $("#dob").val(passenger.dob);
                    $("#ddlNationality").val(passenger.nationality);
                }
                $("#add-passenger-div .alert h3").val("");
                $("#add-passenger-div .alert").addClass("custom-hide");
            }
        });

        $(".save_pax").click(function (e) {
            e.preventDefault();
            var error = false;
            if ($("#action").val() == "new") {
                var id = '<%= CurrentUser.Id() %>';
                var url = '<%=ResolveUrl("~/PassengerWebService.asmx/AddPassenger") %>';
            } else {
                var id = window.passenger.id;
                var url = '<%=ResolveUrl("~/PassengerWebService.asmx/EditPassenger") %>';
            }
            var title = $("#title").val();
            var firstname = $("#firstName").val();
            var middlename = $("#middleName").val();
            var lastname = $("#lastName").val();
            var dob = $("#dob").val();
            var nationality = $("#ddlNationality").val();
            var nationalitySelectedText = $("#ddlNationality option:selected").text();
            var message = "";

            if ($.trim(firstname) == "") {
                error = true;
                message = "First Name is required!<br/>";
            }
            if ($.trim(lastname) == "") {
                error = true;
                message = message + "Last Name is required!<br/>";
            }
            if ($.trim(dob) == "") {
                error = true;
                message = message + "DOB is required!<br/>";
            }
            if ($.trim(nationality) == "0") {
                error = true;
                message = message + "Nationality is required!";
            }
            if (error) {
                $("#add-passenger-div .alert h3").html(message);
                $("#add-passenger-div .alert").removeClass("custom-hide");
                return;
            }
            $("#add-passenger-div .alert").addClass("custom-hide");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: url,
                data: "{'id': '" + id + "', 'title': '" + title + "', 'firstname': '" + firstname + "', 'middlename' : '" + middlename + "', 'lastname' : '" + lastname + "', 'dob' : '" + dob + "', 'nationality' : '" + nationality + "'}",
                dataType: "json",
                success: function (data) {
                    var passengerid = data.d;
                    appendRow(passengerid, title, firstname, middlename, lastname, dob, nationalitySelectedText);
                    $("#add-passenger-div").dialog("close");
                },
                error: function (result) {
                    console.log(result);
                }
            });
        });

        $(".cancel_pax").click(function (e) {
            e.preventDefault();
            $("#add-passenger-div").dialog("close");
        });

        $("#add-passenger").click(function (e) {
            e.preventDefault();
            $("#action").val("new");
            $("#add-passenger-div").dialog("open");
        });

        $("#wrapper").delegate('.delete-passenger', 'click', function (e) {
            e.preventDefault();
            if (!confirm("Are you sure?")) {
                return false;
            };
            var id = $(this).data('id');
            $.post('<%=ResolveUrl("~/PassengerWebService.asmx/DeletePassenger") %>', { contentType: "application/json; charset=utf-8", type: "json", id: id }, function (response) {
                $("tr#" + id).remove();
            });
        });

        $("#wrapper").delegate('.edit-passenger', 'click', function (e) {
            e.preventDefault();
            $("#action").val("edit");
            var id = $(this).data('id');

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%=ResolveUrl("~/PassengerWebService.asmx/GetPassenger") %>',
                data: "{'id': '" + id + "'}",
                dataType: "json",
                success: function (data) {
                    window.passenger = data.d;
                    $("#action").val("edit");
                    $("#add-passenger-div").dialog("open");
                },
                error: function (result) {
                    console.log(result);
                }
            });

        });

        function appendRow(id, title, firstname, middlename, lastname, dob, nationality) {
            var allowDelete = true;
            var replaceRow = false;
            var trId = "";
            if ($("#action").val() != "new") {
                replaceRow = true;
                trId = "tr#" + window.passenger.id;
                if (window.passenger.customerid == "1") {
                    allowDelete = false;
                }
            }
            var html = "<tr id='" + id + "'>";
            html = html + "<td>" + title + "</td>";
            html = html + "<td>" + firstname + "</td>";
            html = html + "<td>" + middlename + "</td>";
            html = html + "<td>" + lastname + "</td>";
            html = html + "<td>" + dob + "</td>";
            html = html + "<td>" + nationality + "</td>";
            html = html + "<td><strong class='button_content button_content1 edit-passenger' data-id='" + id + "'><strong class='button bg_button'><a href='#'><span class='ui-button-text'>Edit</span></a></strong></strong></td>";
            html = html + "<td>"
            if (allowDelete) {
                html = html + "<strong class='button_content button_content2 delete-passenger' data-id='" + id + "'><strong class='button bg_button'><a href='#'><span class='ui-button-text'>Delete</span></a></strong></strong>";
            }
            html = html + "</td>";
            html = html + "</tr>";
            if (replaceRow) {
                $(trId).replaceWith(html);
            } else {
                $(".passenger-table").append(html);
            }
        }
        window.passenger = null;
    });
</script>
  <style type="text/css">
    .fieldValue select {
      width: 159px;
    }
    .fieldValue textarea {
      width: 159px;
    }
    .ui-dialog
    {
        background-color: #FFF;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row row_2 container_24">
    <div class="grid_24">
      <div style="float: right;">
        <strong class="button_content button_content1 marginR10">
          <strong class="button bg_button" style="margin-bottom: 9px;">
            <a href="<%= Route.GetRootPath("bookings/index.aspx") %>">
              <span class="ui-button-text"> My Hotel Bookings </span>
            </a>
          </strong>
        </strong>
        <strong class="button_content button_content1">
          <strong class="button bg_button" style="margin-bottom: 9px;">
            <a href="<%= Route.GetRootPath("bookings/packages.aspx") %>">
              <span class="ui-button-text"> My Package Bookings </span>
            </a>
          </strong>
        </strong>
      </div>
      <div class="clear"></div>
      <div class="contentContainer page_search">
        <div class="contentBlock">
          <div>
            <h4>
              My Account
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
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ForeColor="#FF3300"
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                  </td>
                </tr>
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
                  <td class="fieldKey">
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save"  CssClass="btn btn-save btn-primary"/>
                  </td>
                  <td class="fieldValue">
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" onclick="btnCancel_Click" Text="Cancel"
                    CssClass="btn"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <strong id="add-passenger" class="button_content button_content1" style="float:right;">
        <strong class="button bg_button" style="margin-bottom: 9px;">
          <button type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
            <span class="ui-button-text">
              Add Passenger
            </span>
          </button>
        </strong>
      </strong>
      <h3 style="float:left;">Passenger Information</h3>
      <div class="clear"></div>
      <table class="table table-bordered passenger-table">
        <tr>
          <th>Title</th>
          <th>First Name</th>
          <th>Middle Name</th>
          <th>Last Name</th>
          <th>DOB</th>
          <th>Nationality</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
        <% meis007Model.meis007Entities _meis007Entities = new meis007Model.meis007Entities();  %>
        <% foreach (var passenger in b2CCustomerinfo.B2CPaxinfo){ %>
          <tr id="<%= passenger.CustomerSno %>">
            <td> <%= passenger.Title %></td>
            <td><%= passenger.PaxFirstName %></td>
            <td><%= passenger.PaxMiddleName %></td>
            <td><%= passenger.PaxLastName %></td>
            <td><%= DateTimeHelper.ConvertToString(passenger.PaxDOB.ToString()) %></td>
            <td><%= QueryHelper.GetCountryName(_meis007Entities, passenger.Nationality) %></td>
            <td>
              <strong class="button_content button_content1 edit-passenger" data-id="<%= passenger.CustomerSno %>">
                <strong class="button bg_button">
                  <a href="#">
                    <span class="ui-button-text">Edit</span>
                  </a>
                </strong>
              </strong>
            </td>
            <td>
              <% if(passenger.CustomerId != 1) {%>
                <strong class="button_content button_content2 delete-passenger" data-id="<%= passenger.CustomerSno %>">
                  <strong class="button bg_button">
                    <a href="#">
                      <span class="ui-button-text">
                        Delete
                      </span>
                    </a>
                  </strong>
                </strong>
              <%} %>
            </td>
          </tr>
        <%} %>
      </table>
    </div>
  </div>
  <div id="add-passenger-div">
    <input type="hidden" id="action" value="new" />
    <div class="contentContainer page_search">
      <div class="contentBlock">
        <div>
          <h4>
            Add Passenger
          </h4>
        </div>
        <div class="contentText">
          <div class="alert alert-error custom-hide">
             <h3></h3>
          </div>
          <table>
            <tbody>
              <tr>
                <td class="fieldKey">
                  <label>Title</label>
                </td>
                <td class="fieldValue">
                  <select id="title">
                    <option>Mr</option>
                    <option>Mrs</option>
                    <option>Miss</option>
                    <option>Ms</option>
                    <option>Dr</option>
                    <option>Master</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="fieldKey">
                  <label>First Name</label>
                </td>
                <td class="fieldValue">
                  <input id="firstName" type="text" />
                </td>
              </tr>
              <tr>
                <td class="fieldKey">
                  <label>Middle Name</label>
                </td>
                <td class="fieldValue">
                  <input id="middleName" type="text" />
                </td>
              </tr>
               <tr>
                <td class="fieldKey">
                  <label>Last Name</label>
                </td>
                <td class="fieldValue">
                  <input id="lastName" type="text" />
                </td>
              </tr>
               <tr>
                <td class="fieldKey">
                  <label>DOB</label>
                </td>
                <td class="fieldValue">
                  <input id="dob" type="text" />
                </td>
              </tr>
               <tr>
                <td class="fieldKey">
                  <label>Nationality</label>
                </td>
                <td class="fieldValue">
                  <asp:DropDownList ID="ddlNationality" runat="server" ClientIDMode="Static" DataSourceID="SqlDataSource2"
                  DataTextField="CountryName" DataValueField="CountryID">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
                  SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster]">
                  </asp:SqlDataSource>
                </td>
              </tr>
               <tr>
                  <td>
                    <strong class="button_content button_content1 save_pax">
                      <strong class="button bg_button">
                        <a href="#">
                          <span class="ui-button-text">Save</span>
                        </a>
                      </strong>
                    </strong>
                  </td>
                  <td>
                    <strong class="button_content button_content2 cancel_pax">
                      <strong class="button bg_button">
                        <a href="#">
                          <span class="ui-button-text">Cancel</span>
                        </a>
                      </strong>
                    </strong>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
</asp:Content>

