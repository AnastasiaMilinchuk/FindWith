package findwith.registration;

import findwith.DAO.UserDAO;
import findwith.DAORealizations.UserDAOImpl;
import findwith.Entities.InnerEntities.Location;
import findwith.Entities.InnerEntities.UserEducation;
import findwith.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by milinchuk on 11/23/14.
 */
public class CreateUserProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
        UserDAO userDAO = new UserDAOImpl("localhost", "Social_Network", "users");
        Person person = (Person)request.getSession().getAttribute("person");

        UserEducation edu = new UserEducation();
        edu.setUniversity(request.getParameter("university"));
        edu.setFaculty(request.getParameter("faculty"));
        edu.setGraduateYear(Integer.parseInt(request.getParameter("graduateYear")));

        Location location =  new Location();
        location.setCountry(request.getParameter("country"));
        location.setCity( request.getParameter("city" ));

        SimpleDateFormat time = new SimpleDateFormat("dd.MM.yyyy");
        Date birthday = time.parse(request.getParameter("day") + "." + request.getParameter("month").toString() + "." + request.getParameter("year"));

        person.setBirthday(birthday);
        person.setPhone(request.getParameter("phone"));
        person.setIndustry(request.getParameter("industry"));
        person.setEducation(edu);
        person.setLocation(location);

        userDAO.addUser(person);

        request.getSession().setAttribute("person", person);
        request.getSession().setAttribute("login", "true");
        request.getSession().setAttribute("user", person.getLogin());
        request.getRequestDispatcher("/MongoSignup").forward(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
