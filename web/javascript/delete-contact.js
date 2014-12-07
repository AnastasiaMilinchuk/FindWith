$(function(){
    $(".delete-contact").click(function(event) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var removeContact = (data.toString());
                if(removeContact == "true"){
                    $("#"+event.target.id+"del").remove();
                }
            }
        }
        xhr.open('POST', 'delete-contact', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("contact="+ $("#"+event.target.id + "val").text());
    });
});

