package com.example.orderaccounting.repo;

import com.example.orderaccounting.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepo extends JpaRepository<Product, Long> {

}
