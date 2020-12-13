package com.realestate.controller;

import com.realestate.exception.ResourceNotFoundException;
import com.realestate.model.Contact;
import com.realestate.model.User;
import com.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

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

    // INDEX
    @GetMapping("users")
    public String showAllUsers(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("users", userList);
        return "users";
    }

    // NEW
    @GetMapping("/new")
    public String showNewUserPage(Model model, @ModelAttribute User user) {
        List<String> roleList = Arrays.asList("Sales Team", "Sales Manager");
        model.addAttribute("user", user);
        model.addAttribute("roleList", roleList);
        return "sign_up";
    }

    // CREATE USER WITH UI
    @PostMapping("/register")
    public String saveNewUser(Model model, @ModelAttribute User user) {
        userService.createNewUser(user);
        model.addAttribute("user", userService.findById(user.getId()));
        return "success";
    }

    // EDIT USER WITH UI
//    @GetMapping("/users/{id}")
//    public String editUser(@PathVariable Long id, @RequestBody User userDetails) {
//        User user = userService.findById(id)
//                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id :" + id));
//        updateUser(id, userDetails);
//    }

    @GetMapping("users/{id}/show")
    public String showUser(Model model, @PathVariable Long id) {
        List<String> roleList = Arrays.asList("Sales Team", "Sales Manager");
        model.addAttribute("roleList", roleList);

        User user = userService.findById(id).orElseThrow(() -> new ResourceNotFoundException("User does not exist with id: " + id));
        ResponseEntity.ok(user);
        model.addAttribute("user", user);
        return "show";
    }

    // TODO: UPDATE USER WITH UI
    @PutMapping("users/{id}/show")
    public String updateUser(Model model, @PathVariable Long id, @RequestBody User userDetails) {
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id :" + id));
        user.setFirstname(userDetails.getFirstname());
        user.setLastname(userDetails.getLastname());
        user.setEmail(userDetails.getEmail());
        user.setPassword(userDetails.getPassword());
        user.setRole(userDetails.getRole());
        user.setUsername(userDetails.getUsername());

        User updatedUser = userService.save(user);
        ResponseEntity.ok(updatedUser);
        model.addAttribute("user", userService.findById(updatedUser.getId()));
        return "redirect:/show";
    }

    @PostMapping("users/deleteUser")
    public String deleteUserById(ModelMap model, @RequestParam long id) {
        User user = userService.findById(id)
                .orElseThrow(() -> new org.apache.velocity.exception.ResourceNotFoundException("User does not exist with id :" + id));
        userService.delete(user);
        model.addAttribute("users", userService.getAllUsers());
        return "redirect:/login/users";
    }
}
