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

import com.complaintmanagement.dao.ProductHandlerDao;
import com.complaintmanagement.model.ProductHandler;

@Controller
public class ProductHandlerController {
	
	private static Logger LOG = LogManager.getLogger(ProductHandlerController.class);
 
	@Autowired
	private ProductHandlerDao ProductHandlerDao;
	
	@GetMapping("/producthandlerlogin")
	public String goToProductHandlerLoginPage() {
		return "producthandlerlogin";
	}
	
	@GetMapping("/producthandlerregister")
	public String goToProductHandlerRegisterPage() {
		return "producthandlerregister";
	}
	
	@PostMapping("/producthandlerregister")
	public ModelAndView registerProductHandler(@ModelAttribute ProductHandler ProductHandler, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.ProductHandlerDao.save(ProductHandler) != null) {
			mv.addObject("status", ProductHandler.getFirstname()+" Successfully Registered as ProductHandler");
			mv.setViewName("producthandlerlogin");
		}
		
		else {
			mv.addObject("status", ProductHandler.getFirstname()+" Failed to Registered as ProductHandler");
			mv.setViewName("producthandlerregister");
		}
		
		return mv;
	}
	
	@PostMapping("/producthandlerlogin")
	public ModelAndView loginProductHandler(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
		ModelAndView mv = new ModelAndView();
		ProductHandler ProductHandler=this.ProductHandlerDao.findByUsernameAndPassword(username, password);
		if(ProductHandler != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", ProductHandler);
			session.setAttribute("user-type","productHandler");
			mv.addObject("status", username+" Successfully Logged in as ProductHandler");
			mv.setViewName("index");
			
		}
		
		else {
			mv.addObject("status"," Failed to Login as ProductHandler");
			mv.setViewName("producthandlerlogin");
		}
		
		return mv;
	}
	
}
