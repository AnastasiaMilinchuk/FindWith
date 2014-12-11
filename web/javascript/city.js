$(function(){
    $("#countries").change(function(){
            $("#cities").empty();
            $("#cities").append('<option selected value="none">none</option>');
            if( $("#countries").find(":selected").text() != "" && $("#countries").find(":selected").text() != null){
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4) {
                        var data = JSON.parse(xhr.responseText);
                        var cities = (data.toString()).split(',');
                        for(var x in cities){
                            $("#cities").append('<option value="' + cities[x]+'">'+cities[x]+'</option>');
                        }
                    }
                }
                xhr.open('POST', 'find-cities', true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("country="+ $("#countries").find(":selected").text());
            }
        });

});