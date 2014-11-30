package zopa.DAO;

import zopa.Entities.Organization;
import zopa.Entities.Person;

import java.util.List;

/**
 * Created by milinchuk on 11/28/14.
 */
public interface OrganizationDAO {
    public Organization getUser(String login);
    public boolean addUser(Organization organization);
    public List<Organization> getAllUsers();
    public boolean updateUser(String login, Organization updatedOrganization);
    public boolean deleteUser(String login);
    public boolean isExist(String login, String password);
}
