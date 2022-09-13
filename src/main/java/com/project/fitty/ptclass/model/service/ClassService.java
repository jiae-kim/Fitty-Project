package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

public interface ClassService {
	
	
	//수업등록
//	User selectUser(int userNo);
	
	int insertClass(int userNo);

	
	//댓글 리스트 서비스
	ArrayList<Reply> selectReplyList(int boardNo);
	
	//댓글 등록 서비스
	int insertReply(Reply r);
	
}
