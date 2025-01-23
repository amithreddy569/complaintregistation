package com.complaintmanagement.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.complaintmanagement.constants.Constants.ComplaintStatus;
import com.complaintmanagement.constants.Utility;
import com.complaintmanagement.dao.ComplaintsDao;
import com.complaintmanagement.model.Complaints;
import com.complaintmanagement.model.Customer;

@Controller
public class ComplaintController { 
	
	@Autowired
	private ComplaintsDao complaintDao;
	
	@GetMapping("/raisecomplaint")
	public ModelAndView goToRaiseComplaint(@RequestParam("productId") String productId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("raisecomplaint");
		mv.addObject("productId", productId);
		
		return mv;
	}
	
	@PostMapping("/raisecomplaint")
	public ModelAndView raiseComplaint(@RequestParam("productId") String productId, @RequestParam("complaint") String complaint, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("active-user");
		ModelAndView mv = new ModelAndView();
		
		String referenceId = Utility.getAlphaNumericReferenceId(5);
		
		Complaints c = new Complaints();
		c.setComplaint(complaint);
		c.setProductId(Integer.parseInt(productId));
		c.setStatus(ComplaintStatus.PENDING.value());
		c.setReferenceId(referenceId);
		c.setCustomerId(customer.getId());
		
		complaintDao.save(c);
		
		mv.setViewName("index");
		mv.addObject("status","Complaint raised successfully");
		
		return mv;
	}
	
	@PostMapping("/mycomplaintstatus")
	public ModelAndView complaintStatus(@RequestParam("referenceId") String referenceId) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Complaints> complaints = complaintDao.findByReferenceId(referenceId);
		if(complaints != null) {
			System.out.println("got");
		}
		mv.setViewName("mycomplaintstatus");
		mv.addObject("mycomplaints",complaints);
		
		return mv;
	}
	
	@GetMapping("/mycomplaintstatus")
	public String complaintStatus() {
		return "mycomplaintstatus";
	}
	
	@GetMapping("/adddetails")
	public String goToAddDetails() {
		return "adddetails";
	}
	
	@GetMapping("/assignedcomplaints")
	public String goToAssignedComplaints() {
		return "assignedcomplaints";
	}
	
	@GetMapping("/totalcomplaints")
	public String goToTotalComplaints() {
		return "totalcomplaints";
	}
	
	@PostMapping("/adddetails")
	public ModelAndView addDetails(@RequestParam("referenceId") String referenceId, @RequestParam("detail") String details) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Complaints> complaints = complaintDao.findByReferenceId(referenceId);
		Complaints c = complaints.get(0);
		
		Complaints newC = new Complaints();
		newC.setComplaint(details);
		newC.setProductId(c.getProductId());
		newC.setStatus(ComplaintStatus.PENDING.value());
		newC.setReferenceId(referenceId);
		newC.setCustomerId(c.getCustomerId());
		
		complaintDao.save(newC);
		
		mv.setViewName("adddetails");
		mv.addObject("status","Detail Added Successfully");
		
		return mv;
	}
	
	@GetMapping("/assigncomplaint")
	public ModelAndView goToAddDetails(@RequestParam("referenceId") String referenceId) {
		
		ModelAndView mv = new ModelAndView();
		List<Complaints> complaints = complaintDao.findByReferenceId(referenceId);
		
		mv.setViewName("assigncomplaint");
		mv.addObject("complaint",complaints.get(complaints.size()-1));
		
		return mv;
	}
	
	@GetMapping("/processcomplaint")
	public ModelAndView goToComplaint(@RequestParam("complaintId") String complaintId) {
		
		ModelAndView mv = new ModelAndView();
		Optional<Complaints> optional1 = complaintDao.findById(Integer.parseInt(complaintId));
		Complaints complaint = optional1.get();
		
		mv.setViewName("processcomplaint");
		mv.addObject("complaint",complaint);
		
		return mv;
	}
	
	@PostMapping("/assigncomplaint")
	public ModelAndView assignComplaint(@RequestParam("referenceId") String referenceId, @RequestParam("handlerId") String handlerId) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Complaints> complaints = complaintDao.findByReferenceId(referenceId);
		
		for(Complaints c : complaints) {
			c.setProductHandlerId(Integer.parseInt(handlerId));
			complaintDao.save(c);	
		}
		
		mv.setViewName("index");
		mv.addObject("status","Complaint  Assigned to Handler");
		
		return mv;
	}
	
	@PostMapping("/processcomplaint")
	public ModelAndView processComplaint(@RequestParam("complaintId") String complaintId, @RequestParam("response") String response,@RequestParam("status") String status) {
		
		ModelAndView mv = new ModelAndView();
		
		Optional<Complaints> optional1 = complaintDao.findById(Integer.parseInt(complaintId));
		Complaints complaint = optional1.get();
		
		complaint.setResponse(response);
		complaint.setProductHandlerId(complaint.getProductHandlerId());
		complaint.setStatus(status);
		
		complaintDao.save(complaint);	
		
		mv.setViewName("index");
		mv.addObject("status","Complaint  Status updated successfully");
		
		return mv;
	}

}
