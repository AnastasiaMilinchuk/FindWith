package findwith.profiles;

import findwith.DAORealizations.UserDAOImpl;
import findwith.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 12/11/14.
 */
public class MyProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") != null){
            UserDAOImpl userDAO = new UserDAOImpl("localhost","Social_Network", "users");
            Person person = userDAO.getUser(request.getSession().getAttribute("user").toString());
            request.getSession().setAttribute("person", person);
            request.getSession().setAttribute("login", true);
            request.getSession().setAttribute("invalid", "");
            response.sendRedirect("profile.jsp");
        }
        else{
            request.getSession().setAttribute("invalid", "Invalid login or password");
            request.getSession().setAttribute("login", "false");
            response.sendRedirect("index.jsp");
        }
    }
}
