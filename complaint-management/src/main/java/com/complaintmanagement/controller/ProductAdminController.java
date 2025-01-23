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

import com.complaintmanagement.dao.ProductAdminDao;
import com.complaintmanagement.model.ProductAdmin;

@Controller
public class ProductAdminController {
	
	private static Logger LOG = LogManager.getLogger(ProductAdminController.class);

	@Autowired
	private ProductAdminDao ProductAdminDao;
	
	@GetMapping("/productadminlogin")
	public String goToProductAdminLoginPage() {
		return "productadminlogin";
	}
	
	@GetMapping("/productadminregister")
	public String goToProductAdminRegisterPage() {
		return "productadminregister";
	}
	
	@PostMapping("/productadminregister")
	public ModelAndView registerProductAdmin(@ModelAttribute ProductAdmin ProductAdmin, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.ProductAdminDao.save(ProductAdmin) != null) {
			mv.addObject("status", ProductAdmin.getFirstname()+" Successfully Registered as ProductAdmin");
			mv.setViewName("productadminlogin");
		}
		
		else {
			mv.addObject("status", ProductAdmin.getFirstname()+" Failed to Registered as ProductAdmin");
			mv.setViewName("productadminregister");
		}
		
		return mv;
	}
	
	@PostMapping("/productadminlogin")
	public ModelAndView loginProductAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
		ModelAndView mv = new ModelAndView();
		ProductAdmin ProductAdmin=this.ProductAdminDao.findByUsernameAndPassword(username, password);
		if(ProductAdmin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", ProductAdmin);
			session.setAttribute("user-type","productAdmin");
			mv.addObject("status", username+" Successfully Logged in as ProductAdmin");
			mv.setViewName("index");
			
		}
		
		else {
			mv.addObject("status"," Failed to Login as ProductAdmin");
			mv.setViewName("productadminlogin");
		}
		
		return mv;
	}
	
}
