package com.project.fitty.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.fitty.employee.model.vo.Employee;

public class AdminInterceptor implements HandlerInterceptor {

	@Override public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		HttpSession session = request.getSession();
		
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		
		if(loginUser.getEmpGrade().equals("C") || loginUser.getEmpGrade().equals("A")) {
			return true;
		} else {
			session.setAttribute("alertMsg", "관리자만 이용가능한 페이지입니다.");
			response.sendRedirect("myAtt.att");
			return false;
		}
	}
	
}
