package com.realestate.controller;

import com.realestate.exception.ResourceNotFoundException;
import com.realestate.model.Contact;
import com.realestate.model.Property;
import com.realestate.services.ContactService;
import com.realestate.services.PropertyService;
import com.realestate.services.UserService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = {"admin/dashboard/properties"})
public class PropertyController {
    @Autowired
    private PropertyService propertyService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    @GetMapping("")
    public String allProperties(Model model) {
        List<Property> propertyList = propertyService.findAllProperty();
        List<Contact> contactList = contactService.getAllContacts();
        model.addAttribute("properties", propertyList);
        model.addAttribute("contact", contactList);
        return "properties";
    }

    @PostMapping("")
    public String createNewProperty(ModelMap model, @ModelAttribute Property property) {
        propertyService.createProperty(property);
        model.addAttribute("properties", propertyService.findAllProperty());
        return "properties";
    }

    @GetMapping("/{id}/show")
    public String showProperty(ModelMap model, @PathVariable long id) {
        Property property = propertyService.findById(id).orElseThrow(() -> new ResourceNotFoundException(("Property does not exist with id: " + id)));;
        model.addAttribute("property", property);
        return "show";
    }

    @PostMapping("/{id}/show")
    public String updateProperty(ModelMap model, @PathVariable(name = "id") long currentId, @RequestParam Property propertyDetails) {
        Property property = propertyService.findById(currentId)
                .orElseThrow(() -> new ResourceNotFoundException("Property doesn't exist with id: " + currentId));;

        property.setAvailability(propertyDetails.getAvailability());
        property.setPrice(propertyDetails.getPrice());
        property.setRooms(propertyDetails.getRooms());
        property.setSurface(propertyDetails.getSurface());
        property.setContact(propertyDetails.getContact());

        Property updatedProperty = propertyService.save(property);
        ResponseEntity.ok(updatedProperty);
        model.addAttribute("property", propertyService.findById(property.getId()));
        return "show";
    }

    @PostMapping("/deleteProperty")
    public String deleteProperty(ModelMap model, @RequestParam long id) {
        propertyService.removeProperty(id);
        model.addAttribute("properties", propertyService.findAllProperty());
        return "redirect:/admin/dashboard/properties";
    }
}
