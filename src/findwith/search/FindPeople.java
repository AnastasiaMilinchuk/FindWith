package findwith.search;

import com.mongodb.*;
import findwith.controllers.MongoDBController;
import sun.launcher.resources.launcher_zh_CN;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 12/7/14.
 */
public class FindPeople extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        MongoClient mongoClient = MongoDBController.getMongoDBClient("localhost");
        DB socialNetwork = MongoDBController.getMongoDataBase(mongoClient, "Social_Network");
        DBCollection users = MongoDBController.getMongoDBCollection(socialNetwork, "users");
        BasicDBList find = new BasicDBList();
        find.add(new BasicDBObject());

        if(!request.getParameter("industry").toString().equals("none")){
            BasicDBObject ind = new BasicDBObject("industry", request.getParameter("industry").toString());
            find.add(ind);
        }

        if(!request.getParameter("skills").toString().equals("none")){
            String[] skills = request.getParameter("skills").split(",");
            for(String skill: skills){
                BasicDBObject s = new BasicDBObject("skills", skill);
                find.add(s);
            }
        }

        if(!request.getParameter("country").equals("none")){
            BasicDBObject country = new BasicDBObject("location.country", request.getParameter("country"));
            find.add(country);
            if(!request.getParameter("city").equals("none")){
                BasicDBObject city = new BasicDBObject("location.city", request.getParameter("city"));
                find.add(city);
            }
        }

        BasicDBObject data = new BasicDBObject("$and", find);
        DBCursor people = users.find(data);

        BasicDBList foundPeopleList = new BasicDBList();
        while(people.hasNext()){
            DBObject obj = people.next();
            BasicDBObject p = new BasicDBObject("photo", obj.get("photo")).
                    append("firstname", obj.get("firstname")).
                    append("lastname", obj.get("secondname")).
                    append("login", obj.get("email")).
                    append("id", obj.get("_id"));

            foundPeopleList.add(p);
        }

        String indXML = foundPeopleList.toString();
        response.setContentType("application/json");
        response.getWriter().write(indXML);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
