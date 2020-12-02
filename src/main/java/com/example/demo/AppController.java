package com.example.demo;

import model.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import services.ContactService;
import services.ContactServiceImplementation;

import java.util.List;

@Controller
public class AppController {

    @RequestMapping("/dashboard")
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

        System.out.println(contactList);

        model.addAttribute("contacts", contactList);

        return "list_contacts";
    }

}
