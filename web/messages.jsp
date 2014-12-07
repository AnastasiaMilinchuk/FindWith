<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 11/29/14
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <header></header>
    <div class="upperbox">
        <div class="upperboxfill">

            <div class="upperboxadd">
                <span style="margin:0px 10px 0px 37px;color:#717171;"> |  </span>
                <a><span id="logout" class="accounts">
                Logout
            </span></a>
            </div>
            <div class="upperboxadd">
                <a href="settings.jsp">
                    <button name="choose" id="settings" class="accounts">
                        Settings
                    </button>
                </a>
            </div>

            <div class="upperboxadd">
                <a>
                    <button type="submit" value="contacts" name="choose" id="contacts" class="accounts">
                        Contacts
                    </button>
                </a>
            </div>
            <div class="upperboxadd">
                <a href="messages.jsp">
                    <button name="choose" id="messages" class="accounts">
                        Messages
                    </button>
                </a>
            </div>
            <div class="upperboxadd">
                <a href="profile.jsp">
                    <button id="profile" class="accounts">
                        Profile
                    </button>
                </a>
            </div>
        </div>
    </div>

    <nav>
        <button>Create message</button>
        <br>
        <button>Income</button>
        <br>
        <button>Outcome</button>
    </nav>
    <section>
        <input placeholder="To:"/>
        <br>
        <input placeholder="Subject:"/>
        <br>
        <textarea placeholder="Text"></textarea>
        <br>
        <br>
        <button>Send</button>
    </section>
    <footer></footer>
</body>
</html>
