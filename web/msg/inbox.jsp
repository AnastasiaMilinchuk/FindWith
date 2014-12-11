<%@ page import="findwith.DAORealizations.MsgDAOImpl" %>
<%@ page import="findwith.Entities.Message" %>
<%@ page import="findwith.Entities.Person" %>
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
            List<Message> inBoxMessages = msgDAO.getInboxMessagesForUser(((Person) request.getSession().getAttribute("person")).getEmail());
            out.println("<section class=\"ac-container\">");
            for(int i = 0;i< inBoxMessages.size();i++){
                out.print("  <div>\n" +
                        "            <input id=\"ac-"+(i)+"\" name=\"accordion-1\" type=\"checkbox\"  />\n" +
                        "            <label for=\"ac-"+(i)+"\"> From:"+ inBoxMessages.get(i).getFromEmail()+":  "+inBoxMessages.get(i).getSubject()+" </label>\n" +
                        "            <article>\n" +
                        "                <p>"+ inBoxMessages.get(i).getText()+"</p>\n" +
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
