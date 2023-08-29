package com.care.yanolja.reservation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {
	ArrayList<ReservationDTO> reservationCheckProc(String hostName, String adminName);
	void clickCheckInProc(ReservationDTO reservation);
	void clickCheckOutProc(ReservationDTO reservation);
}
