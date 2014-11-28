package zopa.registration;

import zopa.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/23/14.
 */
public class Step_2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        person.setFirstname(request.getParameter("firstname"));
        person.setLastname(request.getParameter("secondname"));
        person.setEmail(request.getParameter("email"));
        person.setPassword(request.getParameter("password"));
        person.setLogin(request.getParameter("email"));

        request.getSession().setAttribute("person", person);
        request.getRequestDispatcher("/signup-step2.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
