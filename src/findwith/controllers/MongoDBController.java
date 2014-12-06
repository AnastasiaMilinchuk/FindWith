package findwith.controllers;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

import java.net.UnknownHostException;

/**
 * Created by milinchuk on 10/26/14.
 */
public class MongoDBController {
    public static MongoClient getMongoDBClient(String url) throws UnknownHostException {
         return new MongoClient(url);
    }

    public static DB getMongoDataBase(MongoClient client, String database) {
        return client.getDB(database);
    }

    public static DBCollection getMongoDBCollection(DB database, String collection) {
        return database.getCollection(collection);
    }
}
