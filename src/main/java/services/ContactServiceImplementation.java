package services;

import model.Contact;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ContactRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ContactServiceImplementation implements ContactService {
    @Autowired
    private ContactRepository contactRepository;

    @Override
    public List<Contact> getAllContact() {
        return contactRepository.findAll();
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
        return contactRepository.save(contact);
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
