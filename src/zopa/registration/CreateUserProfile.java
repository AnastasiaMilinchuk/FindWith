package zopa.registration;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import zopa.controllers.ConnectionToDataBase;
import zopa.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/23/14.
 */
public class CreateUserProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        DBCollection user = MongoDBController.getMongoDBCollection(socialNetwork, "users");
        BasicDBObject addNewUser = new BasicDBObject("firstname", request.getSession().getAttribute("user-first-name")).
                append("secondname", request.getSession().getAttribute("user-second-name")).
                append("login", request.getSession().getAttribute("user-email")).
                append("password", request.getSession().getAttribute("user-password")).
                append("birthday", request.getParameter("birthday")).
                append("location", request.getParameter("location")).
                append("education", request.getParameter("education")).
                append("emails", request.getParameter("email")).
                append("phones", request.getParameter("phone"));

        user.save(addNewUser);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
