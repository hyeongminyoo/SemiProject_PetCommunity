package com.pet.home.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.home.member.MemberDTO;
import com.pet.home.member.RoleDTO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1. 로그인한 사용자에서 admin 찾기
		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		boolean check = false;
		
		if(memberDTO == null) {
			request.setAttribute("message", "관리자 로그인이 필요합니다.");
			request.setAttribute("url", "../../../../member/login");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			
			return check;
		}
		
		
		RoleDTO roleDTO = memberDTO.getRoleDTO();
		
		if(roleDTO.getRoleName().equals("admin")) {
			check = true;
		}else{
			request.setAttribute("message", "권한이 없습니다.");
			request.setAttribute("url", "../../../../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
		
	}
	
	
}
