package zopa.Entities;

import java.util.Collection;
import java.util.List;

/**
 * Created by milinchuk on 11/24/14.
 */
public class User {
    private String firstname;
    private String lastname;
    private String birthday;
    private List<String> emails;
    private List<String> phones;
    private String location;
    private List<String> education;
    private String photo;
    private String password;
    private String login;

    public User(){

    }

    public void setUser(User user) {

    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }

    public void setPhones(List<String> phones) {
        this.phones = phones;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setEducation(List<String> education) {
        this.education = education;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getBirthday() {
        return birthday;
    }

    public List<String> getEmails() {
        return emails;
    }

    public List<String> getPhones() {
        return phones;
    }

    public String getLocation() {
        return location;
    }

    public List<String> getEducation() {
        return education;
    }

    public String getPhoto() {
        return photo;
    }

    public String getPassword() {
        return password;
    }

    public String getLogin() {
        return login;
    }
}
