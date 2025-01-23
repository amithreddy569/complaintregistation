package com.complaintmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.complaintmanagement.model.Admin;
import com.complaintmanagement.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {
	 
	Customer findByUsernameAndPassword(String username , String password);

}
