package findwith.registration;

import findwith.Entities.Person;

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
        request.setCharacterEncoding("UTF-8");
        Person person = new Person();
        person.setFirstname(request.getParameter("firstname"));
        person.setLastname(request.getParameter("secondname"));
        person.setEmail(request.getParameter("email"));
        person.setPassword(request.getParameter("password"));
        person.setLogin(request.getParameter("email"));

        request.getSession().setAttribute("person", person);
        response.sendRedirect("profile.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
