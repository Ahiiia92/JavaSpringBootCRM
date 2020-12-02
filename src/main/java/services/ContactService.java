package services;

import model.Contact;

import java.util.List;

// The service layer is optional – still recommended to perform additional business logic if any.
// Generally, we will connect with repository here for crud operations.
public interface ContactService {
    List<Contact> getAllContact();
    Contact getContactById(long contactId);

    Contact createContact(long id, Contact contact);
    // Create a contact also without ID:
    default Contact createContact(Contact contact) {
        long id = (long)(Math.random());
        return createContact(id, contact);
    }

    Contact updateContact(long id, Contact contact);
    Contact updateContact(Contact contact);

    void deleteContact(long id);
}
