$(function(){
    $("#change-profile").click( function(){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = xhr.responseText;
            }
        }

        $('#dropDownId :selected').text();
        xhr.open('post', 'update-profile', true);
        xhr.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded");
        xhr.send("bday=" + $("#bday").val()+
                "&bmonth" + $("#bmonth").val()+
                "&byear" +$("#byear").val()+
                "&email=" +$("#email").val()+
                "&phone=" +$("#phone").val()+
                "&industry=" +$("#industries :selected").val()+
                "&university=" + $("#universities :selected").val()+
                "&faculty=" + $("#faculties :selected").val()+
                "&graduateYear=" + $("#graduateYear").val()+
                "&country=" + $("#countries :selected").val()+
                "&city=" +$("#cities :selected").val()
        );
    });
});
/*
 "bday=" + $("#bday").val()+
 "&bmonth" + $("#bmonth").val()+
 "&byear" +$("#byear").val()+
 "&email=" +$("#email").val()+
 "&phone=" +$("#phone").val()+
 "&industry=" +$("#industry").val()+
 "&university=" + $("#university").val()+
 "&faculty=" + $("#faculty").val()+
 "&graduateYear=" + $("#graduateYear").val()+
 "&country=" + $("#country").val()+
 "&city=" +$("#city").val()
 */