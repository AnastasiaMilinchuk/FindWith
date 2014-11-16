package zopa.servlets;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by milinchuk on 9/26/14.
 */
public class FilterForSignup implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
