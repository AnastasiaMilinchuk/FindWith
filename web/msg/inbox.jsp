<%@ page import="findwith.DAORealizations.MsgDAOImpl" %>
<%@ page import="findwith.Entities.Message" %>
<%@ page import="findwith.Entities.Person" %>
<%@ page import="java.util.List" %>
new_message.jsp<%--
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

<div class="skills">

    <div class="add-skills">
        <%
            MsgDAOImpl msgDAO = new MsgDAOImpl();
            msgDAO.getOutboxMessagesForUser(((Person)request.getSession().getAttribute("person")).getEmail());
            List<Message> outBoxMessages = msgDAO.getOutboxMessagesForUser(((Person) request.getSession().getAttribute("person")).getEmail());
            out.print(outBoxMessages);
            out.print(outBoxMessages.size());


            for(Message msg: outBoxMessages)
            { %>
        <span style="display: inline-block;"><label class="stiker"></label><label class="skill"><%=msg%></label></span><%

        }
    %>
    </div>

</div>


    <footer>

    </footer>
</body>
</html>
