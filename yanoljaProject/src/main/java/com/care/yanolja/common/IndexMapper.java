package com.care.yanolja.common;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

@Mapper
public interface IndexMapper {

	
	ArrayList<indexDTO> showMainIndex(String C_rental_type);
	
	/** 낮은 가격 */
	ArrayList<indexDTO> showMainIndexOrderByPrice(@Param("C_rental_type")String c_rental_type, @Param("selectedText")String selectedText);
	 /** 높은 가격*/
	ArrayList<indexDTO> showMainIndexOrderByPriceDesc(@Param("C_rental_type")String c_rental_type,@Param("selectedText")String selectedText);
	/** 높은 후기*/
	ArrayList<indexDTO> showMainIndexOrderByRating(@Param("C_rental_type")String c_rental_type,@Param("selectedText")String selectedText);
	/** 낮은 후기*/
	ArrayList<indexDTO> showMainIndexOrderByReviews(@Param("C_rental_type")String c_rental_type,@Param("selectedText")String selectedText);

	
	ArrayList<indexDTO> AllshowMainIndex(@Param("C_rental_type")String C_rental_type, @Param("C_region")String C_region);

	/** 낮은 가격 정렬*/
	ArrayList<indexDTO> AllshowMainIndexOrderByPrice(@Param("C_rental_type")String c_rental_type, @Param("C_region")String c_region, @Param("selectedText")String selectedText);
	/** 높은 가격 정렬*/
	ArrayList<indexDTO> AllshowMainIndexOrderByPriceDesc(@Param("C_rental_type")String c_rental_type, @Param("C_region")String c_region, @Param("selectedText")String selectedText);
	/** 높은 후기 정렬*/
	ArrayList<indexDTO> AllshowMainIndexOrderByRating(@Param("C_rental_type")String c_rental_type, @Param("C_region")String c_region, @Param("selectedText")String selectedText);
	/** 낮은 후기 정렬*/
	ArrayList<indexDTO> AllshowMainIndexOrderByReviews(@Param("C_rental_type")String c_rental_type, @Param("C_region")String c_region, @Param("selectedText")String selectedText);
	
	ArrayList<indexDTO> initialAllshowMainIndexOrderByReviews();
	
	ArrayList<indexDTO> regionshowMainIndex(@Param("C_region")String C_region);
	/** 낮은 가격 정렬*/
	ArrayList<indexDTO> regionshowMainIndexOrderByPrice(@Param("C_region")String c_region, @Param("selectedText")String selectedText);
	/** 높은 가격 정렬*/
	ArrayList<indexDTO> regionshowMainIndexOrderByPriceDesc(@Param("C_region")String c_region,@Param("selectedText")String selectedText);
	/** 높은 후기 정렬*/
	ArrayList<indexDTO> regionshowMainIndexOrderByRating(@Param("C_region")String c_region,@Param("selectedText")String selectedText);
	/** 낮은 후기 정렬*/
	ArrayList<indexDTO> regionshowMainIndexOrderByReviews(@Param("C_region")String c_region,@Param("selectedText")String selectedText);

	ArrayList<String> ImgSrcSetting(String imgSetting_RoomName);
	
	ArrayList<String> RepresentativemgSrcSetting(String hostName);

	indexDTO HostName(String c_rental_type);

	

	ArrayList<host_nameDTO> su_dae(@Param("hostName")String hostName);
	
	

	
	
	
	
	
	
	
	
	

	

	

	

	
	

	

	

}
