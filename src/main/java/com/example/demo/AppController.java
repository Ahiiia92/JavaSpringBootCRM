package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @RequestMapping("/list_contacts")
    public String allContacts() {
        return "list_contacts";
    }
    @GetMapping("/new")
    public String newContact(Model model, @RequestParam(value = "firstName", required = true, defaultValue = "NoFirstname") String firstName) {
        model.addAttribute("firstName", firstName);
        return "new";
    }
}
