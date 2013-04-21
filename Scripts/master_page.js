$(function () {

    $(".close").click(function () {
        $(this).parent().parent().remove();
    });

    $("#empty-basket").dialog({
        autoOpen: false,
        width: 425,
        height: 200,
        modal: true,
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        }
    });

    $(".no-basket-items").click(function (e) {
        e.preventDefault();
        $("#empty-basket").dialog("open");
    });

});