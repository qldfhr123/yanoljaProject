package com.care.yanolja.rental;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;



@Mapper
public interface RentalMapper {

	void host_daeInfo(
			@Param("addressAll")String addressAll, @Param("host_info")String host_info, @Param("roomServ")String roomServ, @Param("selectedCategory")String selectedCategory,
			@Param("photo_name")String photo_name,@Param("region")String region ,
		
			@Param("roomType_dae")String roomType_dae, @Param("roomName_dae")String roomName_dae, @Param("romPay_dae")String romPay_dae, @Param("minPeopole_dae")String minPeopole_dae,
			@Param("maxPeopole_dae")String maxPeopole_dae, @Param("ableTimeStart")String ableTimeStart, @Param("ableTime_last")String ableTime_last, @Param("userTime")String userTime, @Param("imgfileNames")String imgfileNames,@Param("hostName_dae")String hostName_dae,@Param("dead")String dead);

	void host_suInfo(
			@Param("addressAll")String addressAll, @Param("host_info")String host_info, @Param("roomServ")String roomServ, @Param("selectedCategory")String selectedCategory,
			@Param("photo_name")String photo_name,@Param("region")String region ,
			
			
			@Param("roomType_su")String roomType_su, @Param("roomName_su")String roomName_su, @Param("minPeopole_su")String minPeopole_su, @Param("maxPeopole_su")String maxPeopole_su,
			@Param("ableTimeStart_su")String ableTimeStart_su, @Param("ableTime_last_su")String ableTime_last_su, @Param("imgfileNames")String imgfileNames, @Param("romPay_su")String romPay_su, @Param("hostName_su")String hostName_su,@Param("dead")String dead);

	ArrayList<RentalDTO> RoomUpdate(String adminId);
	
	ArrayList<RentalAdminDTO> rentalSelectProc(String adminId);


	//테이블 만들기 어떻게 무엇을 사용해서 만들건지 
	// 이미지 보여주는건 이미지들이 있는 파일에 파일명을 넣고 맞으면 출력하게해서 리스트에 담기
	//그걸 보여주기
}
