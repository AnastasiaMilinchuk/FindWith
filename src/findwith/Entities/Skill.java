package findwith.Entities;

/**
 * Created by milinchuk on 12/14/14.
 */
public class Skill {

    private String name;
    private double count;
    private double avgYear;

    public double getAvgYear() {
        return avgYear;
    }

    public void setAvgYear(double avgYear) {
        this.avgYear = avgYear;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCount() {
        return count;
    }

    public void setCount(double count) {
        this.count = count;
    }


}
