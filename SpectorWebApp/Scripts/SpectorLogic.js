

function displayCreateP() {
    $('#CreateP').toggle(1000).show();
}



var Methods = {

    addNewMessage: function () {

        var Message = $('#MsgText').val();
        
        var removeBtn = '<a href="#" onclick="Methods.deleteMessage(this)" id="rmvBtn">Remove</a>';

        if (Message === "") {
            $('#InvSpan').show();
            return;
        }
        else
            $('#InvSpan').hide();

        $.ajax({

            url: 'SpectorWCF.svc/AddMessage',
            method: 'post',
            contentType: 'application/json',
            data: JSON.stringify({ message: Message })

        }).success(function (result) {

            if (result.d !== null) {
                var row = result.d;
                $('#MsgsGrid').append("<tr><td>" + row.ID + "</td><td>" + row.Message
                    + "</td><td>" + removeBtn + "</td></tr>");
                $('#MsgText').val('');
            }
        }).error(function (err) {
            log(err);
        });
    },

    deleteMessage: function (btn) {

        //$(btn).parents('tr').remove();
        var Id = parseInt($(btn).parentsUntil('tr').parent('tr').find('#lblID').text());
       
        if (isNaN(Id))
            Id = $(btn).parentsUntil('tr').parent('tr').children('td').first().text();
        
        $.ajax({

            url: 'SpectorWCF.svc/DeleteMessage',
            method: 'post',
            contentType: 'application/json',
            data: JSON.stringify({ MsgId: Id })

        }).success(function (result) {
            if (result.d === true) {
                $(btn).parentsUntil('tr').parent('tr').remove();
            }
        }).error(function (err) {
            log(err)
        });
    }
};

function log(message) {
    console.dir(message);
}