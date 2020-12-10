package com.realestate.repository;

import com.realestate.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("propertyService")
public interface PropertyDAO extends JpaRepository<Property, Long> {
}
