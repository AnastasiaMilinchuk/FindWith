$(function(){
    $("#add-skill").click(function(){

        if( $("#skill").val() != "" && $("#skill").val() != null)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    var data = JSON.parse(xhr.responseText);
                    var addSkill = (data.toString());
                    if(addSkill == "true"){
                        $("#skills").append('<span style="display: inline-block;"><label class="stiker">X</label><label class="skill">'+$("#skill").val()+'</label></span>');
                    }
                }
            }
            xhr.open('POST', 'addSkill', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("skill="+ $("#skill").val());
    });
});
