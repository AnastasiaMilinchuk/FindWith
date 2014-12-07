package findwith.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processServlet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processServlet(request,response);
    }

    private void processServlet (HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getParameter("msgTo");
        request.getParameter("msgSubject");
        request.getParameter("msgText");
         //TODO::Write to DB

        response.getOutputStream().print(request.getParameter("msgTo"));
        response.getOutputStream().print(request.getParameter("msgSubject"));
        response.getOutputStream().print(request.getParameter("msgText"));
    }
}
