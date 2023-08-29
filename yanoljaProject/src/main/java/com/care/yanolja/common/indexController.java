package com.care.yanolja.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.yanolja.member.KakaoService;
import com.care.yanolja.member.MemberDTO;
import com.care.yanolja.member.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class indexController {
	@Autowired private indexService service;
	@Autowired private HttpSession session;

	@GetMapping("index")
	public String index(HttpServletRequest httpServletRequest, Model model) {
	    
		return "common/index";
		
	}
	
	@PostMapping("index")
	public String index(HttpServletRequest httpServletRequest, Model model, @RequestParam(value = "selectedMotelId", required = false) String motel,
            @RequestParam(value = "selectedChoices", required = false) String region,@RequestParam(value = "selectedHotelId", required = false) String hotel,
            @RequestParam(value = "selectedpensionId", required = false) String pension, @RequestParam(value = "selectedCampingId", required = false) String camping,
            @RequestParam(value = "adult", required = false) String adult, @RequestParam(value = "children", required = false)String children,
            @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false)String endDate,
            @RequestParam(value = "selectedText", required = false) String selectedText,
			@RequestParam(value = "YShowstartDate", required = false) String YShowstartDate,
			@RequestParam(value = "YShowendDate", required = false) String YShowendDate) {
		//세션이나 dto에 저장하기
		
		indexDTO indexdto = new indexDTO();
		indexdto.setRegion(region);
		 if (motel != null) {
		        indexdto.setRental_type(motel);
		    } 
		 else if (hotel != null) {
		        indexdto.setRental_type(hotel);
		    }
		 else if (pension != null) {
		        indexdto.setRental_type(pension);
		    }
		 else if (camping != null) {
		        indexdto.setRental_type(camping);
		    }

		
		
		session.setAttribute("selectedText", selectedText);
		System.out.println("선택한 정렬 "+selectedText);
		System.out.println("시작 날짜 출력: "+startDate);
		System.out.println("종료 날짜 출력: "+endDate);

		String index_checkInDate = YShowstartDate + " (월) 02:30";    // 2023.08.13 (월) 09:10
		String index_checkOutDate = YShowendDate + " (수) 11:30";
		
		String C_rental_type = indexdto.getRental_type();
		String C_region = indexdto.getRegion();
		
		
		if(YShowstartDate != null) {
			session.setAttribute("check_in", index_checkInDate);
		}
		if(YShowendDate != null) {
			session.setAttribute("check_out", index_checkOutDate);
		}
		if(adult != null) {
			session.setAttribute("people", adult);
		}
		if(children != null) {
			session.setAttribute("children", children);
		}
		if(C_rental_type != null) {
			session.setAttribute("room_type", C_rental_type);
		}
		if(C_region != null) {
			session.setAttribute("region", C_region);
		}
		
		
		System.out.println("check_in : " + session.getAttribute("check_in"));
		System.out.println("check_out : " + session.getAttribute("check_out"));
	
		System.out.println("people : " + session.getAttribute("people"));
		System.out.println("children : " + session.getAttribute("children"));
	
		System.out.println("people : " + session.getAttribute("people"));
		System.out.println("children : " + session.getAttribute("children"));
	    
		System.out.println("room_type : " + session.getAttribute("room_type"));
		System.out.println("region : " + session.getAttribute("region"));
	    
		if ((C_rental_type == null || C_rental_type.isEmpty() ) && (C_region == null || C_region.isEmpty())) {
	    	ArrayList<indexDTO> nullAllmainList =  service.initialAllindexShow(model);
	    	model.addAttribute("mainList", nullAllmainList);
	    }else if(C_rental_type != null  && C_region == null || C_region.isEmpty()) {
	    	ArrayList<indexDTO> mainList =  service.indexShow(C_rental_type, model,selectedText);
	    	model.addAttribute("mainList", mainList);
	    	
	    }
	    else if (C_region != null && C_rental_type== null || C_rental_type.isEmpty()) {
	    	ArrayList<indexDTO> regionmainList =  service.regionindexShow(C_region, model,selectedText);
	    	model.addAttribute("mainList", regionmainList);
	    }
	    else if (C_rental_type != null && C_region != null) {
	    	ArrayList<indexDTO> AllmainList =  service.allindexShow(C_rental_type,C_region, model,selectedText);
	    	model.addAttribute("mainList", AllmainList);
	    }
		return "common/index";
		
	}
	
	
	
	
	
	
}





