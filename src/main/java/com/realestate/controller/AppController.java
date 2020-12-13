package com.realestate.controller;

import com.realestate.model.Contact;
import com.realestate.model.Property;
import com.realestate.model.User;
import com.realestate.repository.ContactDAO;
import com.realestate.services.ContactService;
import com.realestate.services.PropertyService;
import com.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = {""})
public class AppController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    @Autowired
    private PropertyService propertyService;

    @RequestMapping("/admin/dashboard")
    public String show(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        List<User> userList = userService.getAllUsers();
        List<Property> propertyList = propertyService.findAllProperty();
        model.addAttribute("contacts", contactList);
        model.addAttribute("users", userList);
        model.addAttribute("properties", propertyList);

        return "dashboard";
    }

//    @PostMapping("/deleteProperty")
//    public String deleteProperty(ModelMap model, @RequestParam long id) {
//        propertyService.removeProperty(id);
//        model.addAttribute("properties", propertyService.findAllProperty());
//        model.addAttribute("contacts", contactService.getAllContacts());
//        model.addAttribute("users", userService.getAllUsers());
//        return "redirect:/admin/dashboard";
//    }
//
//    @PostMapping("/deleteContact")
//    public String deleteContact(ModelMap model, @RequestParam long id) {
//        contactService.deleteContact(id);
//        model.addAttribute("properties", propertyService.findAllProperty());
//        model.addAttribute("contacts", contactService.getAllContacts());
//        model.addAttribute("users", userService.getAllUsers());
//        return "redirect:/admin/dashboard";
//    }

    @GetMapping({"/", "index"})
    public String index() {
        return "index";
    }
}
