package com.care.yanolja.rental;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Service
public class RentalService {
	@Autowired private RentalMapper rentalMapper;
	@Autowired private HttpSession session;
	
		public void rentalSelect(String adminId, Model model) {
		
		ArrayList<RentalAdminDTO> rentals = rentalMapper.rentalSelectProc(adminId);	
		
		model.addAttribute("rentals",rentals);
	}

	public void hostTotalInfo(String addressAll, String host_info, String[] roomServices, String selectedCategory,
			String photo_name, String host_name,String region) {
		
		session.setAttribute("host_name", host_name);
		session.setAttribute("addressAll", addressAll);
		session.setAttribute("host_info", host_info);
		session.setAttribute("roomServices", roomServices);
		session.setAttribute("photo_name", photo_name);
		session.setAttribute("selectedCategory", selectedCategory);
		session.setAttribute("region", region);
		
	}

	public void host_daeInfo(String roomType_dae, String roomName_dae, String romPay_dae, String minPeopole_dae,
			String maxPeopole_dae, String ableTimeStart, String ableTime_last, String userTime, String imgfileNames, String hostName_dae) {
		
		String host_name = (String)session.getAttribute("host_name");
		String addressAll = (String)session.getAttribute("addressAll");
		String host_info = (String)session.getAttribute("host_info");
		String[] roomServices = (String[])session.getAttribute("roomServices");
		String roomServ = String.join(",", roomServices);
		String photo_name = (String)session.getAttribute("photo_name");
		String selectedCategory = (String)session.getAttribute("selectedCategory");
		String region = (String)session.getAttribute("region");
		
		if(host_name.equals(hostName_dae)) {
			
			session.setAttribute("roomType_dae", roomType_dae);
			session.setAttribute("roomName_dae", roomName_dae);
			session.setAttribute("romPay_dae", romPay_dae);
			session.setAttribute("minPeopole_dae", minPeopole_dae);
			session.setAttribute("maxPeopole_dae", maxPeopole_dae);
			session.setAttribute("ableTimeStart", ableTimeStart);
			session.setAttribute("ableTime_last", ableTime_last);
			session.setAttribute("userTime", userTime);
			session.setAttribute("imgfileNames", imgfileNames);
			session.setAttribute("hostName_dae", hostName_dae);
			String dead = "가능";
			session.setAttribute("dead", dead);
			
			
			rentalMapper.host_daeInfo(addressAll,host_info,roomServ,photo_name,selectedCategory,region,
					roomType_dae,roomName_dae,romPay_dae,minPeopole_dae,maxPeopole_dae,ableTimeStart,ableTime_last,userTime,imgfileNames,hostName_dae,dead);							
		}
		else {
			System.out.println("숙소 이름이 같지 않습니다");
		}
		
	}



	public void host_suInfo(String roomType_su, String roomName_su, String minPeopole_su, String maxPeopole_su,
			String ableTimeStart_su, String ableTime_last_su, String imgfileNames, String romPay_su,
			String hostName_su) {
		
		String host_name = (String)session.getAttribute("host_name");
		String addressAll = (String)session.getAttribute("addressAll");
		String host_info = (String)session.getAttribute("host_info");
		String[] roomServices = (String[])session.getAttribute("roomServices");
		String roomServ = String.join(",", roomServices);
		String photo_name = (String)session.getAttribute("photo_name");
		String selectedCategory = (String)session.getAttribute("selectedCategory");
		String region = (String)session.getAttribute("region");
		String dead = "가능";
		session.setAttribute("dead", dead);
		if(host_name.equals(hostName_su)) {
			rentalMapper.host_suInfo(
					addressAll,host_info,roomServ,photo_name,selectedCategory,region
					
					,roomType_su,roomName_su,minPeopole_su,maxPeopole_su,ableTimeStart_su,ableTime_last_su,imgfileNames,romPay_su,hostName_su,dead);
		}
		else {
			System.out.println("숙소 이름이 같지 않습니다");
		}
	}

	public void RoomUpdate(Model model) {
		
//		String adminId = (String)session.getAttribute(adminId);
		String adminId = "adminId";
		ArrayList <RentalDTO> UpdateMain = rentalMapper.RoomUpdate(adminId);
		
		for(RentalDTO rentalDto : UpdateMain) {
			System.out.println(rentalDto.getAddress());
			
		}
		model.addAttribute("UpdateMain", UpdateMain);
		
	}

	

}
