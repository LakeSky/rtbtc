﻿<%@ Page Title="Riyadh Travels | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(function () {

        function updateDatePickerOfToDate(minSelectedDate) {
            minSelectedDate.setDate(minSelectedDate.getDate());
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

        $(".txtCity").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '<%=ResolveUrl("~/ViewHelperWebService.asmx/CitySearch") %>',
                    data: "{ 'q': '" + request.term + "'}",
                    dataType: "json",
                    success: function (data) {
                        console.log(data)
                        response(data.d);
                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
            }
        });

    });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="alert alert-danger" runat="server" id="errorDiv">Email already taken!</div>
<h3>
  Riyadh Travels
</h3>
<div id="hotel-search">
  <div class="div-wrapper">
    <h3>Hotel Search</h3>
    <label>Where do you want to go?</label>
    <asp:TextBox ID="txtCity" runat="server" CssClass="txtCity" 
          ValidationGroup="search"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    ControlToValidate="txtCity" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
    <label>When do you want to go?</label>
    <asp:TextBox ID="txtStartDate" runat="server" CssClass="start-date" 
          ValidationGroup="search"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                    ControlToValidate="txtStartDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
    <asp:TextBox ID="txtEndDate" runat="server" CssClass="end-date" 
          ValidationGroup="search"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" 
                    ControlToValidate="txtEndDate" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="search">*</asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="txtSearch" runat="server" Text="Search" 
          CssClass="btn btn-success" ValidationGroup="search"/>
  </div>
</div>
<br />
<div id="subscribe-block">
  <div class="div-wrapper">
    <div class="subscribe-content">
      <h5 class="inline">Subscribe</h5>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ForeColor="#FF3300" 
                    SetFocusOnError="True" ValidationGroup="subscribe">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
            ForeColor="#FF3300" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
                    ControlToValidate="txtEmail" SetFocusOnError="True" 
            ValidationGroup="subscribe">Please enter valid email !</asp:RegularExpressionValidator>
        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-primary" 
            onclick="btnSubscribe_Click" ValidationGroup="subscribe" />

    </div>
  </div>
</div>
        
</asp:Content>

