package findwith.servlets;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
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
        DBCollection skills = MongoDBController.getMongoDBCollection(socialNetwork, "skills");
        if(request.getSession().getAttribute("login") != null){
        BasicDBObject newCourse = new BasicDBObject();
        newCourse.put("provider", request.getParameter("provider").toString());
        newCourse.put("course", request.getParameter("course").toString());
        newCourse.put("progress", request.getParameter("progress").toString());
        newCourse.put("user", request.getSession().getAttribute("login"));

        skills.save(newCourse);

        }
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
