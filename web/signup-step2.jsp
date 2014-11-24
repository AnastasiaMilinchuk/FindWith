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
    <link type="text/css" rel="stylesheet" href="resources/signup.css">
    <script  type="text/javascript" src="resources/jquery.js">
    </script>
    <script  type="text/javascript">
        $(function(){
            $('#user').click(function(){
                $('#organization-data').hide();
                $('#user-data').show();
            });
        });
        $(function(){
            $('#organization').click(function(){
                $('#user-data').hide();
                $('#organization-data').show();

            });
        });
        $(document).ready(function() {
            $('#organization-data').hide();

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
                        <input id="user" class="controls" name="face" value="user"
                               type="radio" checked>

                    </div>

                    <div class="inputpos">
                        <label class="labelcontrols" >Organization</label>
                        <input id="organization" class="controls" name="face" value="organization"
                               type="radio">
                    </div>


                    <form id="user-data" action="create-user-profile" method="post">
                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">Birthday</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="birthday" id="b-day">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">Phone</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="phone" id="phone">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">E-mail</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="email" id="email">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">Education</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="education" id="education">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">Current Location</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="location" id="location">
                        </div>
                        <input class="submit" type="submit" name="submit" value="Sign Up" />
                    </form>

                    <form id="organization-data"  action="create-organization-profile" method="post">
                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">Name</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="organization-name" id="organization-name">
                        </div>

                        <div class="inputpos">
                            <label  class="labelcontrols" for="email">About</label>
                            <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="about" id="organization-about">
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