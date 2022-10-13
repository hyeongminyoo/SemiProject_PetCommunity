package com.pet.home.board.qna;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "qna";
	}
	
	@GetMapping("reply")
	public ModelAndView setReply(QnaDTO qnaDTO,ModelAndView mv) throws Exception{
		mv.addObject("dto", qnaDTO);
		mv.setViewName("board/reply");
		
		return mv;
	}
	
	@PostMapping("reply")
	public String setReply(QnaDTO qnaDTO) throws Exception{
		int result = qnaService.setReply(qnaDTO);
		return "redirect:./list";
	}
	
	
	@RequestMapping("list")
	public ModelAndView getList(Pager pager, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = qnaService.getList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping("add")
	public String setAdd() throws Exception{
		return "board/add";
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ModelAndView mv, BoardDTO boardDTO, HttpSession session, MultipartFile [] multipartFiles) throws Exception{
		int result = qnaService.setAdd(boardDTO, multipartFiles, session.getServletContext());
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	@GetMapping("delete")
	public String setDelete(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		int result = qnaService.setDelete(boardDTO);
		return "redirect:./list";
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		boardDTO = qnaService.getDetail(boardDTO);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cookie"+boardDTO.getNum())) {
					System.out.println("처음 쿠키 생성 한 후 접속");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(boardDTO != null) {
			mv.addObject("dto", boardDTO);
			
			if(viewCookie == null) {
				System.out.println("쿠키가 없음");
				
				Cookie newCookie = new Cookie("cookie"+boardDTO.getNum(),""+boardDTO.getNum());
				
				response.addCookie(newCookie);
				
				int result = qnaService.setUpdateHit(boardDTO);
				
				if(result > 0) {
					System.out.println("조회수 증가");
				}else {
					System.out.println("조회수 증가 에러");
				}
				
			}else {
				System.out.println("쿠키 있음");
				
				String value = viewCookie.getValue();
				
				System.out.println("쿠키 값 : " + value);
			}
			mv.setViewName("board/detail");
		}
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardDTO boardDTO, ModelAndView mv) throws Exception{
		boardDTO = qnaService.getDetail(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		return mv;
	}
	
	@PostMapping("update")
	public String setUpdate(BoardDTO boardDTO) throws Exception{
		int result = qnaService.setUpdate(boardDTO);
		
		return "redirect:./detail?num="+boardDTO.getNum();
	}
	
}
