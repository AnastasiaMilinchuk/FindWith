$(function(){
    $("#add-skill").click(function(){
        if($("#skill").val() != "" && $("#skill").val() != null)
            $("#skills").append('<span style="display: inline-block;">' +
                '<label class="stiker"></label><label class="skill">'
                +$("#skill").val()+'</label></span>');
    });
});

