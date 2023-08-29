package com.care.yanolja.rental;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.care.yanolja.common.indexService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RentalController {
	
	@Autowired private RentalService service;
	@Autowired private HttpSession session;
	

	@GetMapping("newHouseManager")
	public String newHouseManager(HttpServletRequest httpServletRequest, Model model) {
	    
		return "rental/newHouseManager";
		
	}
	@GetMapping("existedHouseManager")
	public String existedHouseManager(HttpServletRequest httpServletRequest, Model model) {
		
		
	    
		return "rental/existedHouseManager";
		
	}
	 @PostMapping("existedHouseManager")
	 public String existedHouseManagerPost(HttpServletRequest httpServletRequest, Model model) {
			
			service.RoomUpdate(model);
		    
			return "rental/existedHouseManager";
	 }
	

	 @PostMapping("newHouseManager")
	 public String processForm(@RequestParam("selectedCategory") String selectedCategory, @RequestParam("roomServices") String[] roomServices, @RequestParam("photo_name")String photo_name,
			 @RequestParam("address") String address, @RequestParam("address_detail") String address_detail, @RequestParam("host_info") String host_info,@RequestParam("host_name")String host_name) {
		 System.out.println("host_name"+host_name);
		 String addressAll = address.concat(address_detail);
		 System.out.println("address:"+address);
		 System.out.println("addressAll:"+addressAll);//주소 전체
		 System.out.println("address_detail:"+address_detail);
		 System.out.println("host_info:"+host_info);
	     System.out.println("roomServices:"+Arrays.toString(roomServices));
	     System.out.println("selectedCategory:"+selectedCategory);
	     System.out.println("photo_name:"+photo_name);
	     
	     String region =address.substring(0, 2); 
	     System.out.println("region::"+region);
	     
	     service.hostTotalInfo(addressAll,host_info,roomServices,selectedCategory,photo_name,host_name,region);
	     
	        
	     return "common/index";
	   }
	 
	 
	 @RequestMapping("newHouseManager_dae")
	 public String dae(@RequestParam("roomName_dae") String roomName_dae,@RequestParam("minPeopole_dae") String minPeopole_dae,
			 @RequestParam("maxPeopole_dae") String maxPeopole_dae,@RequestParam("romPay_dae") String romPay_dae,
			 @RequestParam("userTime") String userTime,@RequestParam("ableTimeStart") String ableTimeStart,@RequestParam("ableTime_last") String ableTime_last,
			 @RequestParam("ImgfileNames") String ImgfileNames,@RequestParam("roomType_dae") String roomType_dae,@RequestParam("hostName_dae")String hostName_dae) {
		 System.out.println("대실 호출");
		 System.out.println("숙소 명 : "+hostName_dae);
		 System.out.println("등록한 숙소 형태"+roomType_dae);
		 System.out.println("객실명:"+roomName_dae);
		 System.out.println("가격:"+romPay_dae);
		 System.out.println("기준인원:"+minPeopole_dae);
		 System.out.println("최대 인원:"+maxPeopole_dae);
		 System.out.println("사용가능한 시작시간:"+ableTimeStart);
		 System.out.println("사용가능한 마지막 시간:"+ableTime_last);
		 System.out.println("사용가능한 시간:"+userTime);
		 System.out.println("등록된 사진 이름:"+ImgfileNames);
		 
		 service.host_daeInfo(roomType_dae,roomName_dae,romPay_dae,minPeopole_dae,maxPeopole_dae,ableTimeStart,ableTime_last,userTime,ImgfileNames,hostName_dae);
		 
		 
		 return "common/index";
	   }
	 
	 @RequestMapping("newHouseManager_su")
	 public String su(@RequestParam("ImgfileNames") String ImgfileNames,@RequestParam("minPeopole_su") String minPeopole_su,@RequestParam("maxPeopole_su") String maxPeopole_su,
			 @RequestParam("roomName_su") String roomName_su,@RequestParam("roomType_su") String roomType_su,
			 @RequestParam("ableTimeStart_su") String ableTimeStart_su, 
			 @RequestParam("ableTime_last_su") String ableTime_last_su,@RequestParam("romPay_su") String romPay_su,@RequestParam("hostName_su")String hostName_su  ) {
		 System.out.println("숙박 호출");
		 System.out.println("숙소 명 : "+hostName_su);
		 System.out.println("등록한 숙소 타입:"+roomType_su);
		 System.out.println("객실명:"+roomName_su);
		 System.out.println("기준인원:"+minPeopole_su);
		 System.out.println("최대 인원:"+maxPeopole_su);
		 System.out.println("체크인 시간:"+ableTimeStart_su);
		 System.out.println("체크아웃 시간:"+ableTime_last_su);
		 System.out.println("등록한 사진 이름:"+ImgfileNames);
		 System.out.println("가격:"+romPay_su);
		 
		 service.host_suInfo(roomType_su,roomName_su,minPeopole_su,maxPeopole_su,ableTimeStart_su,ableTime_last_su,ImgfileNames, romPay_su,hostName_su);
		 return "common/index";
	   }
	 
	 
	 //객실 숙 이미지 매서드 만들기
	 
	 /**객실 대표 이미지*/
	 @RequestMapping("img_Representative")
	 public String Dataimg(@RequestParam("RepresentativeimageName") String RepresentativeimageName, @RequestParam("RepresentativefileRoom")MultipartFile RepresentativefileRoom) {
		 System.out.println("이미지 호출");
		// 이미지 파일을 저장할 폴더 경로
	        String uploadFolderPath = "C:\\Users\\hi\\Desktop\\testimg\\";
	        
	        try {
	            // 업로드 폴더에 이미지 파일 저장
	            File file = new File(uploadFolderPath + RepresentativeimageName);
	            RepresentativefileRoom.transferTo(file);
	            
	            return "Image uploaded successfully";
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "Error uploading image";
	        }

	   }
	 
	 @RequestMapping("newHouseManager_img")
	 public String img(@RequestParam("imageName") String imageName, @RequestParam("fileRoomImg")MultipartFile fileRoom) {
		 System.out.println("이미지 호출");
		// 이미지 파일을 저장할 폴더 경로
	        String uploadFolderPath = "C:\\Users\\hi\\Desktop\\testimg\\";
	        
	        try {
	            // 업로드 폴더에 이미지 파일 저장
	            File file = new File(uploadFolderPath + imageName);
	            fileRoom.transferTo(file);
	            
	            return "Image uploaded successfully";
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "Error uploading image";
	        }

	   }
	 
	 /** 업데이트 사진*/
	 @RequestMapping("newHouseManager_img_update")
	 public String Hostimg(@RequestParam("UpdateimageName") String UpdateimageName, @RequestParam("fileRoomUpdate")MultipartFile fileRoomUpdate) {
		 System.out.println("객실이미지 호출");
		// 이미지 파일을 저장할 폴더 경로
	        String uploadFolderPath = "C:\\Users\\hi\\Desktop\\testimg\\";
	        
	        try {
	            // 업로드 폴더에 이미지 파일 저장
	            File file = new File(uploadFolderPath + UpdateimageName);
	            fileRoomUpdate.transferTo(file);
	            
	            
	            return "Image uploaded successfully";
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "Error uploading image";
	        }

	   }
}
