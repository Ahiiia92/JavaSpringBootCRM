package com.realestate.controller;

import com.realestate.exception.ResourceNotFoundException;
import com.realestate.model.Contact;
import com.realestate.repository.ContactDAO;
import com.realestate.services.ContactService;
import com.realestate.services.ContactServiceImplementation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping(value = {"admin/dashboard/contacts"})
public class ContactController {
    private final ContactService contactService;
    ContactDAO contactRepository;

    @Autowired
    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

//    @RequestMapping(value = "/new", method = RequestMethod.POST)
//    public String addPageContact(@ModelAttribute Contact contact, Model model) {
//        contactService.createContact(contact);
//        model.addAttribute("contacts", contactService.getAllContact());
//        return "dashboard";
//    }

    // NEW
    @GetMapping("/new")
    public String showNewContactPage(Model model) {
        Contact contact = new Contact();
        model.addAttribute("contact", contact);
        return "new_contact";
    }
    // CREATE
    @PostMapping(value = "/save")
    public String saveContact(@RequestBody Contact contact) {
        contactService.createContact(contact);
        return "redirect:/contacts";
    }
    // INDEX
    @GetMapping("")
    public String allContacts(Model model) {
        List<Contact> contactList = contactService.getAllContacts();
        model.addAttribute("contacts", contactList);

        return "contacts";
    }
//
//    // SHOW
    @GetMapping("/{id}")
    public ModelAndView getContactById(@PathVariable long id) {
        ModelAndView mavShow = new ModelAndView("{id}");
        Contact contact = contactService.getContactById(id);
        mavShow.addObject("contact", contact);

        return mavShow;
    }
//    // EDIT
    @RequestMapping("/edit/{id}")
    public ModelAndView showEditProductPage(@PathVariable(name = "id") long id) {
        ModelAndView mav = new ModelAndView("edit_form");
        Contact contact = contactService.getContactById(id);
        mav.addObject("contact", contact);

        return mav;
    }
    // UPDATE
//    @GetMapping(value = {""})
//    public ModelAndView getContact() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("contacts");
//        return modelAndView;
//    }
    // DELETE
    @RequestMapping("/delete/{id}")
    public String deleteContact(@PathVariable(name = "id") long id) {
        contactService.deleteContact(id);
        return "redirect:/admin/dashboard";
    }
}
