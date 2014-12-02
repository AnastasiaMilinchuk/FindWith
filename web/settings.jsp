<%@ page import="zopa.Entities.Person" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="zopa.Entities.InnerEntities.Course" %>
<%@ page import="zopa.Entities.InnerEntities.Project" %>
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
    <script src="resources/jquery.js"></script>
    <script src="resources/update-page.js"></script>
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
                <input name="qwe"/>
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
                <input  value="<%= ((Person)request.getSession().getAttribute("person")).getFirstname() +  " " + ((Person)request.getSession().getAttribute("person")).getLastname() %>"/>
               <br>
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
                    <p><input value="<%=ft.format(date)%>"></p>

                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getEmail()%>"></p>

                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getPhone()%>"></p>

                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getIndustry() %>"></p>

                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getUniversity() %>">
                        <input value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getFaculty() %>">
                        <input value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getGraduateYear() %>"></p>

                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getLocation().getCountry() %>"></p>
                    <p><input value="<%= ((Person)request.getSession().getAttribute("person")).getLocation().getCity() %>"></p>
                    <button class="submit">Update</button>
                </div>
                <%--<button class="change">Change</button>--%>

            </div>
            <div class="article">
                <h2>Courses</h2>
            </div>

            <div class="skills">
                <form action="addCourse" method="post">
                    <%
                        if(((Person)request.getSession().getAttribute("person")).getCourses() != null){
                            for(Course course: ((Person)request.getSession().getAttribute("person")).getCourses())
                            { %>
                    <tr><td><%=course.getProvider()%></tr>
                    <td><%=course.getName()%></td></tr><%
                        }
                    }
                %>
                    <div class="add-skills">
                        <img class="add" src="resources/add-course.png">
                        <div class="add-skills-data">
                            <label>Course Provider:</label><br>
                            <input name="provider" class="input-person-data" required placeholder="Coursera, Udacity, etc">
                        </div>
                        <div class="add-skills-data">
                            <label>Name of course:</label><br>
                            <input name="course" class="input-person-data" required placeholder="Introduction in algorithms, etc.">
                        </div>

                        <button class="submit">Add</button>
                    </div>
                </form>
            </div>

            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">
                <form action="${pageContext.request.contextPath}/addSkill" method="post">
                    <%
                        if(((Person)request.getSession().getAttribute("person")).getSkills() != null){
                            for(String skill: ((Person)request.getSession().getAttribute("person")).getSkills())
                            { %>
                    <tr><td><%=skill%></td></tr><%
                        }
                    }
                %>
                    <div class="add-skills">
                        <img class="add" src="resources/add-course.png">
                        <div class="add-skills-data">
                            <label>Skill:</label><br>
                            <input name="skill" class="input-person-data" required placeholder="Java SE, Algorithms, etc.">
                        </div>
                        <button class="submit">Add</button>
                    </div>
                </form>
            </div>

            <div class="article">
                <h2>Works</h2>
            </div>

            <form action="${pageContext.request.contextPath}/addWork" method="post">
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
                <div class="works">
                    <img class="add" src="resources/add-course.png">
                    <div class="add-skills-data">
                        <label>Reference:</label><br>
                        <input  name="reference" class="input-person-data" required placeholder="http://github.com/io4556">
                    </div>
                    <div class="add-skills-data">
                        <label>Description:</label><br>
                        <textarea name="description" cols="67" rows="3"></textarea>
                    </div>
                    <button class="submit">Add</button>
                </div>
            </form>
        </div>
    </div>

</div>
<div class="container">
</div>
</body>
</html>
