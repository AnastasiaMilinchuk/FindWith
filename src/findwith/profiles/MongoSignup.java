package findwith.profiles;

import findwith.DAORealizations.UserDAOImpl;
import findwith.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 4/28/14.
 */
public class MongoSignup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       /* MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk","1111".toCharArray());
*/
        if(request.getSession().getAttribute("user") == null){
            UserDAOImpl userDAO = new UserDAOImpl("localhost","Social_Network", "users");
            if(userDAO.isExist(request.getParameter("email"), request.getParameter("password"))){
                Person person = userDAO.getUser(request.getParameter("email").toString());
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
