package findwith.DAORealizations;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import findwith.Constants;
import findwith.DAO.MsgDAO;
import findwith.Entities.Message;
import findwith.controllers.MongoDBController;

import java.net.UnknownHostException;
import java.util.List;

/**
 * Created by click on 12/7/2014.
 */
public class MsgDAOImpl implements MsgDAO {
    DB dataBase;
    DBCollection messages;
    public MsgDAOImpl (){
        MongoClient client = null;
        try {
            client = MongoDBController.getMongoDBClient(Constants.DEFAULT_HOST);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        dataBase = MongoDBController.getMongoDataBase(client, Constants.DEFAULT_DB_NAME);
        messages = MongoDBController.getMongoDBCollection(dataBase, "messages");
    }
    @Override
    public Message getMessage(String id) {
        return null;
    }

    @Override
    public List<Message> getInboxMessagesForUser(String id) {
        return null;
    }

    @Override
    public List<Message> getOutboxMessagesForUser(String id) {
        return null;
    }

    @Override
    public boolean sendMessage(Message msg) {

//        BasicDBObject newMessage = new BasicDBObject("login", msg).
//                append("password", person.getPassword()).
//                append("firstname", person.getFirstname()).
//                append("secondname", person.getLastname()).
//                append("birthday", person.getBirthday()).
//                append("location", location).
//                append("education", education).
//                append ("email", person.getEmail()).
//                append("phone", person.getPhone()).
//                append("industry", person.getIndustry());

//        messages.save(newMessage);
        return false;
    }
}
