package com.project.fitty.user.model.service;

import java.util.ArrayList;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;
import com.project.fitty.user.model.vo.User;

public interface UserService {

	// [김지애] 1. 회원등록 서비스 (FileUpload)
	int insertUser(User u);
	
	// [김지애] 2. 회원 전체조회 서비스 (페이징)
	int selectListCount();
	ArrayList<User> selectList(PageInfo pi);
	
	// [김지애] 3. 회원 상세조회 서비스
	User selectUser(int userNo);
	
	// [김지애] 4. 회원수정 서비스
	int updateUser(User u);
	
	// [김지애] 5. 회원 프로필이미지 변경 서비스 (ajax)
	int uploadProfileImg(User u);
	
	// [김지애] 6. 회원삭제 서비스
	int deleteUser(int userNo);

	// [김지애] 7. 회원등록 시 전화번호 중복체크 (ajax)
	int telCheck(String userPhone);
	
	// [김지애] 8. 회원 검색 (페이징)
	int selectSearchCount(String condition, String keyword);
	ArrayList<User> selectSearchList(String condition, String keyword, PageInfo pi);

}
