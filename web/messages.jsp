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
    <link type="text/css" rel="stylesheet" href="css/messages.css">
    <script src="javascript/jquery.js"></script>
    <script src="javascript/msg.js"></script>
</head>
<body>
    <header></header>
    <jsp:include page="/upperBox.jsp" />
    <section class="main">
             <div class="message-layout" id="radio">
                 <input type="radio" id="radio1" name="radio" value='1' checked="checked" class="message-radio" /><label for="radio1" class="radio-label">New Message</label><br>
                 <input type="radio" id="radio2" name="radio" value='2'  class="message-radio" /><div class="msg"><img class="inbox-img" src="resources/inbox1.png"><label for="radio2" class="radio">Income</label></div>
                 <input type="radio" id="radio3" name="radio" value='3' class="message-radio" /><div class="msg"><img class="inbox-img"  src="resources/Outbox.png"> <label for="radio3" class="radio">Outcome</label></div>
             </div>

        <div id="newDiv" class="new-message-layout">
            <jsp:include page="/msg/new_message.jsp"/>
        </div>

        <div id="inboxDiv" style="display: none">
            <jsp:include page="/msg/inbox.jsp"/>
        </div>

        <div id="outboxDiv" style="display: none">
                 <jsp:include page="/msg/outbox.jsp"/>
        </div>

    </section>
    <footer></footer>
</body>
</html>
