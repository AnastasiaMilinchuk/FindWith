$(function(){
    $(".delete-following").click(function(event) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var removeFollow = (data.toString());
                if(removeFollow == "true"){
                    $("#"+event.target.id+"del").remove();
                }
            }
        }
        xhr.open('POST', 'delete-following', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send("following="+ $("#"+event.target.id+"val").text());
    });
});
