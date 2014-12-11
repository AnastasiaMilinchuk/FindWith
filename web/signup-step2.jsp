<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 4/28/14
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <title></title>
    <meta charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="resources/signup.css">
    <script  type="text/javascript" src="javascript/jquery.js" charset="utf-8">
    </script>
    <script src="javascript/country.js"></script>
    <script src="javascript/city.js"></script>
    <script src="javascript/industry.js"></script>
    <script src="javascript/university.js"></script>
    <script src="javascript/faculty.js"></script>

    <script  type="text/javascript">
        $(function(){
            $('#person').click(function(){
                $('#organization-data').hide();
                $('#person-data').show();
            });
        });
        $(function(){
            $('#organization').click(function(){
                $('#person-data').hide();
                $('#organization-data').show();

            });
        });
        $(document).ready(function() {
            $('#organization-data').hide();
            $('#person').prop('checked', true);

            var max_fields      = 31; //maximum input boxes allowed
            var wrapper         = $("#day"); //Fields wrapper

            for(var i = 1; i <= 31; i++){ //max input box allowe
                $(wrapper).append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            }

            for(var i = 1; i <= 12; i++){ //max input box allowed
                $("#month").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            }

            for(var i = 1920; i <= 2004; i++){ //max input box allowed
                $("#year").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            }

            for(var i = 1940; i <= 2020; i++){
                $("#graduateYear").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            };
        });

    </script>
</head>
<body>

<div class="upperbox">
    <div class="upperboxfill">
        <div class="upperboxlogo">
            <a class="logo" href="/signin">Logotype</a>
        </div>
        <div class="upperboxadd">
            <span style="margin:0px 10px 0px 37px;color:#717171;"> |  </span>
            <span class="accounts">
                Accounts
            </span>
        </div>
    </div>
</div>


<div class="lowerbox">
    <div class="container">
        <div class="mainbox">
            <div class="row1" >
                <div class="signin">
                    <h1>Sign Up - Step 2</h1>
                </div>
            </div>
            <div class="mainboxleft">
                <%--<form action="${pageContext.request.contextPath}/SignupSubmit" method="doPost">--%>
                    <div class="inputpos">
                        <label class="labelcontrols">User</label>
                        <input id="person" class="controls" name="face" value="person"
                               type="radio" checked>

                    </div>

                    <div class="inputpos">
                        <label class="labelcontrols" >Organization</label>
                        <input id="organization" class="controls" name="face" value="organization"
                               type="radio">
                    </div>


                    <form id="person-data" action="create-person-profile" method="post">
                        <div class="inputpos">
                            <label  class="labelcontrols" >Birthday</label>
                            <select name="day" id="day">
                            </select>
                            <select name="month" id="month">
                            </select>
                            <select name="year" id="year">
                            </select>
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" >Phone</label>
                            <div class="controls">
                                <input class="controls" placeholder="Phone" tittle="Enter phone"name="phone" id="phone">
                            </div>
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" >Education</label>
                            <div class="controls">
                                <select class="controls" name="university" id="universities">
                                    <option selected>none</option>
                                </select>
                                <select class="controls" name="faculty" id="faculties">
                                    <option selected>none</option>
                                </select>
                                <select class="controls" name="graduateYear" id="graduateYear"></select>
                            </div>
                        </div>
                        <div class="inputpos">
                            <label  class="labelcontrols" >Industry</label>
                            <div class="controls">
                                <select class="controls" name="industry" id="industries">
                                    <option selected>none</option>
                                    </select>
                            </div>
                        </div>
                        <div class="inputpos">
                            <label  class="labelcontrols" >Current Location</label>
                            <div class="controls">
                                <select  name="country" id="countries">
                                    <option>none</option>
                                </select>
                                <select name="city" id="cities">
                                    <option>none</option>
                                </select>
                            </div>
                        </div>
                        <input class="submit" type="submit" name="submit" value="Sign Up" />
                    </form>

                    <form id="organization-data"  action="create-organization-profile" method="post">
                        <div class="inputpos">
                            <label  class="labelcontrols" >Name</label>
                            <input required class="controls" placeholder="Name" tittle="Enter Name"name="name" id="name">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" >Content</label>
                            <input class="controls" placeholder="About" tittle="Enter about organization"name="content" id="content">
                        </div>


                        <div class="inputpos">
                            <label  class="labelcontrols" >Phone</label>
                            <div class="controls">
                                <input class="controls" placeholder="Phone" tittle="Enter phone"name="phone" id="organization-phone">
                            </div>
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" >Industry</label>
                            <div class="controls">
                                <input class="controls" placeholder="Industry" tittle="Location" name="industry" id="organization-industry">
                            </div>
                        </div>
                        <div class="inputpos">
                            <label  class="labelcontrols" >Current Location</label>
                            <div class="controls">
                                <input class="controls" placeholder="Country" tittle="Location"name="country" id="organization-country">
                                <input class="controls" placeholder="City" tittle="Location"name="city" id="organization-city">
                            </div>
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" >Website</label>
                            <div class="controls">
                                <input class="controls" placeholder="Website" tittle="Website" name="website" id="website">
                            </div>
                        </div>
                        <input class="submit" type="submit" name="submit" value="Sign Up" />
                    </form>
            </div>

            <div class="mainboxright">
                <div class="no-account-yet">
                    <h3>
                       Have an Account?
                    </h3>
                    <p class="singup">
                        If you have a password, please <br>
                        <a href="/signin">sign in</a>.
                    </p>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="container">
</div>
</body>
</html>