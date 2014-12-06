package findwith.servlets;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by milinchuk on 9/23/14.
 */
public class Authorization implements Filter{
    FilterConfig filterConfig;

    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession(true);

        if(session.getAttribute("login") == null || session.getAttribute("login") == "false" ){
            response.sendRedirect("/index.jsp");
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        filterConfig = config;
    }

}
