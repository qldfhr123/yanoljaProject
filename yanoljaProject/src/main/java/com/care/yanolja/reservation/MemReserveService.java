package com.care.yanolja.reservation;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.yanolja.review.MemReviewDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class MemReserveService {
	@Autowired private MemReserveMapper mReseMapper;
	@Autowired private HttpSession session;
	
	
	public void memReserveProc(MemReserveDTO reservation) {
		session.setAttribute("rese_num", reservation.getReseNum());	
		session.setAttribute("user_name", reservation.getUserName());
		session.setAttribute("user_id", reservation.getUserId());
		session.setAttribute("user_mobile", reservation.getUserMobile());
		
		session.setAttribute("host_name", reservation.getHostName());
		session.setAttribute("room_name", reservation.getRoomName());
		session.setAttribute("admin_name", reservation.getAdminName());
		session.setAttribute("region", reservation.getRegion());
		session.setAttribute("room_info", reservation.getRoomInfo());
		session.setAttribute("room_type", reservation.getRoomType());
		session.setAttribute("room_price", reservation.getRoomPrice());
		
		session.setAttribute("children", reservation.getChildren());
		session.setAttribute("people", reservation.getPeople());
		session.setAttribute("check_in", reservation.getCheckIn());
		session.setAttribute("check_out", reservation.getCheckOut());
		
		mReseMapper.memReserveProc(reservation);
		System.out.println("숙소 예약 완료");
	}

//	public ArrayList<MemReserveDTO> saveReserveList(Model model) {		
//		String userId = (String)session.getAttribute("user_id");
//		ArrayList<MemReserveDTO> reserveList = mReseMapper.reserveSelectId(userId);
//		for(MemReserveDTO reserve : reserveList) {
//			System.out.println(reserve);
//		}
//		model.addAttribute("reserveList", reserveList);
//		return reserveList;
//	}
	
	public ArrayList<MemReserveDTO> showReserveList() {		
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemReserveDTO> reserveList = mReseMapper.reserveSelectId(userId);
		for(MemReserveDTO reserve : reserveList) {
			//System.out.println(reserve.getReseNum());
		}		
		return reserveList;
	}
	
	// 예약내역 정렬
	public ArrayList<MemReserveDTO> recent3MonthSort(){
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemReserveDTO> reviewList = mReseMapper.recent3MonthSort(userId);
		return reviewList;		
	}
	public ArrayList<MemReserveDTO> recent6MonthSort(){
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemReserveDTO> reviewList = mReseMapper.recent6MonthSort(userId);
		return reviewList;		
	}
	public ArrayList<MemReserveDTO> recent1YearSort(){
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemReserveDTO> reviewList = mReseMapper.recent1YearSort(userId);
		return reviewList;		
	}
	
	
	public void reseDeleteProc(MemReserveDTO reqData) {
		System.out.println("reseDeleteData 삭제 : " + reqData.getReseNum());
		mReseMapper.reseDeleteProc(reqData);
	}




	
}
