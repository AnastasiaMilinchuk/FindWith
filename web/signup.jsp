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
                    <h1>Sign Up</h1>
                </div>
            </div>
            <div class="mainboxleft">
                <form action="${pageContext.request.contextPath}/signup-step2" method="post">
                    <div class="inputpos">
                        <label class="labelcontrols" >First name</label>
                        <input required id="firstname" class="controls"
                               type="text" data-form-correct="Nice to meet you!"
                               data-form-error="Please enter a real name" placeholder="First name"
                               data-form-schema="string+" data-form-required="data-form-required"
                               aria-describedby="coursera-signup-fullname-help" name="firstname" title="First name">
                    </div>
                    <div class="inputpos">
                        <label class="labelcontrols" >Second name</label>
                        <input required id="secondname" class="controls"
                               type="text" data-form-correct="Nice to meet you!"
                               data-form-error="Please enter a real name" placeholder="Second name"
                               data-form-schema="string+" data-form-required="data-form-required"
                               aria-describedby="coursera-signup-fullname-help" name="secondname" title="Second name">
                    </div>

                    <div class="inputpos">
                        <label  class="labelcontrols" for="email">E-mail</label>
                        <input class="controls" required placeholder="E-mail" tittle="Enter E-mail"name="email" id="email">
                    </div>

                    <div class="inputpos">
                        <label  class="labelcontrols" for="password">Password</label>
                        <input required class="controls" name="password" placeholder="Password" title="Enter Password" type="password" id="password">
                    </div>
                    <div class="inputpos">
                        <label  class="labelcontrols" for="confirm_password">Confirm Password</label>
                        <input required class="controls" placeholder="Confirm Password" title="Confirm Password" name="confirm_password" type="password" id="confirm_password">
                    </div>
                    <br>
                    <input class="submit" type="submit" name="submit" value="Step 2" />
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