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
    <div class="text-input-container">
       <label class="new-message-label">To:</label>
       <input type="text" name="msgTo" class="text-input"/>
    </div>
    <div class="text-input-container">
       <label class="new-message-label">Subject:</label>
       <input type="text" name="msgSubject" class="text-input"/>
    </div>
    <div class="text-input-container">
       <label class="new-message-label">Text:</label>
       <input type="text" name="msgText"class="text-input"/>
    </div>
    <div>
       <input type="submit" class="penal-button" value="Send"/>
    </div>
    </form>

       <footer>
    </footer>
</body>
</html>
