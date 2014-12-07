package findwith.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by click on 12/7/2014.
 */
public class LogoutServlet  extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processServlet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processServlet(request,response);
    }

    private void processServlet (HttpServletRequest request, HttpServletResponse response) throws IOException {
                       request.getSession().setAttribute("login", null);
        response.sendRedirect("/index.jsp");
    }
}
