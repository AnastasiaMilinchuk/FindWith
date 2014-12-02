package zopa.profiles;

import zopa.DAORealizations.UserDAOImpl;
import zopa.Entities.Person;

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
                request.getSession().setAttribute("invalid", "");
                request.getRequestDispatcher("/profile.jsp").forward(request,response);
            }
            else{
                request.getSession().setAttribute("invalid", "Invalid login or password");
                request.getSession().setAttribute("user", "false");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }

        /*ConnectionToDataBase.set("localhost", "Social_Network");
        DBCollection user = MongoDBController.getMongoDBCollection(ConnectionToDataBase.get(), "users");

        BasicDBObject data = new BasicDBObject("login", request.getParameter("email").toString())
                .append("password", request.getParameter("password").toString());
        DBCursor cursor= user.find(data);
        boolean isExist = false;
        DBObject userData = null;

        while (cursor.hasNext()){
            isExist = true;
            userData = cursor.next();
        }

        if(userData != null){
            request.getSession().setAttribute("name", (userData.get("firstname").toString() + " " + userData.get("secondname").toString()));
            request.getSession().setAttribute("email", request.getParameter("email"));
            request.getSession().setAttribute("birthday", userData.get("birthday").toString());
            request.getSession().setAttribute("phone", userData.get("phone"));
            request.getSession().setAttribute("education", userData.get("education"));

            request.getSession().setAttribute("login", request.getParameter("email").toString());
            //request.getSession().setAttribute("password", request.getParameter("password"));
            request.getSession().setAttribute("invalid", "");
            request.getRequestDispatcher("/profile.jsp").forward(request,response);
        }
        else{
            request.getSession().setAttribute("invalid", "Invalid login or password");
            request.getSession().setAttribute("user", "false");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
