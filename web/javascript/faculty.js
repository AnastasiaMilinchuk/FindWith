$(function(){
    $("#faculty").click(function(){
        if( $("#university").val() != "" && $("#university").val() != null)
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    var data = JSON.parse(xhr.responseText);
                    var faculties = (data.toString()).split(',');
                    for(var x in faculties){
                        $("#faculties").append('<option selected value="'+ faculties[x]+'">');

                    }

                }
        }
        xhr.open('POST', 'find-faculties', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("university="+ $("#university").val());
    });
});
