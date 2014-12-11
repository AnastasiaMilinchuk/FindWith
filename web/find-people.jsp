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
    <script src="javascript/jquery.js"></script>
    <script src="javascript/add-skill-to-find.js"></script>
    <script src="javascript/country.js"></script>
    <script src="javascript/city.js"></script>
    <script src="javascript/industry.js"></script>
    <script src="javascript/find-people.js"></script>
    <script src="javascript/delete-skill-to-find.js"></script>
    <script src="javascript/add-to-friends.js"></script>

</head>
<body>
    <jsp:include page="upperBox.jsp"/>

    <nav class="navigation">
        <div class="search-box">
            <h2 class="search-type">Search</h2>
            <br>
            <label>Find by name</label>
            <br>
            <input  class="select"  placeholder="First Name"/><br>
            <input  class="select" placeholder="Last Name"/>
            <br>
            <button class="find" id="find-by-name">Find</button>
            <br>
        </div>

        <div class="search-box">
            <h3 class="search-type">Full search</h3> <br><br>
            <label>Find by industry</label><br>
            <select  class="select" id="industries">
                <option selected >none</option>
            </select>
                <br><br>
            <label>Find by skills</label>
            <div class="inner-search-box">
                <div class="skilltext" class="add-skill" id="skills">
                </div>
                <div class="add-skill">
                    <input class="select" style="width: 86%;" id="skill" placeholder="Skill"/>
                    <button class="add-skill-to-find" id="add-skill">+</button>
                </div>
                <br>
                <br><br>
            </div>

            <div class="inner-search-box">
                <label>Find by location</label>
                <br>
                <select class="select" id="countries">
                    <option selected>none</option>
                </select>
                <br>
                <select class="select" id="cities">
                    <option selected>none</option>
                </select>
                <br>
                <button class="find" id="find-people">Find</button>
                <br>
            </div>
        </div>

    </nav>

    <section class="section">
            <h3 class="search-type">Result</h3>
            <div class="result">
                <table id="found-people">

                </table>
            </div>
    </section>


    <footer>
    </footer>

</body>
</html>
