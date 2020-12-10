package com.realestate.services;

import com.realestate.model.Contact;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// The service layer is optional – still recommended to perform additional business logic if any.
// Generally, we will connect with repository here for crud operations.

@Service("contactService")
public interface ContactService {
    List<Contact> getAllContacts();
    List<Contact> findContactsByLastName(String lastName);
    List<Contact> findContactsByCity(String city);
    Contact getContactById(Long contactId);

    void createContact(Contact contact);

    Contact updateContact(long id, Contact contact);
    Contact updateContact(Contact contact);

    Contact save(Contact contact);

    void deleteContact(long id);

    Optional<Contact> findById(Long id);
}
