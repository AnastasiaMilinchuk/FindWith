package zopa.DAORealizations;

import com.mongodb.*;
import zopa.DAO.OrganizationDAO;
import zopa.Entities.InnerEntities.Location;
import zopa.Entities.Organization;
import zopa.Entities.Person;
import zopa.controllers.MongoDBController;

import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by milinchuk on 11/29/14.
 */
public class OrganizationDAOImpl implements OrganizationDAO {
    DB dataBase;
    DBCollection organisations;

    public OrganizationDAOImpl(String dbClient, String dbName, String collection) throws UnknownHostException {
        MongoClient client = MongoDBController.getMongoDBClient(dbClient);
        dataBase = MongoDBController.getMongoDataBase(client, dbName);
        organisations = MongoDBController.getMongoDBCollection(dataBase, collection);
    }

    private Organization fillUser(DBObject organiz){
        Organization organization = new Organization();
        organization.setName(organiz.get("name").toString());
        organization.setContent(organiz.get("content").toString());
        organization.setWebsite(organiz.get("website").toString());
        organization.setEmail(organiz.get("email").toString());
        organization.setIndustry(organiz.get("industry").toString());
        organization.setPhone(organiz.get("phone").toString());
        organization.setPhoto(organiz.get("photo").toString());
        organization.setLogin(organiz.get("login").toString());
        organization.setPassword(organiz.get("password").toString());

        Location location = new Location();
        DBObject obj = (DBObject)organiz.get("location");
        location.setCity(obj.get("country").toString());
        location.setCountry(obj.get("city").toString());

        organization.setLocation(location);

        return organization;
    }
    @Override
    public Organization getUser(String login) {
        BasicDBObject findQuery = new BasicDBObject("login", login);
        DBCursor usrs = organisations.find(findQuery);
        Organization newOrganization = new Organization();
        for(DBObject u: usrs){
            newOrganization = fillUser(u);
        }
        return newOrganization;
    }

    @Override
    public boolean addUser(Organization organization) {
        BasicDBObject location = new BasicDBObject("country", organization.getLocation().getCountry()).
                append("city", organization.getLocation().getCity());
        BasicDBObject org = new BasicDBObject("login", organization.getLogin()).
                append("password", organization.getPassword()).
                append("firstname", organization.getFirstname()).
                append("secondname", organization.getLastname()).
                append("name", organization.getName()).
                append("content", organization.getContent()).
                append("website", organization.getWebsite()).
                append("email", organization.getEmail()).
                append("location", location).
                append("industry", organization.getIndustry()).
                append("phone", organization.getPhone()).
                append("photo", organization.getPhoto());
        organisations.save(org);
        return  true;
    }

    @Override
    public List<Organization> getAllUsers() {
        DBCursor usrs = organisations.find();
        List<Organization> listOrganizations = new LinkedList<Organization>();
        for(DBObject u: usrs){
            Organization newOrganization = new Organization();
            newOrganization = fillUser(u);
            listOrganizations.add(newOrganization);
        }

        return listOrganizations;
    }

    @Override
    public boolean updateUser(String login, Organization updatedOrganization) {
        return false;
    }

    @Override
    public boolean deleteUser(String login) {
        try{
            BasicDBObject findQuery = new BasicDBObject("login", login);
            organisations.remove(findQuery);
        }
        catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public boolean isExist(String login, String password) {
        BasicDBObject findQuery = new BasicDBObject("login", login).append("password", password);
        DBCursor usrs = organisations.find(findQuery);
        if(usrs.size() == 1){
            return true;
        }
        else
            return false;
    }
}
