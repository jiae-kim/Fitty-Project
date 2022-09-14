package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

public interface ClassService {
	
	
	//수업등록 페이지 회원조회
	User selectUser(int userNo);
	
	//수업등록
	int insertClass(PtClass pt);
	
	//수업등록 완료 상태로 변경
	int updateStatus(int userNo);

	
	//댓글 리스트 서비스
	ArrayList<Reply> selectReplyList(int boardNo);
	
	//댓글 등록 서비스
	int insertReply(Reply r);
	
}
