package com.realestate.controller;

import com.realestate.model.Property;
import com.realestate.services.PropertyService;
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
public class PropertyControllerTest {
    @MockBean
    private PropertyService mockPropertyService;

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void test_ShowPage_With_CorrectAttributes() throws Exception {
        Property expectedProperty = new Property("2020", 4, 53.45, 150_000);
        Mockito.when(mockPropertyService.findById(1)).thenReturn(java.util.Optional.of(expectedProperty));

        mockMvc.perform(get("/admin/dashboard/properties/1"))
                .andExpect(status().isOk())
                .andExpect(model().attribute("property", expectedProperty))
                .andExpect(view().name("show"));
    }

    @Test
    public void test_PostMethod_withCorrectAttributes() throws Exception {
        Property expectedProperty = new Property("2020", 4, 53.45, 150_000);
        mockMvc.perform(post("/admin/dashboard/properties")
        .param("availability", "2020")
        .param("price", "150_000")
        .param("rooms", "4")
        .param("surface", "53.45"))
                .andExpect(status().isOk());

        Mockito.verify(mockPropertyService).createProperty(expectedProperty);
    }

    @Test
    public void test_DeleteMethod_withId() throws Exception {
        Property expectedProperty = new Property("2020", 4, 53.45, 150_000);
        mockMvc.perform(delete("/admin/dashboard/properties/1")).andExpect(status().isOk());

        Mockito.verify(mockPropertyService).deleteProperty(expectedProperty.getId());
    }

}
