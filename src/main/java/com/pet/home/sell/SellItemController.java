 package com.pet.home.sell;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.JsonObject;
import com.pet.home.admin.AdminDAO;
import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.chat.room.EchoHandler;
import com.pet.home.member.MemberDTO;
import com.pet.home.member.MemberService;
import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.purchase.PurchaseDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.util.SellPager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value = "/sell/*")
public class SellItemController {
	// ????????? ??????, ??????, ??????

	@Autowired
	private SellItemService itemService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminDAO adminDAO;
	
	@GetMapping("Test")
	public void detailTest() {
	}

	@GetMapping("list")
	public ModelAndView getItemList(SellPager sellPager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<SellItemDTO> ar = itemService.getItemList(sellPager);
		CategoryDTO categoryDTO = itemService.getCategory(sellPager.getItemCatg());
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO != null) {
			List<SellItemDTO> sellItemDTOs = itemService.getPickStatus(memberDTO);
			mv.addObject("pick", sellItemDTOs);
			List<SellItemDTO> sellItemDTOs2 = itemService.getShopCartStatus(memberDTO);
			mv.addObject("shopcart", sellItemDTOs2);
		}
		mv.addObject("list", ar);
		mv.addObject("pager", sellPager);
		mv.addObject("category", categoryDTO);
		return mv;
	}
	
	@GetMapping("Sellerlist")
	public ModelAndView getSellerList(SellPager sellPager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		sellPager.setUserId(memberDTO.getUserId());
		List<SellItemDTO> ar = itemService.getSellerList(sellPager);
		CategoryDTO categoryDTO = itemService.getCategory(sellPager.getItemCatg());
		mv.addObject("list", ar);
		mv.addObject("pager", sellPager);
		mv.addObject("category", categoryDTO);
		mv.setViewName("sell/Sellerlist");
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getDetailOne(SellItemDTO sellItemDTO, ModelAndView model, HttpSession session) throws Exception {
		if(session.getAttribute("member") != null) {
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
			List<CouponDTO> couponList = memberService.getCouponList(memberDTO);
			model.addObject("couponList", couponList);
		}
		sellItemDTO = itemService.getDetailOne(sellItemDTO);
		CategoryDTO categoryDTO = itemService.getCategory(sellItemDTO.getItemCatg());
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO != null) {
			ShopCartDTO shopCartDTO = new ShopCartDTO();
			shopCartDTO.setItemNum(sellItemDTO.getItemNum());
			shopCartDTO.setUserId(memberDTO.getUserId());
			String result = itemService.getShopCartCheck(shopCartDTO);
			model.addObject("shopcart", result);			
		}
		model.addObject("sellItemDTO", sellItemDTO);
		model.addObject("category", categoryDTO);
		return model;
	}

	@PostMapping("check")
	public void setCheck(PurchaseDTO checkDTO) {
		System.out.println(checkDTO.getItemNum());
	}

	@GetMapping("add")
	public void setItemAdd() throws Exception {
		System.out.println("add Get");
	}

	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		ModelAndView view = new ModelAndView();
		session.getAttribute("member");
		int result = itemService.setItemAdd(itemDTO, files, session.getServletContext());
		if (result > 0) {
			view.setViewName("redirect:/sell/list?itemCatg=" + itemDTO.getItemCatg());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("update")
	public Model setItemUpdate(SellItemDTO dto, Model model) throws Exception {
		System.out.println("itemupdate");
		List<SellFileDTO> ar = dto.getFileDTOs();
		dto = itemService.getDetailOne(dto);
		model.addAttribute("dto", dto);
		return model;
	}

	@PostMapping("update")
	public ModelAndView setItemUpdateResult(SellItemDTO itemDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		System.out.println("updatepost");
		int result = itemService.setItemUpdate(itemDTO, files, session.getServletContext());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/list?itemCatg=" + itemDTO.getItemCatg());
		return mv;
	}

	@PostMapping("filedelete")
	@ResponseBody
	public int setFileDelete(SellFileDTO fileDTO, HttpSession session) throws Exception {
		int result = itemService.setUpdateFileDelete(fileDTO, session.getServletContext());
		return result;
	}

	@PostMapping("delete")
	@ResponseBody
	public int setItemDelete(SellItemDTO itemDTO, HttpSession session) throws Exception {
		System.out.println("delete");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/list?itemCatg=" + itemDTO.getItemCatg());
		int result = itemService.setItemDelete(itemDTO, session.getServletContext());
		return result;
	}
	
	@GetMapping("pettx")
	public void setPettx () {
		
	}
	
	

	@PostMapping("pickadd")
	@ResponseBody
	public int setPickAdd(PickDTO pickDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		pickDTO.setUserId(memberDTO.getUserId());
		int result = itemService.setPickAdd(pickDTO);
		return result;
	}

	@PostMapping("pickdelete")
	@ResponseBody
	public int setPickDelete(PickDTO pickDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		pickDTO.setUserId(memberDTO.getUserId());
		int result = itemService.setPickDelete(pickDTO);
		return result;
	}

	@PostMapping("shopcartadd")
	@ResponseBody
	public int setShopCartAdd(ShopCartDTO shopCartDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		System.out.println("dognum : "+shopCartDTO.getDogNum());
		shopCartDTO.setUserId(memberDTO.getUserId());
		int result = itemService.setShopCartAdd(shopCartDTO);
		return result;
	}

	@PostMapping("shopcartdelete")
	@ResponseBody
	public int setShopCartDelete(ShopCartDTO shopCartDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		shopCartDTO.setUserId(memberDTO.getUserId());
		int result = itemService.setShopCartDelete(shopCartDTO);
		return result;
	}

	@PostMapping("shopcartupdate")
	@ResponseBody
	public int setShopCartUpdate(ShopCartDTO shopCartDTO) throws Exception {
		int result = itemService.setShopCartUpdate(shopCartDTO);
		return result;
	}

	@GetMapping("reviewadd")
	public ModelAndView setReviewAdd(ReviewDTO reviewDTO) throws Exception {
		System.out.println("reviewadd Get");
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("./sell/reviewadd");
		return mv;
	}

	@PostMapping("reviewadd")
	public ModelAndView setReviewAddResult(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session)
			throws Exception {
		System.out.println("reviewadd Post");
		ModelAndView view = new ModelAndView();
		System.out.println(reviewDTO.getUserId());
		System.out.println(files.length);
		int result = itemService.setReviewAdd(reviewDTO, files, session.getServletContext());
		if (result > 0) {
			view.setViewName("redirect:/sell/detail?itemNum=" + reviewDTO.getItemNum());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("reviewList")
	@ResponseBody
	public Map<String, Object> getReviewList(com.pet.home.util.CommentPager commentPager, HttpSession session) throws Exception {
		List<ReviewDTO> ar = itemService.getReviewList(commentPager);
		System.out.println(ar.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", commentPager);
		map.put("member", (MemberDTO)session.getAttribute("member"));
		return map;
	}

	@GetMapping("reviewupdate")
	public ModelAndView getReviewUpdate(ReviewDTO reviewDTO) throws Exception {
		reviewDTO = itemService.getReviewUpdate(reviewDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("./sell/reviewupdate");
		return mv;
	}

	@PostMapping("reviewupdate")
	public String setReviewUpdate(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = itemService.setReviewUpdate(reviewDTO, files, session.getServletContext());
		return "redirect:./detail?itemNum=" + reviewDTO.getItemNum();
	}

	@PostMapping("reviewdelete")
	@ResponseBody
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		int result = itemService.setReviewDelete(reviewDTO);
		return result;
	}

	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(RvFileDTO rvFileDTO, HttpSession session) throws Exception {
		int result = itemService.setFileDelete(rvFileDTO, session.getServletContext());
		return result;
	}

	@PostMapping("reviewcommentalldelete")
	@ResponseBody
	public int setReviewCommentAllDelete(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentAllDelete(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentdelete")
	@ResponseBody
	public int setReviewCommentDelete(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentDelete(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentadd")
	@ResponseBody
	public int setReviewCommentAdd(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentAdd(rvCommentDTO);
		return result;
	}

	@PostMapping("reviewcommentupdate")
	@ResponseBody
	public int setReviewCommentUpdate(RvCommentDTO rvCommentDTO) throws Exception {
		int result = itemService.setReviewCommentUpdate(rvCommentDTO);
		return result;
	}

	@GetMapping("sellqnaadd")
	public ModelAndView setSellQnaAdd(SellQnaDTO sellQnaDTO) throws Exception {
		System.out.println("sellqnaadd Get");
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellQnaDTO", sellQnaDTO);
		mv.setViewName("./sell/sellqnaadd");
		return mv;
	}

	@PostMapping("sellqnaadd")
	public ModelAndView setSellQnaAddResult(SellQnaDTO sellQnaDTO, WebSocketSession session) throws Exception {
		System.out.println("sellqnaadd Post");
		
		ModelAndView view = new ModelAndView();
		int result = itemService.setSellQnaAdd(sellQnaDTO);
		if (result > 0) {
			view.setViewName("redirect:/sell/detail?itemNum=" + sellQnaDTO.getItemNum());

		} else {
			view.setViewName("../");
		}
		return view;
	}

	@GetMapping("qnaList")
	@ResponseBody
	public Map<String, Object> getSellQnaList(com.pet.home.util.CommentPager commentPager, HttpSession session) throws Exception {
		List<SellQnaDTO> ar = itemService.getSellQnaList(commentPager);
		System.out.println(ar.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", commentPager);
		map.put("member", (MemberDTO)session.getAttribute("member"));
		return map;
	}

	@GetMapping("qnaupdate")
	public ModelAndView getSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception {
		sellQnaDTO = itemService.getSellQnaUpdate(sellQnaDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellQnaDTO", sellQnaDTO);
		mv.setViewName("./sell/qnaupdate");
		return mv;
	}

	@PostMapping("qnaupdate")
	public String setSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception {
		int result = itemService.setSellQnaUpdate(sellQnaDTO);
		return "redirect:./detail?itemNum=" + sellQnaDTO.getItemNum();
	}

	@PostMapping("qnadelete")
	@ResponseBody
	public int setSellQnaDelete(SellQnaDTO sellQnaDTO) throws Exception {
		int result = itemService.setSellQnaDelete(sellQnaDTO);
		return result;
	}

	@PostMapping("qnacommentalldelete")
	@ResponseBody
	public int setSellQnaCommentAllDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentAllDelete(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentdelete")
	@ResponseBody
	public int setSellQnaCommentDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentDelete(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentadd")
	@ResponseBody
	public int setSellQnaCommentAdd(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentAdd(sellQnaCommentDTO);
		return result;
	}

	@PostMapping("qnacommentupdate")
	@ResponseBody
	public int setSellQnaCommentUpdate(SellQnaCommentDTO sellQnaCommentDTO) throws Exception {
		int result = itemService.setSellQnaCommentUpdate(sellQnaCommentDTO);
		return result;
	}

	@GetMapping("map")
	public ModelAndView getMap(SellItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		itemDTO = itemService.getMap();
		mv.addObject("address", itemDTO);
		mv.setViewName("sell/map");
		return mv;
	}

	@GetMapping("search")
	public ModelAndView getItemOne(SellPager sellPager) throws Exception {
		List<SellItemDTO> ar = itemService.getItemList(sellPager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("pager", sellPager);
		return mv;
	}
	
	@PostMapping("allCartDelete")
	@ResponseBody
	public int setAllCartDelete(ShopCartDTO shopCartDTO) throws Exception{
		int result = itemService.setAllCartDelete(shopCartDTO);
		return result;
	}

	//?????? ?????? ??? DB ?????????
	@ResponseBody
	@RequestMapping(value = "payments", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String setPurchase(@RequestParam String imp_uid, 
			@RequestParam String merchant_uid, 
			@RequestParam String itemNum,
			@RequestParam String amount,
			@RequestParam String userId,
			@RequestParam(required = false) String revStartDate,
			@RequestParam String revEndDate,
			@RequestParam String adultsCount,
			@RequestParam String dogCount,
			@RequestParam String couponNum,
			HttpSession session) throws Exception {
			

			//?????? ??????
			IamportResponse<AccessToken> token = itemService.getToken();
			
			IamportClient client = itemService.getClient();
			
			Payment payment = client.paymentByImpUid(imp_uid).getResponse();
			String paymentResult = payment.getStatus();
			
			//??????????????? ??? ?????? ??????
			Long totalPrice = itemService.setPrice(itemNum, revStartDate, revEndDate, adultsCount, dogCount); 
			
			
			//?????? ??????
			CouponDTO couponDTO = new CouponDTO();
			System.out.println("userId:"+userId);
			if(!couponNum.equals("")) {
				couponDTO.setCouponNum(Long.parseLong(couponNum));
				couponDTO = adminDAO.getCouponByNum(couponDTO);
				couponDTO.setUserId(userId);
				if(couponDTO.getDiscountMethod().equals("0")) {
					totalPrice = totalPrice * (100 - couponDTO.getDiscountRate())/100;
					adminDAO.setDeleteMemberCoupon(couponDTO);
				}else {

					totalPrice = totalPrice - couponDTO.getDiscountPrice();
					adminDAO.setDeleteMemberCoupon(couponDTO);
						
				}
			}
			
			
			//?????? ?????? ????????? DB??? ??????????????? ?????? ?????? ??????
			if(amount.equals(totalPrice.toString())) {
				//????????? ?????? ??????
				if(paymentResult.equals("paid")) {
					PurchaseDTO purchaseDTO = new PurchaseDTO();
					purchaseDTO.setImp_uid(imp_uid);
					purchaseDTO.setMerchant_uid(merchant_uid);
					purchaseDTO.setItemNum(Long.parseLong(itemNum));
					purchaseDTO.setAmount(Long.parseLong(amount));
					purchaseDTO.setRevStartDate(revStartDate);
					purchaseDTO.setRevEndDate(revEndDate);
					purchaseDTO.setAdultsCount(Long.parseLong(adultsCount));
					purchaseDTO.setDogCount(Long.parseLong(dogCount));
					purchaseDTO.setUserId(userId);
					
					int result = itemService.setPurchase(purchaseDTO);
						//?????? ?????? ??????
						if(result>0) {
							return paymentResult;
						} else {
							paymentResult = "?????? ?????? ????????? ??????????????????. ??????????????? ??????????????????.";
							return paymentResult;
						}
					
						} else {
							paymentResult = "?????? ????????? ????????? ????????????. ???????????? ??????????????????.";
							return paymentResult;
						}
						} else {//????????? ????????? DB??? ?????? ????????? ?????? ?????? DB??? ????????? ?????? ?????? ?????? ?????? ??????
								String reason = "?????? ?????? ?????????";
								String code = itemService.setPurchaseCancel(token, reason, imp_uid);
								if(code.equals("0")) {
									paymentResult = "?????? ?????? ????????? ????????? ???????????????.";
									return paymentResult;
								} else {
									paymentResult = "????????? ??????????????? ??????????????? ???????????????. ???????????? ??????????????????.";
									return paymentResult;
								}
						}
		
		                          	            
            }

	
		
	
}

	
