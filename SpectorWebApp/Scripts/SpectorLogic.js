



function displayCreateP() {
    $('#CreateP').toggle(1000).show();
}

String.prototype.isEmpty = function () {
    return (this.length === 0 || !this.trim());
}

function log(message) {
    console.dir(message);
}

var Methods = {

    rmbtn: {},

    addNewMessage: function () {

        var Message = $('#MsgText').val();
        
        var removeBtn = '<a href="#" onclick="Methods.showModel(this);" id="rmvBtn">Remove</a>';

        if (String(Message).isEmpty()) {
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

    deleteMessage: function () {

        var btn = this.rmbtn;
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
                $('#myModal').modal('hide');
            }
        }).error(function (err) {
            log(err)
        });
    },

    showModel: function (btn) {
        $('#myModal').modal('show');
        this.rmbtn = btn;
    }
};

