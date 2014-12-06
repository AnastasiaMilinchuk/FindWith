package findwith.update;

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
public class FindUniversities extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        boolean auth = socialNetwork.authenticate("milinchuk", "1111".toCharArray());
        DBCollection univers = MongoDBController.getMongoDBCollection(socialNetwork, "education");

        DBCursor universities = univers.find();

        BasicDBList universityList = new BasicDBList();
        while(universities.hasNext()){
            universityList.add(universities.next().get("university"));
        }

        String universitiesJSON = universityList.toString();
        response.setContentType("application/json");
        response.getWriter().write(universitiesJSON);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
