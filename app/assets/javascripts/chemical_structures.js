$('document').ready(function () {
    $("#modal-name").on("input change", function (e) {
        validate_name(e)
    })
})


function validate_name(e) {
    var name_field = $(e.currentTarget)
    var name = name_field.val()
    if(name.match(/\S/g)!=null) {
        $.ajax({
            type: "get",
            url: "/validate_name?search_name=" + name,
            complete: function (response) {
                if (response.responseJSON['found']) {
                    if (!$(name_field).parent().hasClass('has-error')) {
                        $(name_field).parent().addClass('has-error')
                        $(name_field).parent().prepend('<label style="color:red">Chemical with same name already exists</label>')
                        $(".save-name").addClass("disabled")
                    }
                }
                else {
                    $(name_field).parent().removeClass('has-error')
                    $(name_field).parent().addClass('has-success')
                    $(name_field).parent().find('label').remove()
                    $(".save-name").removeClass("disabled")
                }
            }
        });
    }
    else{
        if (!$(name_field).parent().hasClass('has-error')) {
            $(name_field).parent().addClass('has-error')
            $(name_field).parent().prepend('<label style="color:red">Name Cant be blank </label>')
            $(".save-name").addClass("disabled")
        }
    }

}