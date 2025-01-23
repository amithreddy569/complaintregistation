package com.complaintmanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.complaintmanagement.model.Complaints;

@Repository
public interface ComplaintsDao extends JpaRepository<Complaints, Integer>{
	 
	List<Complaints> findByCustomerId(int customerId);
	List<Complaints> findByReferenceId(String referenceId);
	List<Complaints> findByProductHandlerId(int handlerId);
}
