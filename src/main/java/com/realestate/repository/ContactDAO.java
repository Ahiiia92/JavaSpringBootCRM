package com.realestate.repository;

import com.realestate.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("contactRepository")
public interface ContactDAO extends JpaRepository<Contact, Long> {
}
