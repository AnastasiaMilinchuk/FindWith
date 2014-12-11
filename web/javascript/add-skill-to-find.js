$(function(){
    $("#add-skill").click(function(){
        var n = $(".stiker").length;
        $("#skills").append('<span  style="display: inline-block;" id="'+n+'skilldel"><label id="'+n+'skill" class="stiker">X</label><label class="skill">'
            +$("#skill").val()+'</label></span>');
    });
});

