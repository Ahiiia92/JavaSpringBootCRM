package com.realestate.services;

import org.springframework.stereotype.Service;

@Service("userService")
public interface UserService {
    boolean login(String username, String password);
}
