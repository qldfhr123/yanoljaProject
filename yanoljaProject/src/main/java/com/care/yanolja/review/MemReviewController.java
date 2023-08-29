package com.care.yanolja.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.member.MemberDTO;
import com.care.yanolja.reservation.MemReserveDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemReviewController {
	@Autowired private HttpSession session;
	@Autowired private MemReviewMapper mReviewMapper;
	@Autowired private MemReviewService mReviewService;
	
	@GetMapping("reviewMember")
	public String reviewMember() {
		return "review/reviewMember";
	}
	
	@GetMapping("reviewUpdateMember")
	public String reviewUpdateMember() {
		return "review/reviewUpdateMember";
	}
	
	@PostMapping("memReviewProc")
	public String memReviewProc(MemReviewDTO review) {
		String result = mReviewService.memReviewProc(review);
		System.out.println(result);
		if(result.equals("리뷰 작성 완료")) {
			return "redirect:mypageMember";
		}
		return "redirect:reviewMember";
	}
	
	// 마이페이지 후기리스트 정렬
	@ResponseBody
	@PostMapping(value = "memReview")
	public ArrayList<MemReviewDTO> memReview() {
		System.out.println("memReview");
		return mReviewService.showReviewList();
	}
	
	// 마이페이지에서 숙소정보 전달받음
	@ResponseBody
	@PostMapping("sendReviewData")
	public String sendReviewData(@RequestBody(required = false) MemReserveDTO reqData) {
		System.out.println("sendReviewData : " + reqData.getReseNum());
		String userId = (String)session.getAttribute("user_id");
		session.setAttribute("rese_num", reqData.getReseNum());	
		session.setAttribute("user_id", userId);
		session.setAttribute("host_name", reqData.getHostName());
		session.setAttribute("room_name", reqData.getRoomName());
		
		return "review/reviewMember";
	}

	@ResponseBody
	@PostMapping("reviewDeleteProc")
	public void reseDeleteProc(@RequestBody(required = false) MemReviewDTO reqData) {
		//System.out.println("reviewDeleteProc : " + reqData.getReseNum());
		mReviewService.reviewDeleteProc(reqData);
	}
	
	@ResponseBody
	@PostMapping("reviewUpdate")
	public void reviewUpdate(@RequestBody(required = false) MemReviewDTO reqData) {
		//System.out.println("reviewDeleteProc : " + reqData.getReseNum());
		String userId = (String)session.getAttribute("user_id");
		session.setAttribute("rese_num", reqData.getReseNum());	
		session.setAttribute("user_id", userId);
		session.setAttribute("host_name", reqData.getHostName());
		session.setAttribute("room_name", reqData.getRoomName());	
	}
	
	@PostMapping("reviewUpdateProc")
	public String reviewUpdateProc(MemReviewDTO review) {
		mReviewService.reviewUpdateProc(review);
		
		return "redirect:mypageMember";
	}
	

}
