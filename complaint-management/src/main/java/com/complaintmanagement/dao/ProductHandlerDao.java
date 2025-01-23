package com.complaintmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.complaintmanagement.model.ProductAdmin;
import com.complaintmanagement.model.ProductHandler;

@Repository
public interface ProductHandlerDao extends JpaRepository<ProductHandler, Integer> {
	
	ProductHandler findByUsernameAndPassword(String username , String password);

}
