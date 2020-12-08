package com.realestate.controller;

import com.realestate.model.Contact;
import com.realestate.services.ContactService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;


import java.util.Optional;

@RunWith(SpringRunner.class)
@WebMvcTest(ContactController.class)
public class ContactControllerTest {

    @MockBean
    private ContactService mockContactService;

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void test_ShowPage_WithCorrectAttributes() throws Exception {
        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin");
        Mockito.when(mockContactService.findById((long) 1)).thenReturn(Optional.of(expectedContact));

        mockMvc.perform(get("/contacts/1"))
                .andExpect(status().isOk())
                .andExpect(model().attribute("contact", expectedContact))
                .andExpect(view().name("show"));
    }

    @Test
    public void test_GetMethod_withCorrectAttributes() throws Exception {

    }

    @Test
    public void test_PostMethod_withCorrectAttributes() throws Exception {

    }

    @Test
    public void test_DeleteMethod_withId() throws Exception {
    }
}
