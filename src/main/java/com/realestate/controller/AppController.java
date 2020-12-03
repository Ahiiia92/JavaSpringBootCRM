package com.realestate.controller;

import com.realestate.model.Contact;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.realestate.services.ContactServiceImplementation;

import java.util.List;

@Controller
@RequestMapping(value = {""})
public class AppController {

    @RequestMapping("/admin/dashboard")
    public String show() {
        return "dashboard";
    }

    @GetMapping({"/", "index"})
    public String index(Model model, @RequestParam(value = "name", required = false, defaultValue = "World") String name) {
        model.addAttribute("name", name);
        return "index";
    }

    @GetMapping("/new")
    public String newContact(Model model, @RequestParam(value = "firstName", required = true, defaultValue = "NoFirstname") String firstName) {
        model.addAttribute("firstName", firstName);
        return "new";
    }

    @RequestMapping("/list_contacts")
    public String listContacts(Model model) {
        ContactServiceImplementation implementation = new ContactServiceImplementation();
        List<Contact> contactList = implementation.getAllContact();
        model.addAttribute("contacts", contactList);

        return "list_contacts";
    }

}
