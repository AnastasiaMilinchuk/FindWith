$(function(){
    $(".skilltext").click(function(event) {
        $("#"+event.target.id + "del").remove();
    });
});
