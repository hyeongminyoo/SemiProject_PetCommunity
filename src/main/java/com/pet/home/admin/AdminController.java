package com.pet.home.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.event.EventDTO;
import com.pet.home.board.event.EventService;
import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDAO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDAO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.BizmemDTO;
import com.pet.home.member.MemberDAO;
import com.pet.home.member.MemberDTO;
import com.pet.home.sell.ReservationDTO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;
import com.pet.home.sell.purchase.PurchaseDTO;
import com.pet.home.util.CommentPager;
import com.pet.home.util.Pager;
import com.pet.home.util.SellPager;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SharingDAO sharingDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private SellItemService sellItemService;
	@Autowired
	private EventService eventService;

	@GetMapping("mypage")
	public ModelAndView getMyPage(ModelAndView mv, Pager pager, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		Pager bizPager = new Pager();
		bizPager.setSearch(pager.getSearch());
		System.out.println("서치:"+bizPager.getSearch());
		List<BizmemDTO> bizMembers = adminService.getBizmenList(bizPager);
		Pager guestPager = new Pager();
		guestPager.setSearch(pager.getSearch());
		List<MemberDTO> guestMembers = adminService.getGuestList(guestPager);
		Pager couponPager = new Pager();
		couponPager.setSearch(pager.getSearch());
		List<CouponDTO> list = adminService.getCouponList(couponPager);
		mv.addObject("bizPager", bizPager);
		mv.addObject("guestPager", guestPager);
		mv.addObject("couponPager", couponPager);
		mv.addObject("list", list);
		mv.addObject("biz", bizMembers);
		mv.addObject("guest", guestMembers);
		mv.setViewName("admin/admin");
		return mv;
	}
	
	@PostMapping("guestlist")
	@ResponseBody
	public Map<String, Object> getGuestList(Pager pager) throws Exception{
		List<MemberDTO> list = adminService.getGuestList(pager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pager", pager);
		
		return map;
	}
	
	@PostMapping("bizlist")
	@ResponseBody
	public Map<String, Object> getBizList(Pager pager) throws Exception{
		List<BizmemDTO> list = adminService.getBizmenList(pager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pager", pager);
		return map;
	}
	
	@PostMapping("couponlist")
	@ResponseBody
	public Map<String, Object> getCouponList(Pager pager) throws Exception{
		List<CouponDTO> list = adminService.getCouponList(pager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pager", pager);
		
		return map;
	}
	
	@PostMapping("addcoupon")
	@ResponseBody
	public int setAddCoupon(CouponDTO couponDTO) throws Exception {
		int result = adminService.setAddCoupon(couponDTO);
		return result;
	}
	
	@PostMapping("deletecoupon")
	@ResponseBody
	public int setDeleteCoupon(CouponDTO couponDTO) throws Exception{
		System.out.println(couponDTO.getCouponNum());
		int result = adminService.setDeleteCoupon(couponDTO);
		return result;
	}

	
	//멤버 탈퇴
	@PostMapping("deletemember")
	@ResponseBody
	public int setMemberDelete(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setBlock(memberDTO);
		return result;
	}
	
	@PostMapping("unblockmember")
	@ResponseBody
	public int setMemberUnblock(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setUnBlock(memberDTO);
		return result;
	}
	
	
	
	//멤버 등급부여
	public void setUpdateMember() throws Exception{
		
	}
	
	//멤버별 쓴글, 상품목록 불러오기 (같이해요)
	@GetMapping("sharinglist")
	@ResponseBody
	public Map<String, Object> getMemberBoardList(MemberDTO memberDTO, Pager pager) throws Exception{
		memberDTO= memberDAO.getMyPage(memberDTO);
		pager.setSearch(memberDTO.getUserName());
		List<SharingDTO> sharing = adminService.getMemberSharingList(pager);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("sharing", sharing);

		
		return map;
		
	}
	
	//사업자 이벤트 쓴글 불러오기
	@GetMapping("eventlist")
	@ResponseBody
	public Map<String, Object> getBizEventList(MemberDTO memberDTO, Pager pager) throws Exception{
		List<BoardDTO> ar = eventService.getList(pager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("event", ar);
		map.put("pager",pager);
		return map;
	}
	
	// 같이해요 삭제
	@PostMapping("sharingdelete")
	@ResponseBody
	public int setDeleteMemSharing(BoardDTO boardDTO) throws Exception{
		int result = sharingDAO.setDelete(boardDTO);
		return result;
	}
	
	//멤버별 쓴글, 상품목록 불러오기 (QNA)
	@GetMapping("qnalist")
	@ResponseBody
	public Map<String, Object> getMemberQnaList(MemberDTO memberDTO, Pager pager) throws Exception{
		pager.setSearch(memberDTO.getUserId());
		List<QnaDTO> qna = adminService.getMemberQnaList(pager);
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("qna", qna);

			
		return map;
			
		}
		
	// qna 삭제
	@PostMapping("qnadelete")
	@ResponseBody
	public int setDeleteMemQna(BoardDTO boardDTO) throws Exception{
		int result = qnaDAO.setDelete(boardDTO);
		return result;
	}
	
	
	@PostMapping("memberdetail")
	@ResponseBody
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		memberDTO = memberDAO.getGuestPage(memberDTO);
		return memberDTO;
	}
	
	//멤버별 결제한 상품 불러오기
	@PostMapping("purchaselist")
	@ResponseBody
	public List<PurchaseDTO> getMemberItemList(MemberDTO memberDTO, String purchaseStatus) throws Exception{
		PurchaseDTO purchaseDTO = new PurchaseDTO();
		purchaseDTO.setUserId(memberDTO.getUserId());
		purchaseDTO.setPurchaseStatus(Long.parseLong(purchaseStatus));
		List<PurchaseDTO> list =  sellItemService.getPurchaseList(purchaseDTO);
		return list;
	}
	
	//사업자 판매상품 리스트 불러오기
	@PostMapping("sellerlist")
	@ResponseBody
	public List<SellItemDTO> getSellerList(SellPager sellPager) throws Exception{
		List<SellItemDTO> ar = adminService.getSellerList(sellPager);
		return ar;
		
	}
	
	//1:1 문의 리스트 불러오기
	public void getQnaList() throws Exception{
		
	}
	
	//1:1문의 답글달기
	public void setQnaReply() throws Exception{
		
	}
	
	//1:1문의 삭제
	public void setQnaDelete() throws Exception{
		
	}
	
	// 공지사항 리스트 불러오기
	public void getNoticeList() throws Exception{
		
	}
	//공지사항 작성하기
	public void setNoticeAdd() throws Exception{
		
	}
	
	//회원에게 쿠폰 추가하기
	public void setCouponAddToMember() throws Exception{
		
	}
	
	
	
	
}
