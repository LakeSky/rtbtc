$(function () {

    $("#cancellation_policy_dialog").dialog({
        autoOpen: false,
        width: 550,
        height: 220,
        modal: true
    });

    $(".show_cancellation_policy").click(function (e) {
        e.preventDefault();
        $("#cancellation_policy_dialog").dialog('open');
    });
});