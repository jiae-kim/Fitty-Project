package com.project.fitty.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping("list.pr")
	public String productView() {
		return "product/productView";
	}
	
}
