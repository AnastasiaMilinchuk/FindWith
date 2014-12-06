<%@ page import="findwith.Entities.Organization" %>
<%--
  Created by IntelliJ IDEA.
  User: milinchuk
  Date: 11/29/14
  Time: 6:59 PM
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
                <h1><%= ((Organization)request.getSession().getAttribute("organization")).getName() %></h1>
                <div class="inform-question">

                    <p><label>E-mail:</label></p>

                    <p><label>Phone:</label></p>

                    <p><label>Industry:</label></p>

                    <p><label>Location:</label></p>

                </div>
                <div class="inform-answer">
                    <p><label><%= ((Organization)request.getSession().getAttribute("organization")).getEmail()%></label></p>

                    <p><label><%= ((Organization)request.getSession().getAttribute("organization")).getPhone()%></label></p>

                    <p><label><%= ((Organization)request.getSession().getAttribute("organization")).getIndustry() %></label></p>

                    <p><label><%= ((Organization)request.getSession().getAttribute("organization")).getLocation().getCountry() %></label></p>
                    <p><label><%= ((Organization)request.getSession().getAttribute("organization")).getLocation().getCity() %></label></p>

                </div>
                <%--<button class="change">Change</button>--%>

            </div>
            <div class="article">
                <h2>Courses</h2>
            </div>

            <div class="skills">

            </div>

            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">

            </div>

            <div class="article">
                <h2>Works</h2>
            </div>
        </div>
    </div>

</div>
<div class="container">
</div>
</body>
</html>
