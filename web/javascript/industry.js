$(document).ready(function() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            var data = JSON.parse(xhr.responseText);
            var industries = (data.toString()).split(',');
            for(var x in industries){
                $("#industries").append('<option value="'+ industries[x]+'">'+industries[x]+'</option>');
            }
        }
    }
    xhr.open('POST', 'find-industry', true);
    //xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(null);
});
// <option value="Текст1">