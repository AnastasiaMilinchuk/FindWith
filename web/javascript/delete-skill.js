$(function(){
    $(".stiker").click(function(event) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var removeSkill = (data.toString());
                if(removeSkill == "true"){
                    $("#"+event.target.id).remove();
                    $("#"+event.target.id+"skill").remove();
                }
            }
        }
        xhr.open('POST', 'delete-skill', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send("skill="+ $("#"+event.target.id+"skill").text());
    });
});
