package findwith.update;

import com.mongodb.*;
import findwith.Entities.Person;
import findwith.Entities.User;
import findwith.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by milinchuk on 12/2/14.
 */
public class UpdateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk","1111".toCharArray());
        DBCollection users = MongoDBController.getMongoDBCollection(socialNetwork, "users");
       // try {
            DBObject query = new BasicDBObject("login", ((Person)request.getSession().getAttribute("person")).getLogin());
            SimpleDateFormat time = new SimpleDateFormat("dd.MM.yyyy");
        System.out.println(request.getParameter("faculty"));
          //  Date birthday = time.parse(request.getParameter("bday") + "." + request.getParameter("bmonth").toString() + "." + request.getParameter("byear"));
            BasicDBObject education = new BasicDBObject("university", request.getParameter("university")).
                    append("faculty", request.getParameter("faculty")).
                    append("year", request.getParameter("graduateYear"));

            BasicDBObject location = new BasicDBObject("country", request.getParameter("country")).
                    append("city", request.getParameter("city"));

            BasicDBObject newProfile = new BasicDBObject("email", request.getParameter("email")).
                    append("phone", request.getParameter("phone")).
                    append("industry", request.getParameter("industry")).
                    append("education", education).
                    append("location", location);

            BasicDBObject update = new BasicDBObject("$set", newProfile);
            users.update(query, update);
        /*} catch (ParseException e) {
            e.printStackTrace();
        }*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}