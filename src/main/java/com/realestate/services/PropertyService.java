package com.realestate.services;

import com.realestate.model.Property;

import java.util.List;

public interface PropertyService {
    List<Property> findAllProperty();
    void createProperty(Property property);
}
