package com.realestate.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Property {
    @Id
    @GeneratedValue
    private long id;

    private String availability;
    private int rooms;
    private float surface;
    private int price;

    public Property() { super(); }

    public Property(String availability, int rooms, float surface, int price) {
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

    public float getSurface() {
        return surface;
    }

    public void setSurface(float surface) {
        this.surface = surface;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

