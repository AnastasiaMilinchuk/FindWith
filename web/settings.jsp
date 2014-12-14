<%@ page import="findwith.Entities.Person" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="findwith.Entities.InnerEntities.Course" %>
<%@ page import="findwith.Entities.InnerEntities.Project" %>
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
    <script src="javascript/jquery.js"></script>
    <script src="javascript/delete-skill.js"></script>
    <script src="javascript/date.js"></script>
    <script src="javascript/update-page.js"></script>
    <script src="javascript/industry.js"></script>
    <script src="javascript/university.js"></script>
    <script src="javascript/faculty.js"></script>
    <script src="javascript/country.js"></script>
    <script src="javascript/city.js"></script>
    <script src="javascript/AddSkill.js"></script>
    <script src="javascript/delete-contact.js"></script>
    <script src="javascript/delete-following.js"></script>
    <script src="javascript/delete-project.js"></script>

    <script>
        $(document).ready(function() {
            for(var i = 1940; i <= 2020; i++){
                $("#graduateYear").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            };

            for(var i = 2000; i <= 2014; i++){
                $("#course-year").append(' <option selected value="'+i+'">'+i+'</option>'); //add input box
            };

        });


    </script>
</head>
<body>
<jsp:include page="upperBox.jsp"/>

<div class="lowerbox">
    <div class="container">
        <div class="mainbox">
        <div class="block">
                    <div class="avatar">
                        <img align="middle" class="profile-photo" src="resources/profile.png">
                    </div>
                    <div class="description">
                        <h1><%= ((Person)request.getSession().getAttribute("person")).getFirstname() +  " " + ((Person)request.getSession().getAttribute("person")).getLastname() %></h1>
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
                            <%--<p><input value="<%=ft.format(date)%>"></p>--%>
                            <select name="day" id="bday" >
                            </select>
                            <select name="month" id="bmonth">
                            </select>
                            <select name="year" id="byear">
                            </select>

                            <p><input class="update-data" id="email" value="<%= ((Person)request.getSession().getAttribute("person")).getEmail()%>"></p>

                            <p><input class="update-data" id="phone" value="<%= ((Person)request.getSession().getAttribute("person")).getPhone()%>"></p>

                            <p><input class="update-data" id="industry" list="industries" value="<%= ((Person)request.getSession().getAttribute("person")).getIndustry() %>">
                                <datalist id="industries">
                                </datalist></p>

                            <p><input class="update-data" id="university" list="universities" value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getUniversity() %>">
                                    <datalist id="universities">
                                    </datalist>
                                <input class="update-data" id="faculty" list="faculties" value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getFaculty() %>">
                                    <datalist id="faculties">
                                    </datalist>
                                <select name="year" id="graduateYear" <%--value="<%= ((Person)request.getSession().getAttribute("person")).getEducation().getGraduateYear() %>"--%>></select></p>

                            <p><input id="country" list="countries" value="<%= ((Person)request.getSession().getAttribute("person")).getLocation().getCountry() %>"></p>
                                <datalist id="countries">
                                </datalist>
                            <p><input id="city" list="cities" value="<%= ((Person)request.getSession().getAttribute("person")).getLocation().getCity() %>"></p>
                                <datalist id="cities">
                                </datalist>
                            <button class="submit" id="change-profile">Update</button>
                        </div>
                        <%--<button class="change">Change</button>--%>

                    </div>
        </div>

        <div class="block">
            <div class="article">
                <h2>Certifications</h2>
            </div>

            <div class="skills">
                <form action="addCourse" method="post">
                    <table>
                            <%
                                if(((Person)request.getSession().getAttribute("person")).getCourses() != null){
                                    for(Course course: ((Person)request.getSession().getAttribute("person")).getCourses())
                                    { %>
                            <tr><td><img class="photo" src="resources/<%=course.getProvider()%>.png"></td>
                                <td><h3 style="color: black !important; font: bold;"><%=course.getName()%></h3>
                                    <br><label style="font-size: 16px;"><%=course.getProvider()%></label>
                                    <br><label>2013</label></td>
                            </tr>
                            <%
                                }
                            }
                        %>
                    </table>
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
                        <div class="add-skills-data">
                            <label>Year:</label><br>
                            <select name="course-year" id="course-year" class="input-person-data" required>
                            </select>
                        </div>

                        <button class="submit">Add</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="block">
            <div class="article">
                <h2>Skills</h2>
            </div>

            <div class="skills">

                    <div id="skills">
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getSkills() != null){
                                int i = 0;
                                for(String skill: ((Person)request.getSession().getAttribute("person")).getSkills())
                                { %>
                        <span style="display: inline-block;"><label name="stiker" id="<%=i%>"class="stiker">X</label><label id="<%=i%>skill"class="skill"><%=skill%></label></span><%
                            i++;
                            }
                        }
                        %>
                    </div>
                    <div class="add-skills">
                        <img class="add" src="resources/add-course.png">
                        <div class="add-skills-data">
                            <label>Skill:</label><br>
                            <input name="skill" id="skill" class="input-person-data" required placeholder="Java SE, Algorithms, etc.">
                        </div>
                        <button class="submit" id="add-skill">Add</button>
                    </div>

            </div>
        </div>


        <div class="block">
            <div class="article">
                <h2>Projects</h2>
            </div>

            <form action="${pageContext.request.contextPath}/addWork" method="post">
                <div class="works">
                    <table>
                        <%
                            if(((Person)request.getSession().getAttribute("person")).getProjects() != null){
                                int i = 0;
                                for(Project project: ((Person)request.getSession().getAttribute("person")).getProjects())
                                { %>

                        <tr id="<%=i%>projectdel">
                            <td><img class="add" src="resources/icon_green.png"></td>
                            <td>
                                <div class="add-skills-data">
                                    <a href="http://<%=project.getReference()%>" style="color: royalblue;"
                                       id="<%=i%>projectreference"><%=project.getReference()%></a><br>
                                </div>
                            </td>
                            <td>
                                <div class="add-skills-data">
                                    <label id="<%=i%>projectdescription"><%=project.getDescription()%></label><br>
                                </div>
                            </td>
                            <td>
                                <div id="<%=i%>project" class="delete-project">X</div>
                            </td>
                        </tr>
                        <%
                                    i++;
                                }
                            } %>

                    </table>
                </div>

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

        <div class="article">
            <h2>Followings</h2>
        </div>
        <div class="works">
            <table>
                <%
                    if(((Person)request.getSession().getAttribute("person")).getFollowings() != null){
                        int i = 0;
                        for(String following: ((Person)request.getSession().getAttribute("person")).getFollowings())
                        { %>
                <tr id="<%=i%>followdel">
                    <td>
                        <img class="add" src="resources/Company-Icon.png">
                    </td>
                    <td>
                        <div class="add-skills-data">
                            <label id="<%=i%>followval"><%=following%></label><br>
                        </div>
                    </td>
                    <td id="<%=i%>follow" name="delete-following"  class="delete-following" >
                        X
                    </td>
                </tr>
                <%
                            i++;
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
                    if(((Person)request.getSession().getAttribute("person")).getContactProfiles() != null){
                        int i = 0;
                        for(Contact contact: ((Person)request.getSession().getAttribute("person")).getContactProfiles())
                        { %>

                        <tr id="<%=i%>contactdel">
                            <td>
                                <img class="photo" src="<%=contact.getPhoto()%>">
                            </td>
                            <td>
                                <div class="info">
                                    <a href="profile?id=<%=contact.get_id()%>">
                                        <h3>
                                            <%=(contact.getFirstname() + " " + contact.getLastname())%>
                                        </h3>
                                    </a>
                                    <br>
                                    <label><%=contact.getEmail()%></label>
                                </div>
                            </td>
                            <td id="<%=i%>contact" name="delete-contact" class="delete-contact">
                                X
                            </td>
                        </tr>

                <%
                            i++;
                        }
                    }
                %>
            </table>
        </div>
       </div>
    </div>

</div>

</body>
</html>
