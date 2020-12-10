package com.realestate.services;

import com.realestate.model.Property;
import com.realestate.repository.PropertyDAO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PropertyServiceImplementation implements PropertyService{
    @Autowired
    private PropertyDAO propertyRepo;

    @Override
    public List<Property> findAllProperty() {
        return null;
    }

    @Override
    public void createProperty(Property property) {

    }
}
