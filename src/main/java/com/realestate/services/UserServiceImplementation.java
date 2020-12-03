package com.realestate.services;

import org.springframework.stereotype.Component;

@Component
public class UserServiceImplementation implements UserService {
    public boolean login(String username, String password) {
        if(username.equals("marou")) {
            if(password.equals("password")) {
                return true;
            }
        }
        return false;
    }
}
