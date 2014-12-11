package findwith.search;

import com.mongodb.*;
import findwith.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 12/3/14.
 */
public class FindCities extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk", "1111".toCharArray());
        DBCollection countrs = MongoDBController.getMongoDBCollection(socialNetwork, "countries");
        BasicDBObject find = new BasicDBObject("country", request.getParameter("country").toString());
        DBCursor countries = countrs.find(find);

        BasicDBList cityList = (BasicDBList)countries.next().get("cities");
        String citiesJSON = cityList.toString();
        response.setContentType("application/json");
        response.getWriter().write(citiesJSON);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
