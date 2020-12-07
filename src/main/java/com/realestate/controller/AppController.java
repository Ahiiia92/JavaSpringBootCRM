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
    public String index() {
        return "index";
    }
}
