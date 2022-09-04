package com.project.fitty.user.model.service;

import com.project.fitty.user.model.vo.User;

public interface UserService {

	// [김지애] 회원등록 서비스
	int insertUser(User u);
	
	// [김지애] 회원수정 서비스
	int updateUser(User u);
	
	// [김지애] 회원삭제 서비스
	// 문자열로 탈퇴시킬 회원번호만 전달받아 상태 update
	int deleteUser(String userNo);
}
