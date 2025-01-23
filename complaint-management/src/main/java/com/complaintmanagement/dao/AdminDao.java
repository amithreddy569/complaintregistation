package com.complaintmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.complaintmanagement.model.Admin;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer> {
	
	Admin findByUsernameAndPassword(String username , String password);

}
