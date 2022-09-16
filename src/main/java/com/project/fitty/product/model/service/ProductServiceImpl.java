package com.project.fitty.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.dao.ProductDao;
import com.project.fitty.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao pDao;
	
	@Override // [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	public int selectListCount() {
		return pDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return pDao.selectList(sqlSession, pi);
	}
	
	@Override // [김지애] 2. 헬스장이용권 등록 서비스
	public ArrayList<Product> selectProductList() {
		return pDao.selectProductList(sqlSession);
	}
	
	@Override 
	public int insertProduct(Product p) {
		return pDao.insertProduct(sqlSession, p);
	}

	@Override // [김지애] 3. 헬스장이용권 수정 서비스
	public Product selectProduct(int proNo) {
		return pDao.selectProduct(sqlSession, proNo);
	}
	
	@Override 
	public int updateProduct(Product p) {
		return pDao.updateProduct(sqlSession, p);
	}
	
	@Override // [김지애] 4. 헬스장이용권 삭제 서비스
	public int deleteProduct(String proNo) {
		return pDao.deleteProduct(sqlSession, proNo);
	}

	@Override // [김지애] 5. 회원등록 서비스 - 이용권 조회
	public ArrayList<Product> selectProList() {
		return pDao.selectProList(sqlSession);
	}

}
