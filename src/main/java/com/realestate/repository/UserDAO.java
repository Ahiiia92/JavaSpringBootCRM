package com.realestate.repository;

import com.realestate.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserDAO extends JpaRepository<User, Long> {
}
