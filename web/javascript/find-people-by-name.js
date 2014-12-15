$(function(){
    $("#find-people-by-name").click(function(){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                for(var x in data){
                    $("#found-people").append('<tr>' +
                        '<td> ' +
                        '<div class="card">' +
                        '<div  class="card-photo"><img class="photo" src="'+data[x].photo+'"/></div>' +
                        '<div class="card-info">'+
                        '<a href="profile?id='+data[x].id.$oid+'"><h3>'+data[x].firstname+" "+data[x].lastname+'</h3></a>' +
                        '<label>'+data[x].login+'</label>' +
                        '<br>' +
                        '<button class="add-to-friends" id="'+data[x].id.$oid+'" value="'+data[x].id.$oid+'">Add to contacts</button>' +
                        '</div>' +
                        '</div>' +
                        '</td>' +
                        '</tr>');

                }
            }
        }
        xhr.open('POST', 'find-people-by-name', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("firstname="+ $("#firstname").val() +
            "&lastname=" + $("#lastname").val()
        );
    });
});
