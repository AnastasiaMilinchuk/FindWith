$(function(){
    $("#universities").change(function(){
        $("#faculties").empty();
        $("#faculties").append('<option selected value="none">none</option>');
        if( $("#universities").find(":selected").text() != "" && $("#universities").find(":selected").text() != null){
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4) {
                        var data = JSON.parse(xhr.responseText);
                        var faculties = (data.toString()).split(',');
                        for(var x in faculties){
                            $("#faculties").append('<option value="'+ faculties[x]+'">'+faculties[x]+'</option>');

                        }

                    }
            }
            xhr.open('POST', 'find-faculties', true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("university="+ $("#universities").find(":selected").text());
        }
    });
});
