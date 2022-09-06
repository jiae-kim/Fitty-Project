package com.project.fitty.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.user.model.dao.UserDao;
import com.project.fitty.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao uDao;

	@Override // [김지애] 1. 회원등록 서비스
	public int insertUser(User u) {
		return uDao.insertUser(sqlSession, u);
	}

	@Override // [김지애] 2. 회원 전체조회 서비스 (페이징)
	public int selectListCount() {
		return uDao.selectListCount(sqlSession);
	}
	
	@Override // [김지애] 2. 회원 전체조회 서비스 (페이징)
	public ArrayList<User> selectList(PageInfo pi) {
		return uDao.selectList(sqlSession, pi);
	}
	
	@Override // [김지애] 3. 회원 프로필이미지 변경 서비스 - ajax
	public int uploadProfileImg(User u) {
		return 0;
	}
	
	@Override // [김지애] 회원 상세조회 서비스
	public User selectUser(int userNo) {
		return null;
	}
	
	@Override // [김지애] 회원수정 서비스
	public int updateUser(User u) {
		return 0;
	}

	@Override // [김지애] 회원삭제 서비스
	public int deleteUser(String userNo) {
		return 0;
	}

	
	
}
