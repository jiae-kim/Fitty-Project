package com.project.fitty.product.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.product.model.service.ProductService;
import com.project.fitty.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	// [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	@RequestMapping("list.pr")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Product> list = pService.selectList(pi);
		
		// 이용권 등록 시 db에 존재하는 이용권 조회해서 비교
		ArrayList<Product> month = pService.selectProductList();
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("month", month)
		  .setViewName("product/productListView");
	
		return mv;
	}
	
	// [김지애] 2. 헬스장이용권 등록 서비스
	@RequestMapping("insert.pr")
	public String insertProduct(Product p, HttpSession session) {
		// 이용권 금액 등록시 ,제거 후 숫자만 insert되도록
		p.setProPrice(p.getProPrice().replace(",", ""));
		
		int result = pService.insertProduct(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "✔ 성공적으로 헬스장 이용권이 등록되었습니다 ✔");
			return "redirect:list.pr";
		}else {
			session.setAttribute("alertMsg", "❌ 헬스장 이용권 등록에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	
	// [김지애] 3. 헬스장이용권 수정 서비스
	@RequestMapping("updateForm.pr")
	public String updateForm(int proNo, Model model) {
		// 수정할 이용권 번호만 받아서 한행 조회 후 model에 담은 후 페이지 포워딩
		model.addAttribute("p", pService.selectProduct(proNo));
		return "product/prodcutListView";
	}
	
	@RequestMapping("update.pr")
	public String updateProduct(Product p, HttpSession session) {
		// 이용권 금액 등록시 ,제거 후 숫자만 update되도록
		p.setProPrice(p.getProPrice().replace(",", ""));
				
		int result = pService.updateProduct(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "✔ 성공적으로 헬스장 이용권이 수정되었습니다 ✔");
			return "redirect:list.pr";
		}else {
			session.setAttribute("alertMsg", "❌ 헬스장 이용권 수정에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	
	// [김지애] 4. 헬스장이용권 삭제 서비스 (ajax)
	@ResponseBody
	@RequestMapping("delete.pr")
	public String deleteProduct(String ckPro, HttpSession session) {
		int result = pService.deleteProduct(ckPro);
		return result>0 ? "success" : "fail";
	}
	
}
