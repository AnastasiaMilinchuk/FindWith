package zopa.Entities;

import zopa.Entities.InnerEntities.Location;
import zopa.Entities.InnerEntities.Project;
import zopa.Entities.InnerEntities.UserEducation;

import java.util.List;

/**
 * Created by milinchuk on 11/24/14.
 */
public class Person extends User{
    private String birthday;
    private List<UserEducation> education;
    private String industry;
    private List<Experience> experience;
    private List<Project> projects;

    private List<String> followings;
    private List<String> skills;

    public Person(){

    }
    // Setters
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public void setExperience(List<Experience> experience) {
        this.experience = experience;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    public void setFollowings(List<String> followings) {
        this.followings = followings;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setEducation(List<UserEducation> education) {
        this.education = education;
    }


    // Getters

    public String getBirthday() {
        return birthday;
    }

    public List<UserEducation> getEducation() {
        return education;
    }

    public List<Experience> getExperience() {
        return experience;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public List<String> getFollowings() {
        return followings;
    }

    public List<String> getSkills() {
        return skills;
    }

}
