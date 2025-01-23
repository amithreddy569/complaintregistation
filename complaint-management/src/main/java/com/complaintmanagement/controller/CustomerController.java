package com.complaintmanagement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.complaintmanagement.dao.CustomerDao;
import com.complaintmanagement.model.Customer;

@Controller
public class CustomerController {
	 
	private static Logger LOG = LogManager.getLogger(CustomerController.class);

	@Autowired
	private CustomerDao customerDao;
	
	@GetMapping("/customerlogin")
	public String goToCustomerLoginPage() {
		return "customerlogin";
	}
	
	@GetMapping("/customerregister")
	public String goToCustomerRegisterPage() {
		return "customerregister";
	}
	
	@PostMapping("/customerregister")
	public ModelAndView registerCustomer(@ModelAttribute Customer Customer, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.customerDao.save(Customer) != null) {
			mv.addObject("status", Customer.getFirstname()+" Successfully Registered as Customer");
			mv.setViewName("customerlogin");
		}
		
		else {
			mv.addObject("status", Customer.getFirstname()+" Failed to Registered as Customer");
			mv.setViewName("customerregister");
		}
		
		return mv;
	}
	
	@PostMapping("/customerlogin")
	public ModelAndView loginCustomer(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
		ModelAndView mv = new ModelAndView();
		Customer Customer=this.customerDao.findByUsernameAndPassword(username, password);
		if(Customer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", Customer);
			session.setAttribute("user-type","customer");
			mv.addObject("status", username+" Successfully Logged in as Customer");
			mv.setViewName("index");
			
		}
		
		else {
			mv.addObject("status"," Failed to Login as Customer");
			mv.setViewName("customerlogin");
		}
		
		return mv;
	}
	
}
