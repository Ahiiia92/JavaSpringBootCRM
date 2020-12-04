package com.realestate.controller;

import com.realestate.model.User;
import com.realestate.services.UserService;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/v1")
public class UserController {

    @Autowired
    private UserService userService;

    // Index
    @GetMapping("users")
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    // create user rest api
    @PostMapping("/users")
    public User createUser(@RequestBody User user) {
        return userService.createNewUser(user);
    }

    // get user by id rest api
    @GetMapping("/users/{id}")
    public ResponseEntity< User > getUserById(@PathVariable Long id) {
        User user = userService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User does not exist with id :" + id));
        return ResponseEntity.ok(user);
    }

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
