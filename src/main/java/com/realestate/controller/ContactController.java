package com.realestate.controller;

import com.realestate.exception.ResourceNotFoundException;
import com.realestate.model.Contact;
import com.realestate.repository.ContactDAO;
import com.realestate.services.ContactService;
import com.realestate.services.ContactServiceImplementation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping(value = {"admin/dashboard/contacts"})
public class ContactController {
    @Autowired
    private ContactService contactService;

//    @RequestMapping(value = "/new", method = RequestMethod.POST)
//    public String addPageContact(@ModelAttribute Contact contact, Model model) {
//        contactService.createContact(contact);
//        model.addAttribute("contacts", contactService.getAllContacts());
//        return "dashboard";
//    }

    // INDEX
    @GetMapping("")
    public String allContacts(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        model.addAttribute("contacts", contactList);

        return "contacts";
    }

    // NEW & CREATE
    @PostMapping("")
    public String saveContact(@Valid @ModelAttribute("contact") Contact contact,
                              BindingResult result,
                              ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        contactService.createContact(contact);
        model.addAttribute("contacts", contactService.getAllContacts());
        return "dashboard";
    }

//    // NEW
//    @GetMapping("/new")
//    public String showNewContactPage(Model model) {
//        Contact contact = new Contact();
//        model.addAttribute("contact", contact);
//        return "new_contact";
//    }
//    // CREATE
//    @PostMapping(value = "/save")
//    public String saveContact(@RequestBody Contact contact) {
//        Contact createdContact = new Contact();
//        contactService.createContact(contact);
//        return "dashboard";
//    }


    // SHOW
    @GetMapping("/{id}/show")
    public String showContact(Model model, @PathVariable Long id) {
        Contact contact = contactService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(("Contact does not exist with id: " + id)));
        ResponseEntity.ok(contact);
        model.addAttribute("contact", contact);
        return "show";
    }
    // TODO: EDIT
    @PutMapping("/{id}/show")
    public String updateContact(Model model, @PathVariable Long id, @RequestBody Contact contactDetails) {
        Contact contact = contactService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact doesn't exist with id: " + id));
        contact.setFirstName(contactDetails.getFirstName());
        contact.setLastName(contactDetails.getLastName());
        contact.setAddress(contactDetails.getAddress());
        contact.setZipCode(contactDetails.getZipCode());
        contact.setCity(contactDetails.getCity());
        contact.setEmail(contactDetails.getEmail());
        contact.setUsers(contactDetails.getUsers());

        Contact updatedContact = contactService.save(contact);
        ResponseEntity.ok(updatedContact);
        model.addAttribute("contact", contact);
        return "dashboard";
    }
//    public ModelAndView showEditProductPage(@PathVariable(name = "id") long id) {
//        ModelAndView mav = new ModelAndView("edit_form");
//        Contact contact = contactService.getContactById(id);
//        mav.addObject("contact", contact);
//
//        return mav;
//    }

    // UPDATE contact rest api
    @PutMapping("/contacts/{id}/edit_contact")
    public ResponseEntity<Contact> updateContact(@PathVariable Long id, @RequestBody Contact contactDetails) {
        Contact contact = contactService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact does not exist with id: " + id));

        contact.setFirstName(contactDetails.getFirstName());
        contact.setLastName(contactDetails.getFirstName());
        contact.setEmail(contactDetails.getEmail());
        contact.setAddress(contactDetails.getAddress());
        contact.setZipCode(contactDetails.getZipCode());
        contact.setCity(contactDetails.getCity());
        contact.setUsers(contactDetails.getUsers());

        Contact updatedContact = contactService.save(contact);

        return ResponseEntity.ok(updatedContact);
    }

    // TODO: DELETE
    @RequestMapping("/{id}/delete")
    public String deleteContact(@PathVariable(name = "id") long id) {
        contactService.deleteContact(id);
        return "redirect:/admin/dashboard";
    }
}
