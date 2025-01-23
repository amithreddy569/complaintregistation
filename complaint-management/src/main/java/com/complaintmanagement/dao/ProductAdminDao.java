package com.complaintmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.complaintmanagement.model.Customer;
import com.complaintmanagement.model.ProductAdmin;

@Repository
public interface ProductAdminDao extends JpaRepository<ProductAdmin, Integer> {
	
	ProductAdmin findByUsernameAndPassword(String username , String password);

}
