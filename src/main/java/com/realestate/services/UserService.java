package com.realestate.services;

import com.realestate.model.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("userService")
public interface UserService {
    boolean login(String username, String password);
    User createNewUser(User user);
    List<User> getAllUsers();

    Optional<User> findById(Long id);

//    User updateUser(long id, User userDetails);

    User save(User user);

    void delete(User user);
}
