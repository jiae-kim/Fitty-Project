package com.project.fitty.product.model.service;

import java.util.ArrayList;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;

public interface ProductService {

	// [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Product> selectList(PageInfo pi);
	
	// [김지애] 2. 헬스장이용권 등록 서비스
	int insertProduct(Product p);
	
	// [김지애] 3. 헬스장이용권 수정 서비스
	int updateProduct(Product p);
	
	// [김지애] 4. 헬스장이용권 삭제 서비스
	// 상품번호만 전달받아 상태 update
	int deleteProduct(int proNo);
}
