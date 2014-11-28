package zopa.registration;

import zopa.DAO.UserDAO;
import zopa.DAORealizations.UserDAOImpl;
import zopa.Entities.InnerEntities.Location;
import zopa.Entities.InnerEntities.UserEducation;
import zopa.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by milinchuk on 11/23/14.
 */
public class CreateUserProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl("localhost", "Social_Network", "users");
        Person person = (Person)request.getSession().getAttribute("person");

        UserEducation edu = new UserEducation();
        edu.setUniversity(request.getParameter("university"));
        edu.setFaculty(request.getParameter("faculty"));
        edu.setGraduateYear(request.getParameter("graduateYear"));
        List<UserEducation> education = new LinkedList<UserEducation>();
        education.add(edu);

        Location location =  new Location();
        location.setCountry(request.getParameter("country"));
        location.setCity( request.getParameter("city" ));

        person.setBirthday(request.getParameter("day") + "." + request.getParameter("month")+"."+request.getParameter("year"));
        person.setPhone(request.getParameter("phone"));
        person.setIndustry(request.getParameter("industry"));
        person.setEducation(education);
        person.setLocation(location);

        userDAO.addUser(person);

        request.getSession().setAttribute("person", person);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
