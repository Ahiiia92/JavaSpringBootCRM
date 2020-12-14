package com.realestate.controller;

import com.realestate.model.Contact;
import com.realestate.model.Contact_status;
import com.realestate.services.ContactService;

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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;


@RunWith(SpringRunner.class)
@WebMvcTest(ContactController.class)
public class ContactControllerTest {

//    mock away the business logic
    @MockBean
    private ContactService mockContactService;

//    simulate HTTP requests
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void test_ShowPage_WithCorrectAttributes() throws Exception {
        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin", Contact_status.LEAD);
        Mockito.when(mockContactService.findById((long) 1)).thenReturn(java.util.Optional.of(expectedContact));

//        Verifying HTTP Request Matching
        mockMvc.perform(get("/admin/dashboard/contacts/1/show"))
                .andExpect(status().isOk())
                .andExpect(model().attribute("contact", expectedContact))
                .andExpect(view().name("show"));
    }

    @Test
    public void test_GetMethod_AllContacts_withCorrectAttributes() throws Exception {
            mockMvc.perform(get("/admin/dashboard/contacts"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("contacts"))
                    .andDo(print());
    }

    @Test
    public void test_PostMethod_withCorrectAttributes() throws Exception {
        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin", Contact_status.LEAD);
        mockMvc.perform(post("/admin/dashboard/contacts/save")
                .param("firstName", "Marry")
                .param("lastName", "John")
                .param("email", "marry.john@gmail.com")
                .param("address", "rue de l'église")
                .param("zipCode", "56531")
                .param("city", "Berlin"))
                .andExpect(status().isOk());

        Mockito.verify(mockContactService).createContact(expectedContact);
    }

    @Test
    public void test_DeleteMethod_withId() throws Exception {
        Contact expectedContact = new Contact("Marry", "John", "marry.john@gmail.com", "rue de l'église", "56531", "berlin", Contact_status.LEAD);
        mockMvc.perform(delete("/admin/dashboard/contacts/{id}", "1"))
            .andExpect(status().isOk());
        Mockito.verify(mockContactService).deleteContact(expectedContact.getId());
    }
}
