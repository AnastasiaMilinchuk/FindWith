<%@ page import="findwith.Entities.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="findwith.Entities.InnerEntities.Course" %>
<%@ page import="findwith.Entities.InnerEntities.Project" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="findwith.Entities.Contact" %>
<%--
  Created by IntelliJ IDEA.
  Person: milinchuk
  Date: 11/9/14
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link type="text/css" rel="stylesheet" href="resources/main.css">
</head>
<body>
<jsp:include page="upperBox.jsp"/>

<div class="lowerbox">
    <div class="container">
        <div class="mainbox">
            <div class="avatar">
                <img align="middle" class="profile-photo" src="resources/profile.png">
            </div>
            <div class="description">
                <h1><%= ((Person)request.getSession().getAttribute("person")).getFirstname() +  " " + ((Person)request.getSession().getAttribute("person")).getLastname() %></h1>
                <div class="inform-question">
                    <p><label>DB:</label></p>

                    <p><label>E-mail:</label></p>

                    <p><label>Phone:</label></p>

                    <p><label>Industry:</label></p>

                    <p><label>Education:</label></p>

                    <p><label>Location:</label></p>

                </div>
                <div class="inform-answer">
                    <% Date date = ((Person)request.getSession().getAttribute("person")).getBirthday();
                        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy");
                    %>
                    <p><label><%=ft.format(date)%></label></p>
                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getEmail()%></label></p>

                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getPhone()%></label></p>

                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getIndustry() %></label></p>

                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getEducation().getUniversity() %></label>
                    <label><%= ((Person)request.getSession().getAttribute("person")).getEducation().getFaculty() %></label>
                    <label><%= ((Person)request.getSession().getAttribute("person")).getEducation().getGraduateYear() %></label></p>

                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getLocation().getCountry() %></label></p>
                    <p><label><%= ((Person)request.getSession().getAttribute("person")).getLocation().getCity() %></label></p>

                </div>
                <%--<button class="change">Change</button>--%>

            </div>
            <div class="article">


            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">

                    <div class="add-skills">
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getSkills() != null){
                                for(String skill: ((Person)request.getSession().getAttribute("person")).getSkills())
                                { %>
                        <span style="display: inline-block;"><label class="stiker"></label><label class="skill"><%=skill%></label></span><%

                                 }
                            }
                        %>
                    </div>

            </div>

            <div class="article">
                <h2>Projects</h2>
            </div>


                <div class="works">
                    <table>
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getProjects() != null){
                                for(Project project: ((Person)request.getSession().getAttribute("person")).getProjects())
                                { %>

                        <tr>
                            <td><img class="add" src="resources/icon_green.png"></td>
                            <td>
                                <div class="add-skills-data">
                                    <a href="http://<%=project.getReference()%>" style="color: royalblue;"><%=project.getReference()%></a><br>

                                </div>
                            </td>
                            <td>
                                <div class="add-skills-data">
                                    <label><%=project.getDescription()%></label><br>

                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            } %>

                    </table>
                </div>


                <div class="article">
                    <h2>Certificates</h2>
                </div>

                <div class="skills">
                    <table>
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getCourses() != null){
                                for(Course course: ((Person)request.getSession().getAttribute("person")).getCourses())
                                { %>
                        <tr><td><img class="photo" src="resources/<%=course.getProvider()%>.png"></td>
                            <td><h3 style="color: black !important; font: bold;"><%=course.getName()%></h3><br><label style="font-size: 16px;"><%=course.getProvider()%></label><br><label>2013</label></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                    <div id="skills" class="add-skills">
                    </div>
                </div>



            <div class="article">
                <h2>Followings</h2>
            </div>
            <div class="works">
                <table>
                    <%
                        if(((Person)request.getSession().getAttribute("person")).getFollowings() != null){
                            for(String following: ((Person)request.getSession().getAttribute("person")).getFollowings())
                            { %>
                    <tr>
                    <td>
                        <img class="add" src="resources/Company-Icon.png">
                    </td>
                    <td>
                        <div class="add-skills-data">
                            <label><%=following%></label><br>
                        </div>
                    </td>
                    </tr>
                    <%
                            }
                        } %>
                </table>
            </div>


            <div class="article">
                <h2>Contacts</h2>
            </div>
            <div class="works">
                    <table>
                        <%
                            if(((request.getSession().getAttribute("person"))) != null){
                                if(((Person)(request.getSession().getAttribute("person"))).getContactProfiles() != null)
                                for(Contact contact: (List<Contact>)((Person)request.getSession().getAttribute("person")).getContactProfiles())
                                { %>
                        <tr>
                            <td>
                           <div class="card">
                                    <div class="card-photo">
                                        <img class="photo" src="<%=contact.getPhoto()%>">
                                    </div>

                                    <div class="card-info" >
                                       <div class="info">
                                           <a href="profile?id=<%=contact.get_id()%>">
                                               <h3>
                                                   <%=(contact.getFirstname() + " " + contact.getLastname())%>
                                                </h3>
                                           </a>
                                           <br>
                                            <label><%=contact.getEmail()%></label>
                                       </div>
                                    </div>

                                    <div class="delete-contact">
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
    </div>
</div>
</div>
</body>
</html>
