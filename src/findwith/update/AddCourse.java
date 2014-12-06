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
 * Created by milinchuk on 11/9/14.
 */
public class AddCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk","1111".toCharArray());
        DBCollection skills = MongoDBController.getMongoDBCollection(socialNetwork, "users");
        if(request.getSession().getAttribute("login") != null){
            BasicDBObject find = new BasicDBObject("login", ((Person)request.getSession().getAttribute("person")).getLogin());
            BasicDBObject newCourse = new BasicDBObject("provider", request.getParameter("provider").toString()).
                    append("name", request.getParameter("course").toString()).
                    append("year", request.getParameter("course-year"));

            BasicDBObject add = new BasicDBObject("courses", newCourse);
            BasicDBObject course = new BasicDBObject("$push", add);
            skills.update(find, course);
        }
        response.sendRedirect("/settings.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
