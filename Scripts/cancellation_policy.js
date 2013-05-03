$(function () {

    $("#cancellation_policy_dialog").dialog({
        autoOpen: false,
        width: 550,
        height: 220,
        modal: true,
        open: function () {
            $("#cancellation_policy_dialog .loading-image").removeClass("custom-hide");
            $("#cancellation_policy_dialog .table").html("");
            $("#cancellation_policy_dialog .table").addClass("custom-hide");
        }
    });

    $(".show_cancellation_policy").click(function (e) {
        e.preventDefault();
        $("#cancellation_policy_dialog").dialog('open');
        var id = $(this).data('id');
        var name = $(this).data('name');
        var from = $(this).data('from');
        var to = $(this).data('to');
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: window.cancellation_policy_url,
            data: "{ 'id': '" + id + "', 'supplierName': '" + name + "', 'fromDate': '" + from + "', 'toDate': '" + to + "' }",
            dataType: "json",
            success: function (data) {
                var html = "";
                _.each(data.d, function (x) {
                    html = "<tr><td>";
                    html += x.ChargingType;
                    html += " ";
                    html += x.FromDate;
                    html += " ";
                    html += x.ToDate;
                    html += "</td></tr>";
                    $("#cancellation_policy_dialog .table").append(html);
                });
                $("#cancellation_policy_dialog .loading-image").addClass("custom-hide");
                $("#cancellation_policy_dialog .table").removeClass("custom-hide");
            },
            error: function (result) {
                console.log(result);
            }
        });
    });
});