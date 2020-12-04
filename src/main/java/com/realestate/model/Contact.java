package com.realestate.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "CRM_Contacts")
public class Contact {
    @Id
    @GeneratedValue
    private long id;

    private String firstName;
    private String lastName;
    private String address;
    private String zipCode;
    private String city;
    private String email;
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name = "contact_id")
    private List<User> users;


    public Contact() { super(); }

    public Contact(String firstName, String lastName, String email, String Address, String zipCode, String city) {
        super();
//        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = Address;
        this.zipCode = zipCode;
        this.city = city;
        this.email = email;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

//    public List<User> getUsers() {
//        return users;
//    }
//
//    public void setUsers(List<User> users) {
//        this.users = users;
//    }

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", Address='" + address + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", city='" + city + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
