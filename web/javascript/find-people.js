$(function(){
    $("#find-people").click(function(){
            var xhr = new XMLHttpRequest();
            $("#found-people").empty();
            var skills="";

            $(".skill").each(function(){
                if($(this).text()!=""){
                    skills += $(this).text()+ ",";
                }
            });

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    var data = JSON.parse(xhr.responseText);
                    for(var x in data){
                        $("#found-people").append('<tr>' +
                            '<td ><img class="photo" src="'+data[x].photo+'"/></td>' +
                            '<td>'+
                            '<a href="profile?id='+data[x].id.$oid+'"><h3>'+data[x].firstname+" "+data[x].lastname+'</h3></a>' +
                            '<label>'+data[x].login+'</label>' +
                            '<br><br>' +
                            '<button class="add-to-friends" id="'+data[x].id.$oid+'" value="'+data[x].id.$oid+'">Add to contacts</button>' +
                            '</td>' +
                            '</tr>');

                    }
                }
            }

            if(skills == ""){
                skills = "none";
            }

            xhr.open('POST', 'find-people', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("industry="+ $("#industries").find(":selected").text() +
                "&skills=" + skills +
                "&country=" + $("#countries").find(":selected").text() +
                "&city=" +$("#cities").find(":selected").text()
            );
    });
});