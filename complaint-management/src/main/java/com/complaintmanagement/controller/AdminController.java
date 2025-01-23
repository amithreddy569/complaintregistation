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

import com.complaintmanagement.dao.AdminDao;
import com.complaintmanagement.model.Admin;

@Controller
public class AdminController { 
	
	private static Logger LOG = LogManager.getLogger(AdminController.class);

	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/")
	public String goToHome() {
		return "index";
	}
	
	@GetMapping("/adminpage")
	public String goToAdminPage() {
		return "admin";
	}
	
	@GetMapping("/adminlogin")
	public String goToAdminLoginPage() {
		return "adminlogin";
	}
	
	@GetMapping("/adminregister")
	public String goToAdminRegisterPage() {
		return "adminregister";
	}
	
	@GetMapping("/registerpage")
	public String goToRegisterPage() {
		return "registerpage";
	}
	
	@GetMapping("/loginpage")
	public String goToLoginPage() {
		return "loginpage";
	}
	
	@PostMapping("/adminregister")
	public ModelAndView registerAdmin(@ModelAttribute Admin admin, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.adminDao.save(admin) != null) {
			mv.addObject("status", admin.getFirstname()+" Successfully Registered as ADMIN");
			mv.setViewName("adminlogin");
		}
		
		else {
			mv.addObject("status", admin.getFirstname()+" Failed to Registered as ADMIN");
			mv.setViewName("adminregister");
		}
		
		return mv;
	}
	
	@PostMapping("/adminlogin")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
		ModelAndView mv = new ModelAndView();
		Admin admin=this.adminDao.findByUsernameAndPassword(username, password);
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admin);
			session.setAttribute("user-type","admin");
			mv.addObject("status", username+" Successfully Logged in as ADMIN");
			mv.setViewName("index");
			
		}
		
		else {
			mv.addObject("status"," Failed to Login as ADMIN");
			mv.setViewName("adminlogin");
		}
		
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		session.removeAttribute("active-user");
		session.removeAttribute("user-type");
		mv.addObject("status","Logged out Successfully");
		mv.setViewName("index");
		
		return mv;
	}
	
}
