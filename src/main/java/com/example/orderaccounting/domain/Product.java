package com.example.orderaccounting.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private Integer cost;

    private String measure;

    public Product(String name, Integer cost, String measure) {
        this.name = name;
        this.cost = cost;
        this.measure = measure;
    }

    public Product() { }

    public String getMeasure() {
        return measure != null ? measure : "none";
    }

    @Override
    public String toString() {
        return name + " " + cost + " руб./" + measure;
    }
}
