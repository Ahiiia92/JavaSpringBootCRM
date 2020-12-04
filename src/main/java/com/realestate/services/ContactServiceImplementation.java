package com.realestate.services;

import com.realestate.model.Contact;
import com.realestate.repository.ContactDAO;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class ContactServiceImplementation implements ContactService {
    @Autowired
    private ContactDAO contactRepository;

    @Override
    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
        // HARD GECODET DATA
//        List<Contact> listContact = new ArrayList<>();
//        listContact.add(new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'aglieser", "56531", "berlin"));
//        listContact.add(new Contact("jean", "John", "marry.drfg@gmail.com", "dsrfhjkjhr", "56531", "berlin"));
//        listContact.add(new Contact("John", "John", "dsgbjg.john@gmail.com", "dfghjdfg", "56531", "paris"));
//        return listContact;
    }

    @Override
    public Contact getContactById(long contactId) {
        return contactRepository.findById(contactId).get();
    }

    @Override
    public Contact createContact(long id, Contact contact) {
        return contactRepository.save(contact);
    }

    @Override
    public Contact createContact(Contact contact) {
        List<Contact> contactList = new ArrayList<>();
        Contact contact1 = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'aglieser", "56531", "berlin");
        Contact contact2 = new Contact("jean", "John", "marry.drfg@gmail.com", "dsrfhjkjhr", "56531", "berlin");

        contactList.add(contact1);
        contactList.add(contact2);

        contactRepository.save(contact1);
        contactRepository.save(contact2);
        System.out.println(contactRepository.save(contact1));
        System.out.println(contactRepository.save(contact2));
        System.out.println(contactList);
        return (Contact) contactList;
    }

    @Override
    public Contact updateContact(long id, Contact contact) {
        Optional<Contact> contactDb = contactRepository.findById(contact.getId());

        if(contactDb.isPresent()) {
            Contact contactToUpdate = contactDb.get();
            contactToUpdate.setId(contact.getId());
            contactToUpdate.setFirstName(contact.getFirstName());
            contactToUpdate.setLastName(contact.getLastName());
            contactToUpdate.setAddress(contact.getAddress());
            contactToUpdate.setZipCode(contact.getZipCode());
            contactToUpdate.setCity(contact.getCity());
            contactToUpdate.setEmail(contact.getEmail());
            contactRepository.save(contactToUpdate);
            return contactToUpdate;
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + contact.getId());
        }
    }

    @Override
    public Contact updateContact(Contact contact) {
        return null;
    }

    @Override
    public void deleteContact(long id) {
        Optional <Contact> contactDb = contactRepository.findById(id);

        if(contactDb.isPresent()) {
            this.contactRepository.delete(contactDb.get());
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + id);
        }
    }
}
