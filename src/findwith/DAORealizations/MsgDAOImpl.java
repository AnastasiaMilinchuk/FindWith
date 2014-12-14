package findwith.DAORealizations;

import com.mongodb.*;
import findwith.Constants;
import findwith.DAO.MsgDAO;
import findwith.Entities.Message;
import findwith.Entities.Person;
import findwith.controllers.MongoDBController;
import org.bson.types.ObjectId;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
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
    public List<Message> getInboxMessagesForUser(String email) {
        return getMessagesByDirection("to",email);

    }

    @Override
    public List<Message> getOutboxMessagesForUser(String email) {
        return getMessagesByDirection("from",email);
    }

    @Override
    public boolean sendMessage(Message msg) {
        BasicDBObject newMessage = new BasicDBObject("from", msg.getFromEmail()).
                append("to", msg.getToEmail()).
                append("subject", msg.getSubject()).
                append("text", msg.getText()).
                append("time", msg.getTime());
        messages.save(newMessage);
        return true;
    }
    private List<Message> getMessagesByDirection(String direction, String email){
        BasicDBObject message = new BasicDBObject();
        message.append(direction, email);
        DBCursor dbCursor = messages.find(message);
        ArrayList<Message> result = new ArrayList<Message>();

        while(dbCursor.hasNext()){
            DBObject next = dbCursor.next();
            Message temp = new Message();
            temp.setText((String) next.get("text"));
            temp.setFromEmail((String) next.get("from"));
            temp.setToEmail((String) next.get("to"));
            temp.setSubject((String) next.get("subject"));
            temp.setTime((Date)next.get("time"));
            result.add(temp);
        }
        return result;
    }

    public String getNameById(String id){
        String name = new String();
        DBCollection users = MongoDBController.getMongoDBCollection(dataBase, "users");
        ObjectId _id = new ObjectId(id);
        BasicDBObject findQuery = new BasicDBObject("_id", _id);
        DBCursor usrs = users.find(findQuery);
        for(DBObject u: usrs){
           name = u.get("firstname").toString();
           name += " " + u.get("secondname").toString();
        }

        return name;
    }
}
