function ValidateForm(sender, args) {
    $(".custom-message").addClass('hide');
    var valid = true;
    valid = _.all($(".firstname"), function (x) {
        return $.trim($(x).val()) != "";
    });
    if (!valid) {
        $(".custom-message #message").text("Please enter first name!");
        $(".custom-message").removeClass('hide');
        args.IsValid = false;
        return false;
    }
    valid = _.all($(".lastname"), function (x) {
        return $.trim($(x).val()) != "";
    });
    if (!valid) {
        $(".custom-message #message").text("Please enter last name!");
        $(".custom-message").removeClass('hide');
        args.IsValid = false;
        return false;
    }
    args.IsValid = true;
}

$(function () {

    function convertToDate(input) {
        var dateArray = input.split('-');
        var output = new Date(dateArray[2], parseInt(dateArray[1]) - 1, dateArray[0]);
        return output;
    }

    var minDate = convertToDate(window.minDate);
    var maxDate = convertToDate(window.maxDate);

    $(".start-date").datepicker({
        constrainInput: true,
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        changeYear: true,
        minDate: minDate,
        maxDate: maxDate
    });

    $(".start-date, .end-date").attr("readonly", true);

    $(".add-passenger").click(function (e) {
        e.preventDefault();
        var index = parseInt($("#passengers_count").val()) + 1;
        var row = _.template($("#add-passenger-template").html(), { index: index });
        $("#row-to-add").before(row);
        $("#passengers_count").val(index);
        if (index != 2) {
            var removeBtnId = "#remove_passenger_" + (index - 1);
            $(removeBtnId).remove();
        }
    });

    $("#wrapper").delegate('.remove-passenger', 'click', function (e) {
        e.preventDefault();
        var index = $(this).data('id');
        var passengerId = "tr#passenger_" + index;
        $(passengerId).remove();
        var count = parseInt(index) - 1;
        $("#passengers_count").val(count);
        if (index != "2") {
            var rowId = "tr#passenger_" + (index - 1);
            var button = _.template($("#add-remove-passenger-button-template").html(), { index: (index - 1) });
            $(rowId + " td:last").html(button);
        }
    });
});