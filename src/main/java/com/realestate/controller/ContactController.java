package com.realestate.controller;

import com.realestate.exception.ResourceNotFoundException;
import com.realestate.model.Contact;
import com.realestate.model.Contact_status;
import com.realestate.model.User;
import com.realestate.repository.ContactDAO;
import com.realestate.services.ContactService;
import com.realestate.services.ContactServiceImplementation;
import oracle.ucp.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping(value = {"admin/dashboard/contacts"})
public class ContactController {
    @Autowired
    private ContactService contactService;

    // INDEX ==> Works
    @GetMapping("")
    public String allContacts(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        List<String> statusList = Arrays.asList(
                Contact_status.LEAD.toString(),
                Contact_status.OPPORTUNITY.toString(),
                Contact_status.CLOSE_LOST.toString(),
                Contact_status.CLOSE_WIN.toString()
        );
        model.addAttribute("statusList", statusList);
        model.addAttribute("contacts", contactList);

        return "contacts";
    }

//    @PostMapping("")
//    public String createNewContact(Model model, @RequestBody Contact contact) {
//        contactService.createContact(contact);
//        model.addAttribute("contact", contactService.getAllContacts());
//        return "contacts";
//    }

    // NEW Avec une page differente // MAPPING WORKS + PARAMS
    @GetMapping("/new")
    public String showNewContactPage(Model model, @ModelAttribute Contact contact) {
        Contact contactCreatead = new Contact();
        List<String> statusList = Arrays.asList(
                Contact_status.LEAD.toString(),
                Contact_status.OPPORTUNITY.toString(),
                Contact_status.CLOSE_LOST.toString(),
                Contact_status.CLOSE_WIN.toString()
        );
        model.addAttribute("statusList", statusList);
        model.addAttribute("contact", contact);
        return "new_contact";
    }
    // CREATE // MAPPING WORKS // WOOOORKS (only select doesn't)
    @PostMapping("/save")
    public String addNewContact(ModelMap model, @ModelAttribute Contact contact) {
        contactService.createContact(contact);
        model.addAttribute("contact", contactService.getAllContacts());
        return "redirect:/admin/dashboard/contacts";
    }

    // SHOW
    @GetMapping("/{id}/show")
    public String showContact(Model model, @PathVariable Long id) {
        Contact contact = contactService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(("Contact does not exist with id: " + id)));
        List<String> statusList = Arrays.asList(
                Contact_status.LEAD.toString(),
                Contact_status.OPPORTUNITY.toString(),
                Contact_status.CLOSE_LOST.toString(),
                Contact_status.CLOSE_WIN.toString()
        );
        model.addAttribute("statusList", statusList);
        ResponseEntity.ok(contact);
        model.addAttribute("contact", contact);
        return "show";
    }

    @GetMapping("/{id}/edit")
    public ModelAndView showEditContactPage(Model model, @PathVariable Long id) {
        ModelAndView mav = new ModelAndView("edit");
        Contact contact = contactService.getContactById(id);
        List<String> statusList = Arrays.asList(
                Contact_status.LEAD.toString(),
                Contact_status.OPPORTUNITY.toString(),
                Contact_status.CLOSE_LOST.toString(),
                Contact_status.CLOSE_WIN.toString()
        );
        model.addAttribute("statusList", statusList);
        mav.addObject("contact", contact);

        return mav;
    }

    // TODO: EDIT
    @PutMapping("/{id}/edit")
    public String updateContact(Model model, @PathVariable Long id, @ModelAttribute Contact contactDetails) {
        Contact contact = contactService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact doesn't exist with id: " + id));
        contact.setFirstName(contactDetails.getFirstName());
        contact.setLastName(contactDetails.getLastName());
        contact.setAddress(contactDetails.getAddress());
        contact.setZipCode(contactDetails.getZipCode());
        contact.setCity(contactDetails.getCity());
        contact.setEmail(contactDetails.getEmail());
        contact.setUser(contactDetails.getUser());
        contact.setContact_status(contactDetails.getContact_status());

        Contact updatedContact = contactService.save(contact);
        ResponseEntity.ok(updatedContact);
        model.addAttribute("contact", contactService.getContactById(contact.getId()));
        return "redirect:/admin/dashboard/contacts";
    }

    @PostMapping("/deleteContact")
    public String deleteContact(ModelMap mode, @RequestParam long id) {
        contactService.deleteContact(id);
        mode.addAttribute("contacts", contactService.getAllContacts());
        return "redirect:/admin/dashboard/contacts";
    }

    // TODO: Link Contact to Users. A contact belongs to a specific user. Need to do the link with the Instructor repo and contaxct repo.
    @GetMapping("/login/users/{userId}/contacts")
    public List < Contact > getContactsByUser (@PathVariable(value = "postId") Long userId) {
        return contactService.findByUserId(userId);
    }
}
