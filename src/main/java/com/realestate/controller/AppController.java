package com.realestate.controller;

import com.realestate.model.Contact;
import com.realestate.model.User;
import com.realestate.repository.ContactDAO;
import com.realestate.services.ContactService;
import com.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.realestate.services.ContactServiceImplementation;

import java.util.List;

@Controller
@RequestMapping(value = {""})
public class AppController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    @RequestMapping("/admin/dashboard")
    public String show(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        List<User> userList = userService.getAllUsers();
        model.addAttribute("contacts", contactList);
        model.addAttribute("users", userList);
        return "dashboard";
    }

    @GetMapping({"/", "index"})
    public String index(Model model, @RequestParam(value = "name", required = false, defaultValue = "Marou") String name) {
        model.addAttribute("name", name);
        Contact c1 = new Contact();
        c1.setFirstName("Marie");
        c1.setLastName("Hess");
        c1.setAddress("lallaal");
        c1.setZipCode("13453");
        c1.setCity("München");
        c1.setEmail("marie@hess.de");
        return "index";
    }

    @GetMapping("/new")
    public String newContact(Model model, @RequestParam(value = "firstName", required = true, defaultValue = "NoFirstname") String firstName) {
        model.addAttribute("firstName", firstName);
        return "new";
    }

    @RequestMapping("/list_contacts")
    public String listContacts(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        model.addAttribute("contacts", contactList);

        return "list_contacts";
    }

}
