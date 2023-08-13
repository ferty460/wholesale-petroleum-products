package com.example.orderaccounting.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class CustomerObject {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String address;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User owner;

    public CustomerObject(String name, String address, User owner) {
        this.name = name;
        this.address = address;
        this.owner = owner;
    }

    public CustomerObject() { }

    public String getOwnerName() {
        return owner != null ? owner.getUsername() : "none";
    }
}
