package zopa.DAO;

import zopa.Entities.User;

import java.util.Collection;

/**
 * Created by milinchuk on 11/24/14.
 */
public interface UserDAO {
    public User getUser(String login);
    public boolean addUser(User user);
    public Collection getAllUsers();
    public boolean updateUser(String login, User updatedUser);
    public boolean deleteUser(String login);
}
