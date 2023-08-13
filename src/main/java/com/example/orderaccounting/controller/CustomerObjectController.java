package com.example.orderaccounting.controller;

import com.example.orderaccounting.domain.CustomerObject;
import com.example.orderaccounting.domain.User;
import com.example.orderaccounting.repo.CustomerObjectRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/object")
public class CustomerObjectController {

    @Autowired
    private CustomerObjectRepo customerObjectRepo;

    @GetMapping
    public String getObjects(@AuthenticationPrincipal User user, Model model) {
        Iterable<CustomerObject> customerObjects;

        customerObjects = customerObjectRepo.findByOwner(user);

        model.addAttribute("customerObjects", customerObjects);

        return "myObjects";
    }

    @PostMapping
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String address,
            Map<String, Object> model
    ) {
        CustomerObject customerObject = new CustomerObject(name, address, user);
        customerObjectRepo.save(customerObject);
        Iterable<CustomerObject> customerObjects = customerObjectRepo.findByOwner(user);
        model.put("customerObjects", customerObjects);

        return "myObjects";
    }
}
