package com.project.fitty.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;

@Repository
public class ProductDao {

	// [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.selectListCount");
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}

	// [김지애] 2. 헬스장이용권 등록 서비스
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}

	// [김지애] 3. 헬스장이용권 수정 서비스
	public Product selectProduct(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("productMapper.selectProduct", proNo);
	}
	
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}

	// [김지애] 4. 헬스장이용권 삭제 서비스
	public int deleteProduct(SqlSessionTemplate sqlSession, String proNo) {
		// 체크한 String값 배열에 담음
		String[] arr = proNo.split(","); // ["13", "12"]
		
		// arr을 HashMap으로 담아서 mapper에 넘겨줌
		// mapper에서 foreach 반복문 돌릴 떄 item은 변수, collection은 반복문 돌릴 변수
		HashMap<String, Object> map = new HashMap<>();
		map.put("arr", arr);
		
		return sqlSession.delete("productMapper.deleteProduct", map);
	}

	// [김지애] 5. 회원등록 서비스 - 이용권 조회
	public ArrayList<Product> selectProList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProList");
	}


}
