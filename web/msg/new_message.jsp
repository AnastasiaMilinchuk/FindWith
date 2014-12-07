<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 11/28/14
  Time: 10:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<br/>
<br/>
<form id="new_message" action="/sendMessage" method="post">
       <label>To:</label>
       <input type="text" name="msgTo"/><br>
       <label>Subject:</label>
       <input type="text" name="msgSubject"/>
       <label>Text:</label>
       <input type="text" name="msgText"/>
       <input type="submit" value="Send">
    <form/>

       <footer>
    </footer>
</body>
</html>
