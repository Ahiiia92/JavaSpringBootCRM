package com.realestate.controller;

import com.realestate.model.User;
import com.realestate.services.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

@RunWith(SpringRunner.class)
@WebMvcTest(LoginController.class)
public class LoginControllerTest {
    @MockBean
    private UserService mockUserService;

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void test_showPage_renderAUser() throws Exception {
        User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", "sales repo");
        Mockito.when(mockUserService.findById((long) 1)).thenReturn(java.util.Optional.of(expectedUser));

        mockMvc.perform(get("/login/users/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("show"));
    }

    @Test
    public void test_GetMethod_AllUsers() throws Exception {
        mockMvc.perform(get("/login/users"))
                .andExpect(status().isOk())
                .andExpect(view().name("users"))
                .andDo(print());
    }

    @Test
    public void test_PostMethod_withCorrectAttributes() throws Exception {
        User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", "sales repo");
        mockMvc.perform(post("/login/users")
                .param("firstname", "Marie")
                .param("lastname", "Hess")
                .param("username", "Marie")
                .param("email", "m@a.de")
                .param("password", "marie")
                .param("role", "sales repo"))
                .andExpect(status().isOk());

        Mockito.verify(mockUserService).createNewUser(expectedUser);
    }

    @Test
    public void test_DeleteMethod_withId() throws Exception {
        User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", "sales repo");
        mockMvc.perform(delete("/login/users/1/delete"))
                .andExpect(status().isOk());
        Mockito.verify(mockUserService).delete(expectedUser);
    }
}