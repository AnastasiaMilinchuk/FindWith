package findwith.profiles;


import findwith.DAORealizations.UserDAOImpl;
import findwith.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by milinchuk on 4/29/14.
 */
public class Profile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            UserDAOImpl userDAO = new UserDAOImpl("localhost","Social_Network", "users");
            if(userDAO.isExist(request.getParameter("id"))){
                Person person = userDAO.getUserByID(request.getParameter("id").toString());
                request.getSession().setAttribute("person", person);
                request.getSession().setAttribute("login", true);
                request.getRequestDispatcher("profile.jsp").forward(request,response);
            }
            else{
                //response.sendRedirect("noaccess.jsp");
            }

    }
}
