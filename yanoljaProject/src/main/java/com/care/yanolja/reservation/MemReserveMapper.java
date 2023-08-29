package com.care.yanolja.reservation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.care.yanolja.review.MemReviewDTO;

@Mapper
public interface MemReserveMapper {
	
	void memReserveProc(MemReserveDTO reservation);
	ArrayList<MemReserveDTO> reserveSelectId(String userId);
	void reseDeleteProc(MemReserveDTO reqData);
	void reseUpdateReviewProc(String userId, String reseNum, String hostName, String roomName, String reviewState);
	
	ArrayList<MemReserveDTO> recent3MonthSort(String userId);
	ArrayList<MemReserveDTO> recent6MonthSort(String userId);
	ArrayList<MemReserveDTO> recent1YearSort(String userId);
	
}
