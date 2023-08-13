package com.example.orderaccounting.repo;

import com.example.orderaccounting.domain.CustomerObject;
import com.example.orderaccounting.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerObjectRepo extends JpaRepository<CustomerObject, Long> {
    Iterable<CustomerObject> findByOwner(User owner);
}
