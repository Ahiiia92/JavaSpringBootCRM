package com.realestate.repository;

import com.realestate.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("contactRepository")
public interface ContactDAO extends JpaRepository<Contact, Long> {
    List<Contact> findByLastName(String lastName);

    @Query("SELECT c FROM Contact c where c.lastName LIKE %?1%")
    List<Contact> findByCity(String city);
}
