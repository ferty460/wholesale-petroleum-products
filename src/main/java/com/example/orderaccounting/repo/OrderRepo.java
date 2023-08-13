package com.example.orderaccounting.repo;

import com.example.orderaccounting.domain.Order;
import com.example.orderaccounting.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepo extends JpaRepository<Order, Long> {
    List<Order> findByCustomer(User customer);
}
