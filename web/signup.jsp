<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 4/28/14
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    label{
        color: #414141;
        font-family: Arial, sans-serif;
    }
    h1 {
        font-size: 36px;
        line-height: 44px;
        letter-spacing: 1px;
        font-weight: normal;
        font-family: "sofiapro-light",Tahoma,sans-serif;
        color: #4a494b;;
    }
    h3{
        margin-bottom: 0px;
        font-family: Garamond,serif;
        letter-spacing: 2px;
        font-weight: normal;
        color: #414141;
        text-rendering: optimizelegibility;
    }
    .controls{
        padding-top: 5px;
        padding-bottom: 4px;
        padding-left: 6px;
        padding-right: 6px;
        float: left;
        width: 192px;
        height: 35px;
    }
    .labelcontrols{
        float: left;
        width: 160px;
        padding-top: 8px;
        text-align: right;
        padding-right: 20;
    }
    .inputpos{
        width: 459px;
        height: 50px;
    }
    .controls:focus{
            border: 1px solid #13af5d;
            box-shadow: 0 0px 5px #31be71;
            border-radius: 3px;

        }

    #login:focus{
        border: 1px solid #13af5d;
        box-shadow: 0 0px 5px #31be71;
        border-radius: 3px;

    }
    #password:focus{
        border: 1px solid #13af5d;
        box-shadow: 0 0 5px #31be71;
        border-radius: 3px;

    }

    .upperbox{
        height: 50px;
        background-color:#f9faf7;
        padding-top: 5px;
        border-bottom: 1px solid rgb(204, 204, 204);
    }
    .upperboxfill{
        width: 1000px;
        padding: 10px 30px;
        margin-right: auto;
        margin-left: auto;
    }
    .upperboxlogo{
        color: #4a494b;
        font-family: Garamond,serif;
        float: left;
        font-size: 12px;
        position: relative;
        top: 4px;
        left: 20px;
    }
    .upperboxadd{
        text-align: right;
        float:left
    }
    .accounts{
        color: #4a494b;
        font-family: Garamond,serif;
        font-size: 12px;
        position: relative;
        top: 1px;
    }
    .lowerbox{
        position:relative;
        background-color:#f9faf7;
        height:100%
    }
    .container{
        width: 1000px;
        padding: 10px 30px;
        margin-right: auto;
        margin-left: auto;
    }
    .mainbox{
        margin-top: 15px;
        -moz-box-sizing: border-box;
        box-shadow: 0px 1px 2px 1px rgba(0, 0, 0, 0.25);
        background-color: rgb(255, 255, 255);
        border-radius: 1px;
        padding: 30px 30px 48px;
        margin-left: -3.19149%;
        width: 106.383%;
        height: 70%;
    }
    .mainboxleft{
        float: left;
        min-height: 1px;
        width: 60%;
        margin-left: 20px;
        border-right: 1px solid rgb(217, 217, 217);
        padding-top:20px;
    }
    .mainboxright{
        float: left;
        min-height: 1px;
        width: 380px;
        padding: 20px;
        width: 30%;
    }
    .row{

    }
    .row1{
        border-bottom: 1px solid rgb(204, 204, 204);
    }
    .singin{
        float: left;
        min-height: 1px;
        margin-left: 20px;
        padding: 7px 0px;
        border-bottom: 1px solid rgb(217, 217, 217);
        margin-bottom: 0px;
    }
    .submit{
        background-color: #16612e;
        width: 100px;
        height: 30px;
        border: none;
        color: #fefffc;
        margin-left: 182;
    }
    .no-account-yet {
        padding-left: 20px;
    }
    .singup{
        font-family: Garamond,serif;
        font-weight: normal;
        color: #414141;
    }
    .block-control{
        margin-bottom: 21px;
    }
    a{
        cursor: pointer;
        text-decoration: none;
    }
    .logo{
        color: #4a494b;
        font-family: Garamond,serif;
    }
</style>

<html>
<head>
    <title></title>
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
                <form action="${pageContext.request.contextPath}/SignupSubmit" method="doPost">
                    <div class="inputpos">
                        <label class="labelcontrols" for="fullname">Full name</label>
                        <input id="fullname" class="controls"
                               type="text" data-form-correct="Nice to meet you!"
                               data-form-error="Please enter a real name" placeholder="Full Name"
                               data-form-schema="string+" data-form-required="data-form-required"
                               aria-describedby="coursera-signup-fullname-help" name="name" title="Full name"></input>
                    </div>

                    <div class="inputpos">
                        <label  class="labelcontrols" for="email">E-mail</label>
                        <input class="controls" placeholder="E-mail" tittle="Enter E-mail"name="email" id="email">
                    </div>

                    <div class="inputpos">
                        <label  class="labelcontrols" for="password">Password</label>
                        <input class="controls" name="password" placeholder="Password" title="Enter Password" type="password" id="password">
                    </div>
                    <div class="inputpos">
                        <label  class="labelcontrols" for="confirm_password">Confirm Password</label>
                        <input class="controls" placeholder="Confirm Password" title="Confirm Password" name="confirm_password" type="password" id="confirm_password">
                    </div>
                    <br>
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