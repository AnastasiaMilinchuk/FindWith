<%@ page import="findwith.Entities.Person" %>
<%@ page import="findwith.DAORealizations.MsgDAOImpl" %>
<%@ page import="findwith.Entities.Message" %>
<%@ page import="java.util.List" %>
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

<div class="inbox-outbox-msg">

<%
    MsgDAOImpl msgDAO = new MsgDAOImpl();
    List<Message> outBoxMessages = msgDAO.getOutboxMessagesForUser(((Person) request.getSession().getAttribute("person")).getId());
    out.println("<section class=\"ac-container\">");
    for(int i = 0;i<outBoxMessages.size();i++){
        out.print("  <div>\n" +
                "            <input id=\"ac-"+(i)+"\" name=\"accordion-1\" type=\"checkbox\"  />\n" +
                "            <label style='width: auto;' for=\"ac-"+(i)+"\"><div style='background-color: lavender; width: 90%; padding-left: 1%;' >To:  "+msgDAO.getNameById(outBoxMessages.get(i).getToEmail()) +"</div> <div style='width: 85%; padding-left: 1%; font-size: 14px;' > Subject:  "+outBoxMessages.get(i).getSubject()+"</div></label>\n" +
                "            <article>\n" +
                "                <p>"+outBoxMessages.get(i).getText()+"</p>\n" +
                "            </article>\n" +
                "        </div>");
    }
    out.println("</section>");
%>

</div>


    <footer>

    </footer>
</body>
</html>
