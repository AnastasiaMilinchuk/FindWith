$(function(){
    $("#city").click(function(){
        if( $("#country").val() != "" && $("#country").val() != null)
            var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = JSON.parse(xhr.responseText);
                var cities = (data.toString()).split(',');
                for(var x in cities){
                    $("#cities").append('<option selected value="'+ cities[x]+'">');
                }
            }
        }
        xhr.open('POST', 'find-cities', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("country="+ $("#country").val());
    });
});

