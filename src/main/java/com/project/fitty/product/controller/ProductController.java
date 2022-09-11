package com.project.fitty.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.product.model.service.ProductService;
import com.project.fitty.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	/*
	@RequestMapping("list.pr")
	public String productView() {
		return "product/productListView";
	}
	*/
	
	// [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	@RequestMapping("list.pr")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Product> list = pService.selectList(pi);
		
		System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("product/productListView");
	
		return mv;
	}

	
	
	
	
	
}
