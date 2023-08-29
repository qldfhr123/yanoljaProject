package com.care.yanolja.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.rental.RentalService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	@Autowired HttpSession session;
	@Autowired RentalService rentalService;
	
	@GetMapping("reviewManager")
	public String reviewManager(Model model) {
		if (session.getAttribute("adminId") == null) {
			return "redirect:adminLogin";
		}
		
		rentalService.rentalSelect((String) session.getAttribute("adminId"), model);
		
		return "review/reviewManager";		
	}
	
	@ResponseBody
	@PostMapping("reviewCheck")
	public ArrayList<ReviewDTO> reviewCheck(@RequestBody(required = false) String reviewRadio, Model model){
		System.out.println("reveiw 볼 숙소명 : " + reviewRadio);
		
		return reviewService.reviewCheck(reviewRadio, model);
	}
	
	@ResponseBody
	@PostMapping("reviewCheckStars")
	public ArrayList<ReviewDTO> reviewCheckStars(@RequestBody(required = false) String reviewRadio, Model model){
		System.out.println("reveiw 볼 숙소명 : " + reviewRadio);
		
		return reviewService.reviewCheckStars(reviewRadio, model);
	}
	
	@ResponseBody
	@PostMapping("answerUpload")
	public void answerUpload(@RequestBody(required = false) ReviewDTO reqData ) {
		
		reviewService.answerUpload(reqData);
	}
	
	@ResponseBody
	@PostMapping("answerModify")
	public void answerModify(@RequestBody(required = false) ReviewDTO reqData) {
		
		reviewService.answerModify(reqData);
	}
	
	@ResponseBody
	@PostMapping("answerDelete")
	public void answerDelete(@RequestBody(required = false) ReviewDTO reqData) {
		
		reviewService.answerDelete(reqData);
	}
}
