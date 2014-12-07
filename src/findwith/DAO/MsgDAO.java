package findwith.DAO;

import findwith.Entities.Message;

import java.util.List;

/**
 * Created by click on 12/7/2014.
 */
public interface MsgDAO {
    public Message getMessage(String id);
    public List<Message> getInboxMessagesForUser(String id);
    public List<Message> getOutboxMessagesForUser(String id);
    public boolean sendMessage(Message msg);

}
