package zopa.servlets;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import zopa.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/11/14.
 */
public class AddWork extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
       // boolean auth = socialNetwork.authenticate("milinchuk","1111".toCharArray());
        DBCollection works = MongoDBController.getMongoDBCollection(socialNetwork, "works");
        if(request.getSession().getAttribute("login") != null){
            BasicDBObject newWork = new BasicDBObject();
            newWork.put("reference", request.getParameter("reference").toString());
            newWork.put("description", request.getParameter("description").toString());
            newWork.put("user", request.getSession().getAttribute("login"));
            works.save(newWork);
        }
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
