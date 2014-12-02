package zopa.servlets;

import com.mongodb.*;
import zopa.controllers.ConnectionToDataBase;
import zopa.controllers.MongoDBController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/16/14.
 */
public class AddSkill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBCollection users = MongoDBController.getMongoDBCollection(ConnectionToDataBase.get(), "users");
        if(request.getSession().getAttribute("login") != null){
            BasicDBObject whereQuery = new BasicDBObject("skill", request.getParameter("skill"));
            DBObject skillID = users.find(whereQuery).next();
            //newWork.put("skill", request.getParameter("skill").toString());
            BasicDBObject findQuery = new BasicDBObject("login", request.getSession().getAttribute("login"));
            BasicDBObject item = new BasicDBObject("skills", request.getParameter("skill").toString());
            BasicDBObject updateQuery = new BasicDBObject("$push", item);
            users.update(findQuery, updateQuery);
        }
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
