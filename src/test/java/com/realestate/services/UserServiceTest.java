package com.realestate.services;

import com.realestate.model.Contact;
import com.realestate.model.Contact_status;
import com.realestate.model.Role;
import com.realestate.model.User;
import com.realestate.repository.ContactDAO;
import com.realestate.repository.UserDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Optional;

import static org.junit.Assert.assertEquals;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
        @Mock
        UserDAO repo;

        @InjectMocks
        UserServiceImplementation userServiceImplementation;

        @Test
        public void whenCreateNewUserIsCalledSaveIsCalledOnRepository() {
            User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", Role.SALES_TEAM);
            userServiceImplementation.createNewUser(expectedUser);
            Mockito.verify(repo).save(expectedUser);
        }

        @Test
        public void whenFindAllUsersIsCalledFindAllIsCalledOnRepository() {
            userServiceImplementation.getAllUsers();
            Mockito.verify(repo).findAll();
        }

//    @Test
//    public void whenFindUserByIdIsCalledWithExistingUserItIsReturned() {
//        User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", Role.SALES_TEAM);
//        Mockito.when(repo.findById((long) 1)).thenReturn(java.util.Optional.of(expectedUser));
//
//        Optional<User> actualUser = userServiceImplementation.findById((long) 1);
//        assertEquals(expectedUser, actualUser);
//    }
}
