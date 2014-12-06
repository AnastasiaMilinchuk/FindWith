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
import java.util.List;

/**
 * Created by milinchuk on 12/4/14.
 */
public class DeleteSkill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if( request.getSession().getAttribute("login") != null){
            Person person = (Person)(request.getSession().getAttribute("person"));
            List<String> skills = person.getSkills();
            if(skills.contains(request.getParameter("skill").toString())){
                MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
                DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
                DBCollection users = MongoDBController.getMongoDBCollection(socialNetwork, "users");
                BasicDBObject findQuery = new BasicDBObject("login", ((Person)request.getSession().getAttribute("person")).getLogin());
                BasicDBObject item = new BasicDBObject("skills", request.getParameter("skill").toString());
                BasicDBObject updateQuery = new BasicDBObject("$pull", item);
                users.update(findQuery, updateQuery);
                ((Person) request.getSession().getAttribute("person")).getSkills().remove(request.getParameter("skill").toString());
                response.setContentType("application/json");
                response.getWriter().write("true");
            }
            else {
                response.setContentType("application/json");
                response.getWriter().write("false");
            }
        }
        else {
            response.setContentType("application/json");
            response.getWriter().write("false");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
