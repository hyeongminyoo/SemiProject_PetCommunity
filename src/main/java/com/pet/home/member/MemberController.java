package com.pet.home.member;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.xpath.XPathEvaluationResult.XPathResultType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("role")
	public String getAgree()throws Exception{
		
		return "member/role";
	} 
	
	@GetMapping("login")
	public String login() throws Exception {
		System.out.println("로그인 접속 (GET)");

		return "member/login";
	}

	@PostMapping("login")
	public String login(HttpServletRequest request, MemberDTO memberDTO) throws Exception {
		
		System.out.println("DB로그인 접속 (POST)");
		
		memberDTO = memberService.getLogin(memberDTO);

		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();
		// DB에서 가져온 DTO데이터를 JSP로 속성만들어서 보내기
		session.setAttribute("member", memberDTO);
		
if (memberDTO!=null) {
			System.out.println("오 ~ 로그인 성공");
}else {System.out.println("오 ~ 로그인 실패");}
		
		return "redirect:../";
	}
	
	@GetMapping("logout")
	public String logout (HttpSession session) throws Exception{
		
		session.invalidate(); //세션 비우기 
		
		return "redirect:../"; 
	}
	
	
	@GetMapping("join")
	public String join(HttpServletRequest request) throws Exception{
	
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) throws Exception{
		
		Calendar ca = Calendar.getInstance();
		
		System.out.println("join post 실행");
		
		//선택 약관동의값 세팅 
		// 체크되지 않으면 0 , 선택되면 1로 설정 
		if(memberDTO.getAgMes()==null) {
			memberDTO.setAgMes(0);
		}else {memberDTO.setAgMes(1);
		}

		//공통 member테이블 먼저 생성 
		int result = memberService.setJoin(memberDTO);
		
	
		
		//사업자 회원일 때 
		if(memberDTO.getRoleNum()==1){ 
			memberDTO.setBizNum(ca.getTimeInMillis()); //사업자번호 밀리세컨즈로 설정 
		    memberService.setBiz(memberDTO); //bizmem 테이블 생성 
		}else {
			//게스트 회원일 때 
			memberDTO.setGuestId(ca.getTimeInMillis()); //guestId 밀리세즈로 설정 
			memberService.setGuest(memberDTO); //guest 테이블 생성 
		}

		  
		  
		  if(result>0) {
		  System.out.println("회원가입 성공!"); }else { System.out.println("회원가입 실패"); }

		
		return "redirect:../";
		
	}
	
	@GetMapping("test")
	public ModelAndView getPickList(MemberDTO memberDTO) throws Exception{
		MemberDTO ar = memberService.getPickList(memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.setViewName("member/test");
		return mv;
	}
	
}
	