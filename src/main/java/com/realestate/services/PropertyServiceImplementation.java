package com.realestate.services;

import com.realestate.model.Property;
import com.realestate.repository.PropertyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class PropertyServiceImplementation implements PropertyService{
    @Autowired
    private PropertyDAO propertyRepo;

    @Override
    public List<Property> findAllProperty() {
        return propertyRepo.findAll();
    }

    @Override
    public void createProperty(Property property) {
        propertyRepo.save(property);
    }

    @Override
    public Optional<Property> findById(long id) {
        return propertyRepo.findById(id);
    }

    @Override
    public void deleteProperty(long id) {
        propertyRepo.deleteById(id);
    }

    @Override
    public Property save(Property property) {
        return propertyRepo.save(property);
    }

    @Override
    public void removeProperty(long id) {
        propertyRepo.deleteById(id);
    }
}
