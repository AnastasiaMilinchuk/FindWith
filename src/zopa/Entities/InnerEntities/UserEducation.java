package zopa.Entities.InnerEntities;

/**
 * Created by milinchuk on 11/25/14.
 */
public class UserEducation {
    private String university;
    private String faculty;
    private Integer graduateYear;

    public UserEducation(){

    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public int getGraduateYear() {
        return graduateYear;
    }

    public void setGraduateYear(Integer graduateYear) {
        this.graduateYear = graduateYear;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }
}
