<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="Account_MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        $("#dob").datepicker({
            constrainInput: true,
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true
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
            },
            buttons: {
                Save: function () {
                    var that = this;
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
                            $(that).dialog("close");
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
                },
                Close: function () {
                    $(this).dialog("close");
                }
            }
        });

        $("#add-passenger").click(function (e) {
            e.preventDefault();
            $("#action").val("new");
            $("#add-passenger-div").dialog("open");
        });

        $("#middle-content").delegate('a.delete-passenger', 'click', function (e) {
            e.preventDefault();
            if (!confirm("Are you sure?")) {
                return false;
            };
            var id = $(this).data('id');
            $.post('<%=ResolveUrl("~/PassengerWebService.asmx/DeletePassenger") %>', { contentType: "application/json; charset=utf-8", type: "json", id: id }, function (response) {
                $("tr#" + id).remove();
            });
        });

        $("#middle-content").delegate('a.edit-passenger', 'click', function (e) {
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
            html = html + "<td><a href='#' class='edit-passenger' data-id='" + id + "'>Edit</a></td>";
            html = html + "<td>"
            if (allowDelete) {
                html = html + "<a href='#' class='delete-passenger' data-id='" + id + "'>Delete</a>"
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset>
  <legend>My Account</legend>
  <table style="width:100%;">
    <tr>
      <td style="width:45%">
        <p>
          <label>First Name</label>
          <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ControlToValidate="txtFirstName" ForeColor="#FF3300" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </p>
      </td>
      <td>
        <p>
          <label>Middle Name</label>
          <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <label>Last Name</label>
          <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </p>
      </td>
      <td>
        <p>
          <label>Mobile</label>
          <asp:TextBox ID="txtMobile" runat="server" MaxLength="300"></asp:TextBox>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <label>Telephone</label>
          <asp:TextBox ID="txtTelephone" runat="server" MaxLength="300"></asp:TextBox>
        </p>
      </td>
      <td>
        <p>
          <label>City</label>
          <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" 
          DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID">
          <asp:ListItem Value="0">Select</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
          SelectCommand="SELECT [CityID], [CityName] FROM [CityMaster]">
          </asp:SqlDataSource>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <label>Address 1</label>
          <asp:TextBox ID="txtAddress1" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
        </p>
      </td>
      <td>
        <p>
          <label>Address 2</label>
          <asp:TextBox ID="txtAddress2" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
        </p>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <p>
          <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save"  CssClass="btn btn-save btn-primary"/>
          &nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                    onclick="btnCancel_Click" Text="Cancel"  CssClass="btn"/>
        </p>
      </td>
    </tr>
  </table>
  </fieldset>
  <input id="add-passenger" type="button" value="Add Passenger" class="btn btn-primary" />
  <br />
  <h3>Passenger Information</h3>
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
    <% foreach (var passenger in b2CCustomerinfo.B2CPaxinfo)
       { %>

       <tr id="<%= passenger.CustomerSno %>">
        <td> <%= passenger.Title %></td>
        <td><%= passenger.PaxFirstName %></td>
        <td><%= passenger.PaxMiddleName %></td>
        <td><%= passenger.PaxLastName %></td>
        <td><%= DateTimeHelper.ConvertToString(passenger.PaxDOB.ToString()) %></td>
        <td><%= QueryHelper.GetCountryName(_meis007Entities, passenger.Nationality) %></td>
        <td><a href="#" class="edit-passenger" data-id="<%= passenger.CustomerSno %>">Edit</a></td>
        <td>
          <% if(passenger.CustomerId != 1) {%>
            <a href="#" class="delete-passenger" data-id="<%= passenger.CustomerSno %>">Delete</a>
          <%} %>
        </td>
       </tr>
    <%} %>
  </table>
  <div id="add-passenger-div">
  <fieldset>
    <legend>Add Passenger</legend>
    <input type="hidden" id="action" value="new" />
    <div class="alert alert-error custom-hide">
      <h3></h3>
    </div>
    <p>
      <label>Title</label>
        <select id="title">
          <option>Mr</option>
          <option>Mrs</option>
          <option>Miss</option>
          <option>Ms</option>
          <option>Dr</option>
          <option>Master</option>
        </select>
    </p>
    <p>
      <label>First Name</label>
        <input id="firstName" type="text" />
    </p>
    <p>
      <label>Middle Name</label>
        <input id="middleName" type="text" />
    </p>
    <p>
      <label>Last Name</label>
        <input id="lastName" type="text" />
    </p>
    <p>
      <label>DOB</label>
        <input id="dob" type="text" />
    </p>
    <p>
      <label>Nationality</label>
        <asp:DropDownList ID="ddlNationality" runat="server" ClientIDMode="Static" 
            DataSourceID="SqlDataSource2" DataTextField="CountryName" 
            DataValueField="CountryID">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:meis007ConnectionString %>" 
            SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster]">
        </asp:SqlDataSource>
    </p>
  </fieldset>
  </div>
</asp:Content>

