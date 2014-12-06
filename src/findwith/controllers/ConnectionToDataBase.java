package findwith.controllers;

import com.mongodb.DB;
import com.mongodb.MongoClient;

import java.net.UnknownHostException;

/**
 * Created by milinchuk on 11/16/14.
 */
public class ConnectionToDataBase {
    private static DB dataBase;

    public static void set(String dbClient, String dbName) throws UnknownHostException {
        MongoClient client = MongoDBController.getMongoDBClient(dbClient);
        dataBase = MongoDBController.getMongoDataBase(client, dbName);
    }

    public static DB get(){
        return dataBase;
    }

}
