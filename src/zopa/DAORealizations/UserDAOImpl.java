package zopa.DAORealizations;

import com.mongodb.*;
import zopa.DAO.UserDAO;
import zopa.Entities.Person;
import zopa.controllers.MongoDBController;

import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by milinchuk on 11/24/14.
 */
public class UserDAOImpl implements UserDAO {
    DB dataBase;
    DBCollection users;

    public UserDAOImpl(String dbClient, String dbName, String collection) throws UnknownHostException {
        MongoClient client = MongoDBController.getMongoDBClient(dbClient);
        dataBase = MongoDBController.getMongoDataBase(client, dbName);
        users = MongoDBController.getMongoDBCollection(dataBase, collection);
    }
    private Person fillUser(DBObject u){
        Person newPerson = new Person();
        newPerson.setFirstname((String)u.get("firstname"));
        newPerson.setLastname((String)u.get("secondname"));
        newPerson.setBirthday((String)u.get("birthday"));
        newPerson.setLogin((String)u.get("login"));
        newPerson.setPassword((String)u.get("password"));
        // add location in bean
        // newPerson.setLocation((Location)u.get("location"));
        //
        newPerson.setPhoto((String)u.get("photo"));
        newPerson.setPhone((String) u.get("phones"));
       // newPerson.setEducation((List<UserEducation>)u.get("education"));
        newPerson.setEmail((String) u.get("emails"));
        //newPerson.setExperience((List<Experience>)u.get("experience"));
        newPerson.setIndustry((String)u.get("industry"));
        //newPerson.setProjects((List<Project>)u.get("projects") );
        //newPerson.setFollowings((List<String>)u.get("followings"));
        //newPerson.setSkills((List<String>)u.get("skills"));
        return newPerson;
    }
    @Override
    public Person getUser(String login) {
            BasicDBObject findQuery = new BasicDBObject("login", login);
            DBCursor usrs = users.find(findQuery);
            Person newPerson = new Person();
            for(DBObject u: usrs){
                newPerson = fillUser(u);
            }
            return newPerson;
    }

    @Override
    public boolean addUser(Person person) {
        try {
            BasicDBObject location = new BasicDBObject("country", person.getLocation().getCountry()).append("city", person.getLocation().getCity());
            BasicDBObject education = new BasicDBObject("university", person.getEducation().get(0).getUniversity()).
                    append("faculty", person.getEducation().get(0).getFaculty()).
                    append("year", person.getEducation().get(0).getUniversity());

            BasicDBObject addNewUser = new BasicDBObject("login", person.getLogin()).
                    append("password", person.getPassword()).
                    append("firstname", person.getFirstname()).
                    append("secondname", person.getLastname()).
                    append("birthday", person.getBirthday()).
                    append("location", location).
                    append("education", education).
                    append ("email", person.getEmail()).
                    append("phone", person.getPhone()).
                    append("industry", person.getIndustry());

            users.save(addNewUser);
        }
        catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public List<Person> getAllUsers() {
        DBCursor usrs = users.find();
        List<Person> listPersons = new LinkedList<Person>();
        for(DBObject u: usrs){
            Person newPerson = new Person();
            newPerson = fillUser(u);
            listPersons.add(newPerson);
        }

        return listPersons;
    }

    @Override
    public boolean updateUser(String login, Person updatedPerson) {
        try{
            BasicDBObject findQuery = new BasicDBObject("login", login);
            users.remove(findQuery);
            addUser(updatedPerson);
        }
        catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteUser(String login) {
        try{
            BasicDBObject findQuery = new BasicDBObject("login", login);
            users.remove(findQuery);
        }
        catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public boolean isExist(String login, String password) {
        BasicDBObject findQuery = new BasicDBObject("login", login).append("password", password);
        DBCursor usrs = users.find(findQuery);
        if(usrs.size() == 1){
            return true;
        }
        else
            return false;
    }
}
