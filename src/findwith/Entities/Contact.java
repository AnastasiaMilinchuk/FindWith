package findwith.Entities;

import org.bson.types.ObjectId;

/**
 * Created by milinchuk on 12/11/14.
 */
public class Contact {
    private String photo;
    private String firstname;
    private String lastname;
    private String email;
    private String id;

    public String get_id() {
        return id;
    }

    public void set_id(String id) {
        this.id = id;
    }



    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }




}
