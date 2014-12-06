$(function(){
    $("#change-profile").click( function(){
        alert($("#phone").val());
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                var data = xhr.responseText;
                alert(data);
            }
        }
        xhr.open('post', 'update-profile', true);
        xhr.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded");
        xhr.send("bday=" + $("#bday").val()+
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