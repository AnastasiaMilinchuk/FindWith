package findwith.DAORealizations;

import com.mongodb.*;
import findwith.Constants;
import findwith.Entities.Industry;
import findwith.Entities.Skill;
import findwith.Entities.TopCountry;
import findwith.controllers.MongoDBController;

import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by milinchuk on 12/14/14.
 */
public class StatisticImpl {
    DB dataBase;
    public StatisticImpl (){
        MongoClient client = null;
        try {
            client = MongoDBController.getMongoDBClient(Constants.DEFAULT_HOST);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        dataBase = MongoDBController.getMongoDataBase(client, Constants.DEFAULT_DB_NAME);
    }

    public List<Skill> getTopSkills(){
        CommandResult res = dataBase.doEval("topSkill");
        DBCollection skills = MongoDBController.getMongoDBCollection(dataBase, "topSkills");
        BasicDBList topSkills  = (BasicDBList)((BasicDBObject)skills.findOne()).get("_firstBatch");
        List<Skill> answer = new LinkedList<Skill>();
        for(Object skill: topSkills){
            Skill s = new Skill();
            s.setName(((BasicDBObject)skill).get("_id").toString());
            s.setCount(Double.parseDouble(((BasicDBObject) ((BasicDBObject) skill).get("value")).get("count").toString()));
            s.setAvgYear(Double.parseDouble(((BasicDBObject) ((BasicDBObject) skill).get("value")).get("year").toString()));
            answer.add(s);
        }
        return answer;
    }

    public List<Industry> getTopIndustries(){
        CommandResult res = dataBase.doEval("topIndustries");
        DBCollection industries = MongoDBController.getMongoDBCollection(dataBase, "topIndustries");
        BasicDBList topIndustries = (BasicDBList)((BasicDBObject)industries.findOne()).get("_firstBatch");
        List<Industry> answer = new LinkedList<Industry>();
        for(Object industry: topIndustries){
            Industry ind = new Industry();
            ind.setName(((BasicDBObject) industry).get("_id").toString());
            ind.setCount(Double.parseDouble((((BasicDBObject) industry).get("quantity")).toString()));
            answer.add(ind);
        }
        return answer;
    }

    public List<String> getCitiesForTopIndustry(){
        CommandResult res = dataBase.doEval("topIndustryCities");
        DBCollection cities = MongoDBController.getMongoDBCollection(dataBase, "topIndustryCities");
        BasicDBList topCities = (BasicDBList)((BasicDBObject)((BasicDBObject)cities.findOne()).
                get("value")).
                get("location");

        List<String> citiesList = new LinkedList<String>();
        for(Object city: topCities){
            if (!citiesList.contains(city.toString()))
            citiesList.add(city.toString());
        }

        return citiesList;
    }

    public TopCountry getTopCountry(){
        CommandResult res = dataBase.doEval("topCountry");
        DBCollection country = MongoDBController.getMongoDBCollection(dataBase, "topCountry");
        BasicDBObject topCountry = (BasicDBObject)country.findOne();
        TopCountry c = new TopCountry();
        c.setCountry(((BasicDBObject)(((BasicDBObject)topCountry.get("country")).
                get("location"))).
                get("country").toString());
        c.setCount(Double.parseDouble(topCountry.get("count").toString()));
        return c;
    }
}
