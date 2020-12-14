package com.realestate.services;

import com.realestate.model.Property;
import com.realestate.model.User;
import com.realestate.repository.PropertyDAO;
import com.realestate.repository.UserDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Optional;

import static org.junit.Assert.assertEquals;


@RunWith(MockitoJUnitRunner.class)
public class PropertyServiceTest {
    @Mock
    PropertyDAO repo;

    @InjectMocks
    PropertyServiceImplementation propertyServiceImplementation;

    @Test
    public void whenCreateNewPropertyIsCalledSaveIsCalledOnRepository() {
        Property expectedProperty = new Property("2020", 4, 53.45, 150_000);
        propertyServiceImplementation.createProperty(expectedProperty);
        Mockito.verify(repo).save(expectedProperty);
    }

    @Test
    public void whenFindAllPropertiesIsCalledFindAllIsCalledOnRepository() {
        propertyServiceImplementation.findAllProperty();
        Mockito.verify(repo).findAll();
    }

//    @Test
//    public void whenFindPropertyByIdIsCalledWithExistingUserItIsReturned() {
//        Property expectedProperty = new Property("2020", 4, 53.45, 150_000);
//        Mockito.when(repo.findById((long) 1)).thenReturn(java.util.Optional.of(expectedProperty));
//
//        Optional<Property> actualProperty = propertyServiceImplementation.findById(1);
//        assertEquals(expectedProperty, actualProperty);
//    }
}
