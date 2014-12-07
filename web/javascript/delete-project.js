$(function(){
    $(".delete-project").click(function(event) {
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var removeProject = (data.toString());
                if(removeProject == "true"){
                    $("#"+event.target.id+"del").remove();
                }
            }
        }
        xhr.open('POST', 'delete-project', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("reference="+ $("#"+event.target.id+"reference").text()+
        "&description=" + $("#" + event.target.id + "description").text());
    });
});

