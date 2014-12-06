 $(document).ready(function() {
        for(var i = 1; i <= 31; i++){
            $("#bday").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
        }

        for(var i = 1; i <= 12; i++){
            $("#bmonth").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
        }

        for(var i = 1920; i <= 2004; i++){
            $("#byear").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
        }
 });


