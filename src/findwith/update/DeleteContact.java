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
 * Created by milinchuk on 12/7/14.
 */
public class DeleteContact extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if( request.getSession().getAttribute("login") != null){
            Person person = (Person)(request.getSession().getAttribute("person"));
            List<String> contacts = person.getContacts();
            if(contacts.contains(request.getParameter("contact").toString())){
                MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
                DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
                DBCollection users = MongoDBController.getMongoDBCollection(socialNetwork, "users");
                BasicDBObject findQuery = new BasicDBObject("login",
                        ((Person)request.getSession().getAttribute("person")).getLogin());
                BasicDBObject item = new BasicDBObject("contacts", request.getParameter("contact").toString());
                BasicDBObject updateQuery = new BasicDBObject("$pull", item);
                users.update(findQuery, updateQuery);
                ((Person) request.getSession().getAttribute("person")).getContacts().remove(request.getParameter("contact").toString());
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
