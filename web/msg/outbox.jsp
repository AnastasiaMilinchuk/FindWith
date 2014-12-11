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

<div class="skills">

<%
    MsgDAOImpl msgDAO = new MsgDAOImpl();
    List<Message> outBoxMessages = msgDAO.getOutboxMessagesForUser(((Person) request.getSession().getAttribute("person")).getEmail());
    out.println("<section class=\"ac-container\">");
    for(int i = 0;i<outBoxMessages.size();i++){
        out.print("  <div>\n" +
                "            <input id=\"aco-"+(i)+"\" name=\"accordion-1\" type=\"checkbox\"  />\n" +
                "            <label for=\"aco-"+(i)+"\"> To:"+outBoxMessages.get(i).getToEmail()+":  "+outBoxMessages.get(i).getSubject()+"</label>\n" +
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
