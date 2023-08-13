package com.example.orderaccounting.controller;

import com.example.orderaccounting.domain.CustomerObject;
import com.example.orderaccounting.domain.Order;
import com.example.orderaccounting.domain.Product;
import com.example.orderaccounting.domain.User;
import com.example.orderaccounting.repo.CustomerObjectRepo;
import com.example.orderaccounting.repo.OrderRepo;
import com.example.orderaccounting.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private CustomerObjectRepo customerObjectRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/help")
    public String help(Map<String, Object> model) {
        return "help";
    }

    public void showData(@AuthenticationPrincipal User customer, Model model) {
        Iterable<Order> orders = orderRepo.findByCustomer(customer);
        Iterable<Product> products = productRepo.findAll();
        Iterable<CustomerObject> objects = customerObjectRepo.findByOwner(customer);

        model.addAttribute("orders", orders);
        model.addAttribute("products", products);
        model.addAttribute("objects", objects);
    }

    @GetMapping("/main")
    public String showOrders(@AuthenticationPrincipal User customer, Model model) {
        showData(customer, model);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User customer,
            @RequestParam Long product,
            @RequestParam Integer amount,
            @RequestParam Long customerObject,
            Model model
    ) {
        Product selectedProduct = productRepo.getById(product);
        CustomerObject selectedCustomerObject = customerObjectRepo.getById(customerObject);

        Date today = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
        String time = formatter.format(today);

        Integer totalCost = productRepo.getById(product).getCost() * amount;

        Order order = new Order(customer, selectedProduct, selectedCustomerObject, time, totalCost);
        orderRepo.save(order);

        showData(customer, model);

        return "main";
    }
}
