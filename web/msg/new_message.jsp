<%@ page import="findwith.Entities.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="findwith.Entities.Contact" %>
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

<form id="new_message" action="/sendMessage" method="post">
        <div class="contcts">
            <%--<div >--%>
                <%--<label class="">Search:</label><br>--%>
                <%--<input  type="text" class=""/>--%>
            <%--</div>--%>
            <div class="message-contacts">
                <label class="choose-friend">Choose friend</label>
                <table>
                    <%
                        if(((request.getSession().getAttribute("person"))) != null){
                            if(((Person)(request.getSession().getAttribute("person"))).getContactProfiles() != null)
                                for(Contact contact: (List<Contact>)((Person)request.getSession().getAttribute("person")).getContactProfiles())
                                { %>
                    <tr>
                        <td>
                            <div class="card-people">
                                <div class="card-photo">
                                    <a href="profile?id=<%=contact.get_id()%>">
                                            <img class="photo-people" src="<%=contact.getPhoto()%>">
                                        </a>
                                </div>

                                <div class="card-info" >
                                    <div class="">

                                            <h3 class="contact-name">
                                                <%=(contact.getFirstname() + " " + contact.getLastname())%>
                                            </h3>

                                    </div>
                                </div>
                            </div>

                        </td>
                    </tr>
                    <%
                                }
                        }
                    %>
                </table>
            </div>
       </div>
        <div class="send-msg">
            <div class="text-input-container">
               <label class="new-message-label">To:</label>
               <input  type="text" name="msgTo" class="text-input"/>
            </div>
            <div class="text-input-container">
               <label class="new-message-label">Subject:</label>
               <input type="text" name="msgSubject" class="text-input"/>
            </div>
            <div class="text-input-container">
               <label class="new-message-label">Text:</label>
               <textarea class="textarea-msg" type="text" name="msgText"></textarea>
            </div>
            <div>
               <input type="submit" class="penal-button" value="Send"/>
            </div>

         </div>
    </div>
    </form>

       <footer>
    </footer>
</body>
</html>
