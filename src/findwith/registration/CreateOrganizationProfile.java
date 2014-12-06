package findwith.registration;

import findwith.DAORealizations.OrganizationDAOImpl;
import findwith.Entities.InnerEntities.Location;
import findwith.Entities.Organization;
import findwith.Entities.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by milinchuk on 11/23/14.
 */
public class CreateOrganizationProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        OrganizationDAOImpl organizationDAO = new OrganizationDAOImpl("localhost", "Social_Network", "organizations");
        Person person = (Person)request.getSession().getAttribute("person");

        Organization organization = new Organization();

        Location location =  new Location();
        location.setCountry(request.getParameter("country"));
        location.setCity( request.getParameter("city" ));

        organization.setFirstname(person.getFirstname());
        organization.setLastname(person.getLastname());
        organization.setLogin(person.getLogin());
        organization.setPassword(person.getPassword());
        organization.setEmail(person.getEmail());
        organization.setPhone(request.getParameter("phone"));
        organization.setIndustry(request.getParameter("industry"));
        organization.setWebsite(request.getParameter("website"));
        organization.setName(request.getParameter("name"));
        organization.setContent(request.getParameter("content"));
        organization.setLocation(location);

        organizationDAO.addUser(organization);
        request.getSession().setAttribute("organization", organization);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
