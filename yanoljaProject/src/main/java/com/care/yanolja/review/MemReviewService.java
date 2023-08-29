package com.care.yanolja.review;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.yanolja.reservation.MemReserveDTO;
import com.care.yanolja.reservation.MemReserveMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class MemReviewService {
	@Autowired private MemReviewMapper mReviewMapper;
	@Autowired private MemReserveMapper mReseMapper;
	@Autowired private HttpSession session;
	
	
	public String memReviewProc(MemReviewDTO review) {
		String userId = (String)session.getAttribute("user_id");
		String reseNum = (String)session.getAttribute("rese_num");
		String roomName = (String)session.getAttribute("room_name");
		String hostName = (String)session.getAttribute("host_name");
		String reviewState = "후기작성완료";  
		// reservation DB 리뷰작성상태 UPDATE
		mReseMapper.reseUpdateReviewProc(userId, reseNum, hostName, roomName, reviewState);
		

		Date now = new Date(); // 현재 시간
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String formattedDate = dateFormat.format(now);
		review.setWriteDate(formattedDate);
		
		mReviewMapper.memReviewProc(review);
		System.out.println("리뷰 작성 완료");
		return "리뷰 작성 완료";
	}

	
	public ArrayList<MemReviewDTO> showReviewList() {		
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemReviewDTO> reviewList = mReviewMapper.reviewSelectId(userId);
		for(MemReviewDTO review : reviewList) {
			//System.out.println(review.getReseNum());
		}		
		return reviewList;
	}
		
	public void sendReviewData(MemReserveDTO reqData) {
		System.out.println("sendReviewData 전송 : " + reqData.getReseNum());
	}


	public void reviewDeleteProc(MemReviewDTO reqData) {
		System.out.println("reviewDeleteProc 삭제 : " + reqData.getReseNum());
		System.out.println("reviewDeleteProc 삭제 : " + reqData.getRoomName());
		mReviewMapper.reviewDeleteProc(reqData);
	}


	public void reviewUpdateProc(MemReviewDTO review) {
		mReviewMapper.reviewUpdateProc(review);
		System.out.println("reviewUpdateProc 수정 : " + review.getReseNum());
	}
}
