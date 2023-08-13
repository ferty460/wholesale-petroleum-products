package com.example.orderaccounting.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "order_")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User customer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customerObject_id")
    private CustomerObject customerObject;

    private String time;

    @Column(name = "total_cost")
    private Integer totalCost;

    public Order(User customer, Product product, CustomerObject customerObject, String time, Integer totalCost) {
        this.customer = customer;
        this.product = product;
        this.customerObject = customerObject;
        this.time = time;
        this.totalCost = totalCost;
    }

    public Order() { }
}
