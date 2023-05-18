package com.Praveen.Springboot.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.Praveen.Springboot.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
}