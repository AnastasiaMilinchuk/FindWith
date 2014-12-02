<%@ page import="zopa.Entities.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="zopa.Entities.InnerEntities.Course" %>
<%@ page import="zopa.Entities.InnerEntities.Project" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
<div class="upperbox">
    <div class="upperboxfill">

    <form action="menu?choose=" method="get">
        <div class="upperboxadd">
            <span style="margin:0px 10px 0px 37px;color:#717171;"> |  </span>
            <a><span id="logout" class="accounts">
                Logout
            </span></a>
        </div>
        <div class="upperboxadd">
            <a>
            <button name="choose" id="settings" class="accounts">
               Settings
            </button>
                </a>
        </div>

        <div class="upperboxadd">
            <a>
            <button type="submit" value="contacts" name="choose" id="contacts" class="accounts">
                Contacts
            </button>
                </a>
        </div>
        <div class="upperboxadd">
            <a href="messages.jsp">
            <button name="choose" id="messages" class="accounts">
                Messages
            </button>
                </a>
        </div>
        <div class="upperboxadd">
            <a href="profile.jsp">
            <button id="profile" class="accounts">
                Profile
            </button>
                </a>
        </div>
    </form>
    </div>
</div>


<div class="lowerbox">
    <div class="container">
        <div class="mainbox">
            <div class="avatar">
                <img align="middle" class="profile-photo" src="resources/profile.png">
            </div>
            <div class="description">
                <input ><%= ((Person)request.getSession().getAttribute("person")).getFirstname() +  " " + ((Person)request.getSession().getAttribute("person")).getLastname() %></h1>
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
                <h2>Courses</h2>
            </div>

            <div class="skills">
                <%
                    if(((Person)request.getSession().getAttribute("person")).getCourses() != null){
                        for(Course course: ((Person)request.getSession().getAttribute("person")).getCourses())
                        { %>
                <tr><td><%=course.getProvider()%></tr>
                <td><%=course.getName()%></td></tr><%
                    }
                }
            %>
                    <div id="skills" class="add-skills">
                    </div>
            </div>

            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">

                    <div class="add-skills">
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getSkills() != null){
                                for(String skill: ((Person)request.getSession().getAttribute("person")).getSkills())
                                { %>
                                     <tr><td><%=skill%></td></tr><%
                                 }
                            }
                        %>
                    </div>

            </div>

            <div class="article">
                <h2>Projects</h2>
            </div>


                <div class="works">
                    <%
                        if(((Person)request.getSession().getAttribute("person")).getProjects() != null){
                            for(Project project: ((Person)request.getSession().getAttribute("person")).getProjects())
                            { %>

                    <img class="add" src="resources/icon_green.png">

                    <div class="add-skills-data">
                        <a href="http://<%=project.getReference()%>" style="color: royalblue;"><%=project.getReference()%></a><br>

                    </div>
                    <div class="add-skills-data">
                        <label><%=project.getDescription()%></label><br>

                    </div>
                    <%
                            }
                        } %>
                </div>

            <div class="article">
                <h2>Followings</h2>
            </div>


            <div class="works">
                <%
                    if(((Person)request.getSession().getAttribute("person")).getFollowings() != null){
                        for(String following: ((Person)request.getSession().getAttribute("person")).getFollowings())
                        { %>

                <img class="add" src="resources/Company-Icon.png">
                <div class="add-skills-data">
                    <label><%=following%></label><br>
                </div>
                <%
                        }
                    } %>
            </div>

        </div>
    </div>

</div>
<div class="container">
</div>
</body>
</html>
