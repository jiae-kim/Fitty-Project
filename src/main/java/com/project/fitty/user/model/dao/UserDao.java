package com.project.fitty.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;
import com.project.fitty.user.model.vo.User;

@Repository
public class UserDao {

	// [김지애] 1. 회원등록 서비스 (FileUpload)
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}
	
	// [김지애] 2. 회원 전체조회 서비스 (페이징)
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectListCount");
	}

	public ArrayList<User> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("userMapper.selectList", null, rowBounds);
	}

	// [김지애] 3. 회원 상세조회 서비스
	public User selectUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("userMapper.selectUser", userNo);
	}
	
	// [김지애] 4. 회원수정 서비스
	public int updateUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.updateUser", u);
	}

	// [김지애] 5. 회원 프로필이미지 변경 서비스 (ajax)
	public int uploadProfileImg(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.uploadProfileImg", u);
	}

	// [김지애] 6. 회원삭제 서비스
	public int deleteUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("userMapper.deleteUser", userNo);
	}

	// [김지애] 7. 회원등록 시 전화번호 중복체크 (ajax)
	public int telCheck(SqlSessionTemplate sqlSession, String userPhone) {
		return sqlSession.selectOne("userMapper.telCheck", userPhone);
	}

	// [김지애] 8. 회원 검색 (페이징)
	public int selectSearchCount (SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String,String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("userMapper.selectSearchCount", map);
	}

	public ArrayList<User> selectSearchList(SqlSessionTemplate sqlSession, String condition, 
										    String keyword, PageInfo pi) {
		HashMap<String,String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// selectList : 조회결과가 없을 경우 텅빈 리스트로 반환 (null로 반환 x)
		return (ArrayList)sqlSession.selectList("userMapper.selectSearchList", map, rowBounds);
	}

}
