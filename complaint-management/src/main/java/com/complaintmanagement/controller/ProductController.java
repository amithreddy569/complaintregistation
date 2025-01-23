package com.complaintmanagement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.complaintmanagement.dao.ProductDao;
import com.complaintmanagement.model.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	 
	@PostMapping("/addproduct")
	public ModelAndView addProduct(@ModelAttribute Product product, Model model) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView();
		
		if(this.productDao.save(product) != null) {
			mv.addObject("status", "Product Added successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to add product");
			mv.setViewName("index");
		}
		
		return mv;
	}
	

}
