<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 4/29/14
  Time: 9:28 PM
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
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 6px;
        padding-right: 6px;
        width: 192px;
        height: 35px;
    }
    .inputpos{
        width: 100%;
        height: 50px;
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
        width: 65%;
        margin-left: 20px;
        border-right: 1px solid rgb(217, 217, 217);
        padding-top:20px;
    }
    .mainboxright{
        float: left;
        min-height: 1px;
        width: 26%;
        padding: 20px;
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
        width: 130px;
        height: 40px;
        border: none;
        color: #fefffc;
    }
    .no-account-yet {
        padding-left: 20px;
    }
    .singup{
        font-family: Garamond,serif;
        font-weight: normal;
        color: #414141;
    }
    .labelcontrols{
        float: left;
        padding-top: 7px;
        text-align: center;
        font-family: "sofiapro-light",Arial,sans-serif;
        letter-spacing: 1px;
        width: 150px;
        height: 26px;
        background-color: #e1ffd4;
    }
    .labeltext{
        float: left;
        width: 350px;
        padding-top: 8px;
        text-align: left;
        padding-right: 20px;
        padding-left: 20px;
        letter-spacing: 1px;
        border: none;
    }
    a{
        cursor: pointer;
        text-decoration: none;
    }
    .describe{
        width: 120px;
        height: 30px;
        background-color: #b2f6aa;
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
                    <h1>Profile</h1>
                </div>
            </div>
            <div class="mainboxleft">
                <div class="inputpos">
                    <label class="labelcontrols">First name:</label>
                    <input class="labeltext" name="firstName" value="<%= request.getSession().getAttribute("firstName") %>">
                </div>
                <div class="inputpos">
                    <label class="labelcontrols">Second name:</label>
                    <input class="labeltext" name="secondName" value="<%= request.getSession().getAttribute("secondName") %>">
                </div>

                    <%--<label class="labelcontrols">DB:</label>--%>
                    <%--<input class="labeltext" name="name" value="<%= request.getSession().getAttribute("bday") %>">--%>
                <div class="inputpos">
                    <label class="labelcontrols">e-mail:</label>
                    <input class="labeltext" name="email" value="<%= request.getParameter("email") %>">
                    <%--<label class="labelcontrols">phone:</label>--%>
                    <%--<input class="labeltext" name="email" value="<%= request.getParameter("phone") %>">--%>

                    <%--<label class="labelcontrols">Hobbies:</label>--%>
                    <%--<input class="labeltext" name="email" value="<%= request.getParameter("hobbies") %>">--%>

                </div>
                <div class="inputpos">
                    <label class="labelcontrols">Your Password:</label>
                    <input class="labeltext" name="password" value="<%= request.getParameter("password") %>">
                    <br>
                </div>

                <br><br>
                <form action="${pageContext.request.contextPath}/Profile" method="post">

                    <input class="submit" type="submit" name="submit" value="Delete Profile" />
                </form>
            </div>
            <div class="mainboxright">
                <div class="no-account-yet">

                </div>
            </div>
        </div>
    </div>

</div>
<div class="container">
</div>
</body>
</html>
