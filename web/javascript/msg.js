/**
 * Created by click on 12/7/2014.
 */
$(function () {
    $("input[name='radio']").on("change", function () {
      if(this.value=="1"){
          $('#newDiv').css('display','block');
          $('#inboxDiv').css('display','none');
          $('#outboxDiv').css('display','none');
      }
        if(this.value=="2"){
            $('#newDiv').css('display','none');
            $('#inboxDiv').css('display','block');
            $('#outboxDiv').css('display','none');
        }
        if(this.value=="3"){
            $('#newDiv').css('display','none');
            $('#inboxDiv').css('display','none');
            $('#outboxDiv').css('display','block');
        }
    });

});