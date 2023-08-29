package com.care.yanolja.reservation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.cart.MemCartDTO;
import com.care.yanolja.cart.MemCartService;
import com.care.yanolja.review.MemReviewDTO;

import jakarta.servlet.http.HttpSession;



@Controller
public class MemReserveController {
	@Autowired private MemReserveService mReseService;
	@Autowired private MemCartService mCartService;
	@Autowired private HttpSession session;
	
	
	@GetMapping("reservationPayment")
	public String reservationPayment() {
		String sessionid = (String)session.getAttribute("user_id");
		if(sessionid == null || sessionid.isEmpty()) {
			return "redirect:loginMember";
		}
		// 임의로 지정한 숙소정보
//		Date now = new Date(); // 현재 시간
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
//        String formattedDate = dateFormat.format(now);
//		session.setAttribute("rese_num", formattedDate);	
		return "reservation/reservationPayment";
	}

	
	@PostMapping("memReserveProc")
	public String memReserveProc(MemReserveDTO reservation, MemCartDTO cart, @RequestParam String buttonType) {
	    if (buttonType.equals("saveCartBtn")) { // "장바구니 담기" 버튼을 클릭한 경우, Cart DB 저장
//	    	String sessionRoomName = (String)session.getAttribute("room_name");
//	    	System.out.println("sessionRoomName : " + sessionRoomName);
//	    	String sessionCheckIn = (String)session.getAttribute("check_in");
//			if(cart.getRoomName().equals(sessionRoomName) && cart.getCheckIn().equals(sessionCheckIn)) {
//				System.out.println("장바구니 중복으로 저장실패");
//				return "redirect:reservationPayment";
//			}
	    	mCartService.memCartProc(cart);
	        return "redirect:memberCart";
	    } else if (buttonType.equals("paymentBtn")) { // "결제하기" 버튼을 클릭한 경우, reservation DB 저장
//	    	String payCheck_type = "결제완료";
//	        reservation.setPayCheck(payCheck_type);
	        mReseService.memReserveProc(reservation);
	        return "redirect:mypageMember";
	    } else {
	        return "redirect:reservationPayment";
	    }
	}
	
	@ResponseBody
	@PostMapping(value = "memReserve")
	public ArrayList<MemReserveDTO> memReserve() {
		System.out.println("memReserve");
		return mReseService.showReserveList();
	}
	
	// 3개월이내 후기 정렬
	@ResponseBody
	@PostMapping(value = "recent3MonthSort")
	public ArrayList<MemReserveDTO> recent3MonthSort() {
		System.out.println("최근 3개월");
		return mReseService.recent3MonthSort();
	}
	// 6개월이내 후기 정렬
	@ResponseBody
	@PostMapping(value = "recent6MonthSort")
	public ArrayList<MemReserveDTO> recent6MonthSort() {
		System.out.println("최근 6개월");
		return mReseService.recent6MonthSort();
	}
	// 1년이내 후기 정렬
	@ResponseBody
	@PostMapping(value = "recent1YearSort")
	public ArrayList<MemReserveDTO> recent1YearSort() {
		System.out.println("최근 1년");
		return mReseService.recent1YearSort();
	}

	@ResponseBody
	@PostMapping("reseDeleteProc")
	public void reseDeleteProc(@RequestBody(required = false) MemReserveDTO reqData) {
		//System.out.println("reseDeleteProc : " + reqData.getReseNum());
		mReseService.reseDeleteProc(reqData);
	}

	
	
}
