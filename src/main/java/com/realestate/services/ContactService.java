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
    Contact getContactById(long contactId);

    Contact createContact(long id, Contact contact);

    // Create a contact also without ID:
    default Contact createContact(Contact contact) {
        long id = (long)(Math.random());
        return createContact(id, contact);
    }

    Contact updateContact(long id, Contact contact);
    Contact updateContact(Contact contact);

    Contact save(Contact contact);

    void deleteContact(long id);

    Optional<Contact> findById(Long id);
}
