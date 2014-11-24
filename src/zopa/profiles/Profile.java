package zopa.profiles;


import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;
import java.util.Objects;

/**
 * Created by milinchuk on 4/29/14.
 */
public class Profile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String JDBC_DRIVER="com.mysql.jdbc.Driver";
        String DB_URL="jdbc:mysql://localhost:3306/test";
        PrintWriter out = response.getWriter();
        try{
            Class.forName(JDBC_DRIVER);
            Connection connection = DriverManager.getConnection(DB_URL);
            Statement statement = connection.createStatement();
            String query = "DELETE FROM users WHERE email = \""+ request.getParameter("email").toString() +"\"";
            int res = statement.executeUpdate(query);
            request.getRequestDispatcher("/profileDeletion.jsp").forward(request, response);
        }catch (ClassNotFoundException e){
            out.print("class not found");
        }catch (SQLException e){
            out.print("sql exception");
        }catch (Exception e){
            out.print("Exception");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("name", "Anastasia Milinchuk");
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
