package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.Diet;

public interface ClassService {
	
	
	//수업등록 페이지 내 회원조회
	User selectUser(int userNo);
	
	//수업등록
	int insertClass(PtClass pt);
	
	//수업등록 완료 상태로 변경
	int updateStatus(int userNo);

	
	//내 회원 리스트 조회
	ArrayList<User> selectUserList(String empNo);
	
	
	//수업 번호에 따른 식단일기 조회
	ArrayList<Diet> selectDiet(int classNo);
	
	
	//식단일기 상세조회
	Diet selectDietDetail(Diet di);
	
	
	//댓글 리스트 서비스
	ArrayList<Reply> selectReplyList(int dietNo);
	
	
	
	//댓글 등록 서비스
	int insertReply(Reply r);
	
}
