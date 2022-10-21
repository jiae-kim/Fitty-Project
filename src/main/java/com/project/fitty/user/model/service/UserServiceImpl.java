package com.project.fitty.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;
import com.project.fitty.user.model.dao.UserDao;
import com.project.fitty.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao uDao;

	@Override // [김지애] 1. 회원등록 서비스 (FileUpload)
	public int insertUser(User u) {
		return uDao.insertUser(sqlSession, u);
	}
	
	@Override // [김지애] 2. 회원 전체조회 서비스 (페이징)
	public int selectListCount() {
		return uDao.selectListCount(sqlSession);
	}
	
	@Override 
	public ArrayList<User> selectList(PageInfo pi) {
		return uDao.selectList(sqlSession, pi);
	}
	
	@Override // [김지애] 3. 회원 상세조회 서비스
	public User selectUser(int userNo) {
		return uDao.selectUser(sqlSession, userNo);
	}
	
	@Override // [김지애] 4. 회원수정 서비스
	public int updateUser(User u) {
		return uDao.updateUser(sqlSession, u);
	}
	
	@Override // [김지애] 5. 회원 프로필이미지 변경 서비스 (ajax)
	public int uploadProfileImg(User u) {
		return uDao.uploadProfileImg(sqlSession, u);
	}

	@Override // [김지애] 6. 회원삭제 서비스
	public int deleteUser(int userNo) {
		return uDao.deleteUser(sqlSession, userNo);
	}

	@Override // [김지애] 7. 회원등록 시 전화번호 중복체크 (ajax)
	public int telCheck(String userPhone) {
		return uDao.telCheck(sqlSession, userPhone);
	}

	@Override // [김지애] 8. 회원 검색 (페이징)
	public int selectSearchCount(String condition, String keyword) {
		return uDao.selectSearchCount(sqlSession, condition, keyword);
	}

	@Override 
	public ArrayList<User> selectSearchList(String condition, String keyword, PageInfo pi) {
		return uDao.selectSearchList(sqlSession, condition, keyword, pi);
	}
	
}
