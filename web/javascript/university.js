$(document).ready(function() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            var data = JSON.parse(xhr.responseText);
            var universities = (data.toString()).split(',');
            for(var x in universities){
                $("#universities").append('<option selected value="'+ universities[x]+'">');

            }
        }
    }
    xhr.open('POST', 'find-universities', true);
    //xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(null);
});