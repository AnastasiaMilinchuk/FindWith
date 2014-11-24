package zopa.DAORealizations;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import zopa.DAO.UserDAO;
import zopa.Entities.User;
import zopa.controllers.MongoDBController;

import java.net.UnknownHostException;
import java.util.Collection;

/**
 * Created by milinchuk on 11/24/14.
 */
public class UserDAOImpl implements UserDAO {
    DB dataBase;
    DBCollection users;

    public UserDAOImpl(String dbClient, String dbName, String collection) throws UnknownHostException {
        MongoClient client = MongoDBController.getMongoDBClient(dbClient);
        dataBase = MongoDBController.getMongoDataBase(client, dbName);
        DBCollection users = MongoDBController.getMongoDBCollection(dataBase, collection);
    }

    @Override
    public User getUser(String login) {
        return null;
    }

    @Override
    public boolean addUser(User user) {
        BasicDBObject addNewUser = new BasicDBObject("firstname", user.getFirstname()).
                append("secondname", user.getLastname()).
                append("login", user.getLogin()).
                append("password", user.getPassword()).
                append("birthday", user.getBirthday()).
                append("location", user.getLocation()).
                append("education", user.getEducation()).
                append("emails", user.getEmails()).
                append("phones", user.getPhones());

        users.save(addNewUser);
        return false;
    }

    @Override
    public Collection getAllUsers() {
        return null;
    }

    @Override
    public boolean updateUser(String login, User updatedUser) {
        return false;
    }

    @Override
    public boolean deleteUser(String login) {
        return false;
    }
}
