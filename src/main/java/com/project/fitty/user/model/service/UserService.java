package com.project.fitty.user.model.service;

import java.util.ArrayList;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.user.model.vo.User;

public interface UserService {

	// [김지애] 회원등록 서비스
	int insertUser(User u);
	
	// [김지애] 회원 전체조회 서비스 (페이징)
	int selectListCount();
	ArrayList<User> selectList(PageInfo pi);
	
	// [김지애] 회원 상세조회 서비스
	User selectUser(int userNo);
	
	// [김지애] 회원수정 서비스
	int updateUser(User u);
	
	// [김지애] 회원삭제 서비스
	// 문자열로 탈퇴시킬 회원번호만 전달받아 상태 update
	int deleteUser(String userNo);
	
	// [김지애] 회원 프로필이미지 변경 서비스 - ajax
	int uploadProfileImg(User u);
}
