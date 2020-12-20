package com.realestate.controller;

import com.realestate.model.Contact_status;
import com.realestate.model.Role;
import com.realestate.model.User;
import com.realestate.services.UserService;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/v1")
public class UserController {

    @Autowired
    private UserService userService;

    // TODO: Test: Works
    // Index
    @GetMapping("users")
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    // TODO: Test: Works
    // create user rest api
    @PostMapping("/users")
    public User createUser(Model model, @RequestBody User user) {
        List<String> roleList = Arrays.asList(
                Role.SALES_TEAM.toString(),
                Role.SALES_MANAGER.toString()
        );
        model.addAttribute("roleList", roleList);
        return userService.createNewUser(user);
    }

    // TODO: Test: Works
    // get user by id rest api
    @GetMapping("/users/{id}")
    public ResponseEntity< User > getUserById(@PathVariable Long id) {
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User does not exist with id :" + id));
        return ResponseEntity.ok(user);
    }

    // TODO: Test: Works
    // update user rest api
    @PutMapping("/users/{id}")
    public ResponseEntity < User > updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User does not exist with id :" + id));

        // If I put the update method in the UserServiceImplementation File. To Test
//        User updatedUser = userService.updateUser(id, userDetails);

        user.setFirstname(userDetails.getFirstname());
        user.setLastname(userDetails.getLastname());
        user.setEmail(userDetails.getEmail());
        user.setPassword(userDetails.getPassword());
        user.setRole(userDetails.getRole());
        user.setUsername(userDetails.getUsername());

        User updatedUser = userService.save(user);
        return ResponseEntity.ok(updatedUser);
    }

    // TODO: Test: Works
    // delete user rest api
    @DeleteMapping("/users/{id}")
    public ResponseEntity < Map < String, Boolean >> deleteEmployee(@PathVariable Long id) {
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User does not exist with id :" + id));

        userService.delete(user);
        Map< String, Boolean > response = new HashMap< >();
        response.put("deleted", Boolean.TRUE);
        return ResponseEntity.ok(response);
    }
}
