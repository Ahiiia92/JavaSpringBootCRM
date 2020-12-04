package com.realestate.services;

import com.realestate.model.User;
import com.realestate.repository.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Component
public class UserServiceImplementation implements UserService {
    @Autowired
    private UserDAO userRepository;

    public boolean login(String username, String password) {
        if(username.equals("marou")) {
            if(password.equals("password")) {
                return true;
            }
        }
        return false;
    }

    @Override
    public User createNewUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }

//    @Override
//    public User updateUser(long id, User userDetails) {
//        User user = userRepository.findById(id);
//
//        user.setFirstname(userDetails.getFirstname());
//        user.setLastname(userDetails.getLastname());
//        user.setEmail(userDetails.getEmail());
//        user.setPassword(userDetails.getPassword());
//        user.setRole(userDetails.getRole());
//        user.setUsername(userDetails.getUsername());
//
//        return userRepository.save(user);
//    }

}
