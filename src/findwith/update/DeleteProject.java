package findwith.update;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import findwith.Entities.InnerEntities.Project;
import findwith.Entities.Person;
import findwith.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by milinchuk on 12/7/14.
 */
public class DeleteProject extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if( request.getSession().getAttribute("login") != null){
            Person person = (Person)(request.getSession().getAttribute("person"));
            List<Project> projects = person.getProjects();
            Project project = new Project();
            project.setReference(request.getParameter("reference").toString());
            project.setDescription(request.getParameter("description").toString());

            if(true){
                MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
                DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
                DBCollection users = MongoDBController.getMongoDBCollection(socialNetwork, "users");
                BasicDBObject findQuery = new BasicDBObject("login",
                        ((Person)request.getSession().getAttribute("person")).getLogin());
                BasicDBObject query = new BasicDBObject("reference", request.getParameter("reference")).
                        append("description", request.getParameter("description"));
                BasicDBObject item = new BasicDBObject("projects", query);
                BasicDBObject updateQuery = new BasicDBObject("$pull", item);
                users.update(findQuery, updateQuery);
                for(Project p : ((Person) request.getSession().getAttribute("person")).getProjects()){
                    if(p.getReference().equals(project.getReference()) && p.getDescription().equals(project.getDescription())){
                        ((Person) request.getSession().getAttribute("person")).getProjects().remove(p);
                        break;
                    }
                }
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
