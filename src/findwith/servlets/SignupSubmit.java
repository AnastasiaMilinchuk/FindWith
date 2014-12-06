package findwith.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by milinchuk on 4/29/14.
 */
public class SignupSubmit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String JDBC_DRIVER="com.mysql.jdbc.Driver";
        String DB_URL="jdbc:mysql://localhost:3306/test";
        PrintWriter out = response.getWriter();

        try{
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, "mysql", "");
            Statement statement = conn.createStatement();
           // String query = "SELECT * FROM users";
            String query = "INSERT INTO users(name, email, password) VALUES(\""+ request.getParameter("name")+"\",\""+request.getParameter("email") +"\",\"" + request.getParameter("password") + "\""+")";
            int res = statement.executeUpdate(query);

            request.getSession().setAttribute("name", request.getParameter("name"));
            request.getSession().setAttribute("email", request.getParameter("email"));
            request.getSession().setAttribute("password", request.getParameter("password"));
            request.getRequestDispatcher("/profile.jsp").forward(request,response);
            statement.close();
            conn.close();
        }catch (ClassNotFoundException e){
            out.print("Class not found");
        }catch (SQLException e){
            e.printStackTrace();
            out.print("INSERT INTO users(name, email, password) VALUES( 3, \""+ request.getParameter("name")+"\",\""+request.getParameter("email") +"\",\"" + request.getParameter("password") + "\""+")");
        }

    }
}
