package com.realestate.services;

import com.realestate.model.Contact;
import com.realestate.repository.ContactDAO;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class ContactServiceImplementation implements ContactService {
    @Autowired
    private ContactDAO contactRepository;

    @Override
    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
    }

    @Override
    public Contact createContact(Contact contact) { contactRepository.save(contact);
        return contact;
    }

    @Override
    public List<Contact> findContactsByLastName(String lastName) {
        return contactRepository.findByLastName(lastName);
    }

    @Override
    public List<Contact> findContactsByCity(String city) {
        return contactRepository.findByCity(city);
    }

    @Override
    public Contact getContactById(Long contactId) {
        Optional<Contact> optContact = contactRepository.findById(contactId);
        return optContact.orElseGet(Contact::new);
    }

    @Override
    public Contact updateContact(long id, Contact contact) {
        Optional<Contact> contactDb = contactRepository.findById(id);

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
    public Contact save(Contact contact) {
        return contactRepository.save(contact);
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

    @Override
    public Optional<Contact> findById(Long id) { return contactRepository.findById(id); }

    @Override
    public List<Contact> findByUserId(Long userId) {
        return null;
    }
}
