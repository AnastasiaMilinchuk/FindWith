package zopa.servlets;

import com.sun.org.apache.xpath.internal.SourceTree;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLConnection;
import java.sql.*;
import java.util.Enumeration;
import java.util.Formatter;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpSession;

/**
 * Created by milinchuk on 4/10/14.
 */

public class Servlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("invalid", "");
        if(request.getSession().getAttribute("login") == "true"){
            request.getSession().setAttribute("loginSuccess","true");
        }
    }

    private void response(HttpServletResponse resp, String a, String b)
            throws IOException {
        PrintWriter out = resp.getWriter();
        /*int x = Integer.parseInt(a);
        int y = Integer.parseInt(b);
        int answ = x + y;*/

        out.println("<html>");
        out.println("<body>");
        out.println("<t1>" + "koko" + "</t1>");
        out.println("</body>");
        out.println("</html>");

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("login","false");
        if(request.getParameter("submit") != null){
            String JDBC_DRIVER="com.mysql.jdbc.Driver";
            String DB_URL="jdbc:mysql://localhost:3306/test";

            String USER = "milinchuk";
            String PASS = "kokoko";

            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                // Open a connection
                Connection conn = DriverManager.getConnection(DB_URL, "mysql", "");
                // Execute SQL query
                Statement stmt = conn.createStatement();
                String sql;

                sql = "SELECT name, email, password FROM users WHERE email = \"" + request.getParameter("email") + "\" AND password = \"" + request.getParameter("password")+"\"";
                ResultSet rs = stmt.executeQuery(sql);
//                request.getParameter("invalid").
//                while(rs.next()){
//
//                    if((rs.getString("email").equals(request.getParameter("login")))&&(rs.getString("password").equals(request.getParameter("password")))){
//                        out.print("<h3>"+"You are in database"+"</h3>");
//                    }
//                    else{
//                        out.print("<h1>"+rs.getString("email")+ request.getParameter("login")+ rs.getString("password")+ request.getParameter("password")+ "</h1>");
//                    }
//                 }

                if(rs.first()){
                    //HttpSession session =
                    request.getSession().setAttribute("name", rs.getString("name"));
                    request.getSession().setAttribute("password", rs.getString("password"));
                    request.getSession().setAttribute("email", rs.getString("email"));
                    request.getRequestDispatcher("/profile1.jsp").forward(request,response);
                    request.getSession().setAttribute("login","true");
                }
                else{
//                    request.getSession().setAttribute("invalid", "Invalid login or password");
                    request.getSession().setAttribute("invalid", "Invalid login or password");
//                    SourceTree
//                    request.getSession().setAttribute();
                    request.getSession().setAttribute("login", "false");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
                rs.close();
                stmt.close();
                conn.close();

            } catch (ClassNotFoundException e) {
                out.println("Where is your MySQL JDBC Driver?");
                e.printStackTrace();
                return;
            } catch (SQLException e) {
                for(StackTraceElement stackTraceElement: e.getStackTrace()){
                out.println(stackTraceElement.toString());
                    e.printStackTrace();
                }
            }

            out.println("</body>");
            out.println("</html>");
        }
        System.out.println();
           // out.print("qweq");
        }
    }


