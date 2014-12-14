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

<div class="inbox-outbox-msg">

        <%
            MsgDAOImpl msgDAO = new MsgDAOImpl();
            List<Message> inBoxMessages = msgDAO.getInboxMessagesForUser(((Person) request.getSession().getAttribute("person")).getId());
            out.println("<section class=\"ac-container\">");
            for(int i = 0;i< inBoxMessages.size();i++){
                out.print("  <div>\n" +
                        "            <input id=\"aco-"+(i)+"\" name=\"accordion-1\" type=\"checkbox\"  />\n" +
                        "            <label style='width: auto;' for=\"aco-"+(i)+"\"><div style='background-color: lavender; width: 90%; padding-left: 1%;' >From:  "+msgDAO.getNameById(inBoxMessages.get(i).getFromEmail()) +"</div> <div style='width: 85%; padding-left: 1%; font-size: 14px;' > Subject:  "+inBoxMessages.get(i).getSubject()+"</div></label>\n" +
                        "            <article>\n" +
                        "                <p>"+inBoxMessages.get(i).getText()+"</p>\n" +
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
