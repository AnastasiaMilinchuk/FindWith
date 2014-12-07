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
    <script src="javascript/jquery.js"></script>
    <script src="javascript/msg.js"></script>
</head>
<body>
    <header></header>
    <jsp:include page="/upperBox.jsp" />
     <div>
         <div id="radio">
             <input type="radio" id="radio1" name="radio" value='1' checked="checked" /><label for="radio1">New Message</label>
             <input type="radio" id="radio2" name="radio" value='2'  /><label for="radio2">Income</label>
             <input type="radio" id="radio3" name="radio" value='3' /><label for="radio3">Outcome</label>
         </div>

    <div id="newDiv" style="display: block">
        <jsp:include page="/msg/new_message.jsp"/>
    </div>
    <div id="inboxDiv" style="display: none">
        <jsp:include page="/msg/inbox.jsp"/>
    </div>

    <div id="outboxDiv" style="display: none">
             <jsp:include page="/msg/outbox.jsp"/>
    </div>

    </div>
    <footer></footer>
</body>
</html>
