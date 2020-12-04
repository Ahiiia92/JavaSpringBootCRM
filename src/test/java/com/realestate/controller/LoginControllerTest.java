//package com.realestate.controller;
//
//import com.realestate.model.User;
//import com.realestate.services.UserService;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.mockito.Mock;
//import org.mockito.Mockito;
//import org.mockito.MockitoAnnotations;
//
//public class LoginControllerTest {
//    User user;
//    LoginController loginController;
//
//    @Mock
//    UserService mockUserService;
//
//
//    @Before
//    public void setUp() throws Exception {
//        MockitoAnnotations.initMocks(this);
//        user = new User("isa", "arnlt", "zab", "m@m.de", "123456", "Manager");
//        loginController = new LoginController();
//    }
//
//    @Test
//    public void test_createUser() {
//        loginController.saveNewUser(new User("isa", "arnlt", "zab", "m@m.de", "123456", "Manager"));
//        Mockito.verify(mockUserService).createNewUser(user);
//    }
//}
