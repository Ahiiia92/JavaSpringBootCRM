package controller;

import com.example.demo.AppController;
import model.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.ContactService;

import java.util.List;

@Controller
public class ContactController extends AppController {
    private final ContactService contactService;

    @Autowired
    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String addPageContact(@ModelAttribute Contact contact, Model model) {
        contactService.createContact(contact);
        model.addAttribute("contacts", contactService.getAllContact());
        return "dashboard";
    }

//    @GetMapping("/contacts")
//    public List<Contact> getAllContact() {
//        return contactService.getAllContact();
//    }
}
