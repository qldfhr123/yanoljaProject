package com.care.yanolja.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Service
public class ReviewService {
	@Autowired private ReviewMapper reviewMapper;
	@Autowired private HttpSession session;
	
	public ArrayList<ReviewDTO> reviewCheck(String reviewRadio, Model model){
		String hostName = reviewRadio;
		
		System.out.println("hostName : " + hostName);
		
		ArrayList<ReviewDTO> reviews = reviewMapper.reviewCheckProc(hostName);
		
		model.addAttribute("reviews",reviews);
		
		return reviews;		
	}
	
	public ArrayList<ReviewDTO> reviewCheckStars(String reviewRadio, Model model){
		String hostName = reviewRadio;
		
		System.out.println("hostName : " + hostName);
		
		ArrayList<ReviewDTO> reviews = reviewMapper.reviewCheckProcStars(hostName);
		
		model.addAttribute("reviews",reviews);
		
		return reviews;		
	}
	
	public void answerUpload(ReviewDTO review) {
		reviewMapper.answerUpload(review);
	}
	
	public void answerModify(ReviewDTO review) {
		reviewMapper.answerModify(review);
	}
	
	public void answerDelete(ReviewDTO review) {
		reviewMapper.answerDelete(review);
	}
}
