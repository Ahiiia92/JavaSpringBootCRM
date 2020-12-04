package com.realestate.services;

import com.realestate.model.Contact;
import com.realestate.model.User;
import com.realestate.repository.UserDAO;
import org.apache.velocity.exception.ResourceNotFoundException;
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

//    public User updateUser(long id, User user) {
//        Optional<User> userDb = userRepository.findById(id);
//
//        if(userDb.isPresent()) {
//            User userToUpdate = userDb.get();
//            userToUpdate.setId(user.getId());
//            userToUpdate.setFirstname(user.getFirstname());
//            userToUpdate.setLastname(user.getLastname());
//            userToUpdate.setUsername(user.getUsername());
//            userToUpdate.setPassword(user.getPassword());
//            userToUpdate.setRole(user.getRole());
//            userToUpdate.setEmail(user.getEmail());
//            userRepository.save(userToUpdate);
//            return userToUpdate;
//        } else {
//            throw new ResourceNotFoundException("Record not found with id : " + user.getId());
//        }
//    }
}
