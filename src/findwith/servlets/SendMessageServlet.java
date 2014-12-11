package findwith.servlets;

import findwith.Constants;
import findwith.DAORealizations.MsgDAOImpl;
import findwith.Entities.Message;
import findwith.Entities.Person;

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

    private void processServlet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        MsgDAOImpl msgDAO = new MsgDAOImpl();
        Person currentUser = (Person) request.getSession().getAttribute("person");
        Message messageForSend = new Message();
        messageForSend.setToEmail(request.getParameter("msgTo"));
        messageForSend.setFromEmail(currentUser.getEmail());
        messageForSend.setSubject(request.getParameter("msgSubject"));
        messageForSend.setText(request.getParameter("msgText"));
        if(msgDAO.sendMessage(messageForSend)){
            request.getSession().setAttribute(Constants.MESSAGE_WAS_SENT,true);
        }
        response.sendRedirect("/messages.jsp");
    }
}
