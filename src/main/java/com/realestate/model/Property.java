package com.realestate.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table
public class Property {
    @Id
    @GeneratedValue
    private long id;

    private String availability;
    private int rooms;
    private double surface;
    private int price;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "contact_id")
    private Contact contact;

    public Property() { super(); }

    public Property(String availability, int rooms, double surface, int price) {
        this.availability = availability;
        this.rooms = rooms;
        this.surface = surface;
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public double getSurface() {
        return surface;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setSurface(double surface) {
        this.surface = surface;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    @Override
    public String toString() {
        return "Properties{" +
                "id=" + id +
                ", availability='" + availability + '\'' +
                ", rooms=" + rooms +
                ", surface=" + surface +
                ", price=" + price +
                '}';
    }
}

