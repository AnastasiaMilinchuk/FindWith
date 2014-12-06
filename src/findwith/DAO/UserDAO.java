package findwith.DAO;

import findwith.Entities.Person;

import java.util.List;

/**
 * Created by milinchuk on 11/24/14.
 */
public interface UserDAO {
    public Person getUser(String login);
    public boolean addUser(Person person);
    public List<Person> getAllUsers();
    public boolean updateUser(String login, Person updatedPerson);
    public boolean deleteUser(String login);
    public boolean isExist(String login, String password);
}
