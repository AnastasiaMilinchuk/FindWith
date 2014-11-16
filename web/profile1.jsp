<%--
  Created by IntelliJ IDEA.
  User: milinchuk
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
        <div class="upperboxadd">
            <span style="margin:0px 10px 0px 37px;color:#717171;"> |  </span>
            <a><span class="accounts">
                Logout
            </span></a>
        </div>
        <div class="upperboxadd">
            <a>
            <span class="accounts">
               Settings
            </span>
                </a>
        </div>

        <div class="upperboxadd">
            <a>
            <span class="accounts">
                Contacts
            </span>
                </a>
        </div>
        <div class="upperboxadd">
            <a>
            <span class="accounts">
                Messages
            </span>
                </a>
        </div>
        <div class="upperboxadd">
            <a>
            <span class="accounts">
                Profile
            </span>
                </a>
        </div>



    </div>
</div>


<div class="lowerbox">
    <div class="container">
        <div class="mainbox">
            <div class="avatar">
                <img align="middle" class="profile-photo" src="resources/profile.png">
            </div>
            <div class="description">
                <h1><%= request.getSession().getAttribute("name") %></h1>
                <div class="inform-question">
                    <p><label>DB:</label></p>

                    <p><label>E-mail:</label></p>

                    <p><label>Phone:</label></p>

                    <p><label>Education:</label></p>

                </div>
                <div class="inform-answer">
                    <p><label><%= request.getSession().getAttribute("birthday")%></label></p>

                    <p><label><%= request.getSession().getAttribute("email")%></label></p>

                    <p><label><%= request.getSession().getAttribute("phone")%></label></p>

                    <p><label><%= request.getSession().getAttribute("education")%></label></p>
                </div>
                <%--<button class="change">Change</button>--%>

            </div>
            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">
                <form action="${pageContext.request.contextPath}/addCourse" method="post">
                    <div class="add-skills">
                        <img class="add" src="resources/add-course.png">
                        <div class="add-skills-data">
                            <label>Course Provider:</label><br>
                            <input name="provider" class="input-user-data" required placeholder="Coursera, Udacity, etc">
                        </div>
                        <div class="add-skills-data">
                            <label>Name of course:</label><br>
                            <input name="course" class="input-user-data" required placeholder="Introduction in algorithms, etc.">
                        </div>
                        <div class="add-skills-data">
                            <label>Progress, %:</label><br>
                            <input name="progress" class="input-user-data" required placeholder="68%">
                        </div>
                        <button class="submit">Add</button>
                    </div>
                </form>
            </div>

            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">
                <form action="${pageContext.request.contextPath}/addCourse" method="post">
                    <div class="add-skills">
                        <img class="add" src="resources/add-course.png">
                        <div class="add-skills-data">
                            <label>Course Provider:</label><br>
                            <input name="provider" class="input-user-data" required placeholder="Coursera, Udacity, etc">
                        </div>
                        <div class="add-skills-data">
                            <label>Name of course:</label><br>
                            <input name="course" class="input-user-data" required placeholder="Introduction in algorithms, etc.">
                        </div>
                        <div class="add-skills-data">
                            <label>Progress, %:</label><br>
                            <input name="progress" class="input-user-data" required placeholder="68%">
                        </div>
                        <button class="submit">Add</button>
                    </div>
                </form>
            </div>

            <div class="article">
                <h2>Works</h2>
            </div>

            <form action="${pageContext.request.contextPath}/addWork" method="post">
                <div class="works">
                    <img class="add" src="resources/add-course.png">
                    <div class="add-skills-data">
                        <label>Reference:</label><br>
                        <input  name="reference" class="input-user-data" required placeholder="http://github.com/io4556">
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