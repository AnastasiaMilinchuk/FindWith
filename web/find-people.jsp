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
    <script src="javascript/add-skill-to-find.js"></script>
</head>
<body>
    <jsp:include page="upperBox.jsp"/>

    <section>
        <label>Find by name</label>
        <br>
        <input placeholder="First Name"/><br>
        <input placeholder="Last Name"/>
        <br>

        <br>
        <label>Знайти за спеціалізацією</label>
        <br>
        <input placeholder="Industry"/>
        <br>

        <br>
        <label>Find by skills</label>
        <div id="skills">
        </div>
        <br>
        <input placeholder="Skill">
        <button id="add-skill">Add skill</button>
        <br>

        <br>
        <label>Find by location</label>
        <br>
        <input placeholder="Country">
        <br>
        <input placeholder="City"/>
        <br>

         <button>Find</button>
        <br>
        <h3>Found:</h3>
        <div></div>
    </section>


    <footer>

    </footer>
</body>
</html>
