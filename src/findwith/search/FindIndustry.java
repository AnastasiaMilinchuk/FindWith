package findwith.search;

import com.mongodb.*;
import findwith.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by milinchuk on 12/2/14.
 */
public class FindIndustry extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk", "1111".toCharArray());
        DBCollection industries = MongoDBController.getMongoDBCollection(socialNetwork, "industries");
        DBObject find = new BasicDBObject("industry", "computer science");
        DBCursor inds = industries.find(find);
        BasicDBList industryList = (BasicDBList)(inds.next()).get("kinds");
        String indXML = industryList.toString();
        response.setContentType("application/json");
        response.getWriter().write(indXML);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
