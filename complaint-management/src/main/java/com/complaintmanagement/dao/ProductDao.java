package com.complaintmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.complaintmanagement.model.Product;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer>{

}
