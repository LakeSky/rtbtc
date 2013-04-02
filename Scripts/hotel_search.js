
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
                    url: window.city_autocomplete_url,
                    data: "{ 'q': '" + request.term + "'}",
                    dataType: "json",
                    success: function (data) {
                        response(data.d);
                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
            }
        });

        $('.add-room').click(function (e) {
            e.preventDefault();
            if (window.room_index == 6) {
                return false;
            }
            var row = _.template($("#add-room-template").html(), { index: window.room_index });
            $(".rooms-table").append(row);
            $("#totalRooms").val(window.room_index);
            window.room_index = window.room_index + 1;
            if (window.room_index != 3) {
                var remove_button_id = "#remove_room_" + (window.room_index - 2);
                $(remove_button_id).remove();
            }
        });

        $("#middle-content").delegate('.remove-room', 'click', function (e) {
            e.preventDefault();
            var roomId = "tr#room_" + $(this).data('id');
            $(roomId).remove();
            window.room_index = window.room_index - 1;
            $("#totalRooms").val(window.room_index - 1);
            removeChildAgesRow(window.room_index);
            if (window.room_index != 2) {
                var index = window.room_index - 1;
                var button = _.template($("#add-remove-room-button-template").html(), { index: index });
                roomId = "tr#room_" + index;
                $(roomId + " td:last").html(button);
            }
        });

        $("#middle-content").delegate('.kids', 'change', function (e) {
            e.preventDefault();
            var index = $(this).data('id');
            var val = parseInt($(this).val());
            removeChildAgesRow(index);
            if (val != 0) {
                var roomId = "tr#room_" + index;
                var childRow = _.template($("#add-child-ages-template").html(), { index: index });
                $(roomId).after(childRow);
                var childRowId = "tr#child_" + index;
                var ageTd = _.template($("#child-age-dropdown-template").html(), { index: index, age_index: 1 });
                $(childRowId + " .td_1").html(ageTd);
                if (val > 1) {
                    ageTd = _.template($("#child-age-dropdown-template").html(), { index: index, age_index: 2 });
                    $(childRowId + " .td_2").html(ageTd);
                }
                if (val > 2) {
                    ageTd = _.template($("#child-age-dropdown-template").html(), { index: index, age_index: 3 });
                    $(childRowId + " .td_3").html(ageTd);
                }
                if (val > 3) {
                    ageTd = _.template($("#child-age-dropdown-template").html(), { index: index, age_index: 4 });
                    $(childRowId + " .td_4").html(ageTd);
                }
            }
        });

        function removeChildAgesRow(index) {
            var childId = "tr#child_" + index;
            $(childId).remove();
        }

        _.each($(".old-ddl"), function(ddl){
          var val = $(ddl).data('value');
          $(ddl).val(val);
        });

    });