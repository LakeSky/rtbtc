$(function () {
    var i = 0;
    _.each($("#tabnav a"), function (x) {
        if (i != 0) {
            var id = $(x).attr('href');
            $(id).addClass('custom-hide');
        } else {
            $(x).parent().addClass("ui-tabs-selected");
        }
        i = i + 1;
    });

    $("#tabnav a").click(function (e) {
        e.preventDefault();
        var href = $(this).attr('href');
        _.each($("#tabnav a"), function (x) {
            var id = $(x).attr('href')
            if (href != id) {
                var id = $(x).attr('href');
                $(id).hide(1000);
                $(x).parent().removeClass("ui-tabs-selected");
            } else {
                $(x).parent().addClass("ui-tabs-selected");
            }
        });
        $(href).show(1000);
    });
});