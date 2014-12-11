$(function(){
    $("#found-people").click(function(event){
        if(event.target.id != ""){
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    var data = JSON.parse(xhr.responseText);
                    var addContact = (data.toString());
                    if(addContact == "true"){
                        alert("Added to your friends");
                    }
                }
            }
            xhr.open('POST', 'add-to-contact', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("contact=" + event.target.id);
        }
    });
});
