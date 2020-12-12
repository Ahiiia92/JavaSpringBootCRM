package com.realestate.services;

import com.realestate.model.Property;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("propertyService")
public interface PropertyService {
    List<Property> findAllProperty();
    void createProperty(Property property);

    Optional<Property> findById(long id);

    void deleteProperty(long id);

    Property save(Property property);

    void removeProperty(long id);
}
