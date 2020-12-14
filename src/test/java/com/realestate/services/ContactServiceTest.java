package com.realestate.services;

import com.realestate.model.Contact;
import com.realestate.model.Contact_status;
import com.realestate.repository.ContactDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import java.awt.*;
import java.util.Optional;

import static org.junit.Assert.assertEquals;

@RunWith(MockitoJUnitRunner.class)
public class ContactServiceTest {
    @Mock
    ContactDAO repo;

    @InjectMocks
    ContactServiceImplementation contactServiceImplementation;

    @Test
    public void whenCreateNewContactIsCalledSaveIsCalledOnRepository() {
        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin", Contact_status.LEAD);
        contactServiceImplementation.createContact(expectedContact);
        Mockito.verify(repo).save(expectedContact);
    }

    @Test
    public void whenFindAllContactsIsCalledFindAllIsCalledOnRepository() {
        contactServiceImplementation.getAllContacts();
        Mockito.verify(repo).findAll();
    }

//    @Test
//    public void whenFindContactByIdIsCalledWithExistingContactItIsReturned() {
//        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin", Contact_status.LEAD);
//        Mockito.when(repo.findById((long) 1)).thenReturn(java.util.Optional.of(expectedContact));
//
//        Optional<Contact> actualContact = contactServiceImplementation.findById(1);
//        assertEquals(expectedContact, actualContact);
//    }
}
