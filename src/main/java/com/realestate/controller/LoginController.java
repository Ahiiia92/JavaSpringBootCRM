package com.realestate.controller;

import com.realestate.model.User;
import com.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/login"})
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/{username}/{password}", method = RequestMethod.GET)
    public String login(@PathVariable("username") String username, @PathVariable("password") String password) {
        if(userService.login(username, password)) {
            System.out.println("login successful: " + username + " " + password);
            return "success";
        }
        System.out.println("login unsuccessful: given " + username + " " + password);
        return "error";
    }

    @PostMapping(value = {"/login"})
    public String processLogin(Model model) {
        model.addAttribute("user", model);
        return "success";
    }

    @GetMapping(value = {""})
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
