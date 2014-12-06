package findwith.update;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import findwith.Entities.Person;
import findwith.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/11/14.
 */
public class AddProject extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
       // boolean auth = socialNetwork.authenticate("milinchuk","1111".toCharArray());
        DBCollection works = MongoDBController.getMongoDBCollection(socialNetwork, "users");
        if(request.getSession().getAttribute("login") != null){
            BasicDBObject find = new BasicDBObject("login", ((Person)request.getSession().getAttribute("person")).getLogin());
            BasicDBObject newWork = new BasicDBObject("reference", request.getParameter("reference").toString()).
                    append("description", request.getParameter("description").toString());
            BasicDBObject push = new BasicDBObject("projects", newWork);
            BasicDBObject addProject = new BasicDBObject("$push", push);
            works.update(find, addProject);
        }
        response.sendRedirect("settings.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
