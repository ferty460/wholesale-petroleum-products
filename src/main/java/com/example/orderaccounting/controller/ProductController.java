package com.example.orderaccounting.controller;

import com.example.orderaccounting.domain.Product;
import com.example.orderaccounting.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/product")
@PreAuthorize("hasAuthority('ADMIN')")
public class ProductController {

    @Autowired
    private ProductRepo productRepo;

    @GetMapping
    public String getProducts(Model model) {
        Iterable<Product> products;

        products = productRepo.findAll();

        model.addAttribute("products", products);

        return "products";
    }

    @PostMapping
    public String add(
            @RequestParam String name,
            @RequestParam Integer cost,
            @RequestParam String measure,
            Map<String, Object> model
    ) {
        Product product = new Product(name, cost, measure);
        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();
        model.put("products", products);

        return "products";
    }
}
