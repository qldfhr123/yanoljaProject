package com.care.yanolja.cart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.yanolja.reservation.MemReserveDTO;
import com.care.yanolja.reservation.MemReserveMapper;
import com.care.yanolja.reservation.MemReserveService;

import jakarta.servlet.http.HttpSession;


@Service
public class MemCartService {
	@Autowired private MemCartMapper mCartMapper;
	@Autowired private MemReserveService mReseService;
	@Autowired private HttpSession session;
	
	
	public void memCartProc(MemCartDTO cart) {
		session.setAttribute("rese_num", cart.getReseNum());
		session.setAttribute("user_name", cart.getUserName());
		session.setAttribute("user_id", cart.getUserId());
		session.setAttribute("user_mobile", cart.getUserMobile());
		
		session.setAttribute("host_name", cart.getHostName());
		session.setAttribute("room_name", cart.getRoomName());
		session.setAttribute("admin_name", cart.getAdminName());
		session.setAttribute("region", cart.getRegion());
		session.setAttribute("room_info", cart.getRoomInfo());
		session.setAttribute("room_type", cart.getRoomType());
		session.setAttribute("room_price", cart.getRoomPrice());
		
		session.setAttribute("children", cart.getChildren());
		session.setAttribute("people", cart.getPeople());
		session.setAttribute("check_in", cart.getCheckIn());
		session.setAttribute("check_out", cart.getCheckOut());
		
		mCartMapper.memCartProc(cart);
		System.out.println("장바구니 등록 완료");
	}
	
	public ArrayList<MemCartDTO> showCartList() {		
		String userId = (String)session.getAttribute("user_id");
		ArrayList<MemCartDTO> cartList = mCartMapper.cartSelectId(userId);
		for(MemCartDTO cart : cartList) {
			//System.out.println(reserve.getReseNum());
		}		
		return cartList;
	}

	public void cartDeleteProc(MemCartDTO reqData) {
		System.out.println("cartDeleteProc 삭제 : " + reqData.getUserId());
		mCartMapper.cartDeleteProc(reqData);
	}

	
	public void cartToRese(ArrayList<String> selectedValues) {
		System.out.println("장바구니 선택 selectedValues : " + selectedValues);
		
		for(int i=0; i < selectedValues.size(); i++) {
			MemCartDTO cart = mCartMapper.cartSelectReseNum(selectedValues.get(i)); // reseNum과 일치하는 항목 조회
	        System.out.println("장바구니 선택 : " + cart);
	        
            MemReserveDTO reservation = new MemReserveDTO();
            Date now = new Date(); // 현재 시간
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
            String formattedDate = dateFormat.format(now);
            System.out.println("Now(cartToRese) : " + formattedDate);
            
            reservation.setReseNum(formattedDate);
            reservation.setUserName(cart.getUserName());
            reservation.setUserId(cart.getUserId());
            reservation.setUserMobile(cart.getUserMobile());
            reservation.setHostName(cart.getHostName());
            reservation.setRoomName(cart.getRoomName());
            reservation.setAdminName(cart.getAdminName());
            reservation.setRegion(cart.getRegion());
            reservation.setRoomInfo(cart.getRoomInfo());
            reservation.setRoomType(cart.getRoomType());
            reservation.setRoomPrice(cart.getRoomPrice());
            reservation.setChildren(cart.getChildren());
            reservation.setPeople(cart.getPeople());
            reservation.setCheckIn(cart.getCheckIn());
            reservation.setCheckOut(cart.getCheckOut());
            reservation.setRepresentativeImg((String)session.getAttribute("imagePath"));
            mReseService.memReserveProc(reservation);
            
            
            // 예약 후 장바구니 항목삭제
    		mCartMapper.cartDeleteProc(cart.getUserId(), cart.getRoomName(), cart.getCheckIn()); 
    		System.out.println("장바구니 -> 예약 완료");   
		}
        
    }

	
}
