package com.pet.home.traveling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.util.SellPager;

@Controller
public class TravelingController {

	@Autowired
	private SellItemService sellItemService;

	@GetMapping("/traveling/map")
	public ModelAndView test(ModelAndView mv, SellPager sellPager) throws Exception {
		sellPager.setItemCatg(1L);
		List<SellItemDTO> list = sellItemService.getItemList(sellPager);
		
		for(SellItemDTO sellItemDTO : list) {
			List<SellFileDTO> ar =sellItemDTO.getFileDTOs();
			System.out.println(ar.get(0).getFileName());
		}
		
		mv.addObject("list", list);
		mv.setViewName("traveling/test");
		return mv;
	}
	
	@GetMapping("/traveling/getlist")
	@ResponseBody
	public List<SellItemDTO> getlist(ModelAndView mv) throws Exception{
		SellPager sellPager = new SellPager();
		sellPager.setItemCatg(1L);
		List<SellItemDTO> list = sellItemService.getItemList(sellPager);
		
		return list;
	}
}
