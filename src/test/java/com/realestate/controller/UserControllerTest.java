//package com.realestate.controller;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.realestate.model.User;
//import com.realestate.services.UserService;
//import org.hamcrest.Matchers;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.mockito.Mockito;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
//import org.springframework.boot.test.mock.mockito.MockBean;
//import org.springframework.http.MediaType;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.ResultMatcher;
//
//import static org.mockito.Mockito.*;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//
//@RunWith(SpringRunner.class)
//@WebMvcTest(UserController.class)
//public class UserControllerTest {
//    @MockBean
//    private UserService mockUserService;
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    private static ObjectMapper mapper = new ObjectMapper();
//
//    @Test
//    public void test_show_renderAllUsers() throws Exception {
//        User expectedUser = new User("Marie", "Hess", "Marie", "m@a.de", "marie", "sales repo");
//        verify(mockUserService.findById((long) 2)).thenReturn(expectedUser);
//
//        String json = mapper.writeValueAsString(expectedUser);
//        mockMvc.perform(get("/users/2")).contentType(MediaType.APPLICATION_JSON).characterEncoding("utf-8")
//                .andExpect(status().isOk())
//                .content(json).accept(MediaType.APPLICATION_JSON)).andExpect(status().isCreated())
//                .andExpect(jsonPath("$.id", Matchers.equalTo(1)))
//                .andExpect(jsonPath("$.name", Matchers.equalTo("Arun")));
//        ;
//    }
//
//    private UserControllerTest andExpect(ResultMatcher created) {
//        return null;
//    }
//}
