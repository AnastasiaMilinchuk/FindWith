package zopa.registration;

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
        request.getSession().setAttribute("user-first-name", request.getParameter("firstname"));
        request.getSession().setAttribute("user-second-name", request.getParameter("secondname"));
        request.getSession().setAttribute("user-email", request.getParameter("email"));
        request.getSession().setAttribute("user-password", request.getParameter("password"));
        request.getRequestDispatcher("/signup-step2.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
