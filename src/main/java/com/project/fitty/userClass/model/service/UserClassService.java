package com.project.fitty.userClass.model.service;

import com.project.fitty.userClass.model.vo.Diet;
import com.project.fitty.userClass.model.vo.UserClass;

public interface UserClassService {
	
	//로그인
	UserClass loginUser(UserClass u);
	
	//식단 상세페이지
	Diet selectUserDiet(Diet di);
	
	//식단 등록
	int insertUserDiet(Diet di);
	
	//식단 업데이트
	int updateDietBoard(Diet di);
}
