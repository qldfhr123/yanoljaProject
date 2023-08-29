package com.care.yanolja.reservation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Service
public class ReservationService {
	@Autowired private ReservationMapper reservationMapper;
	@Autowired private HttpSession session;
	
	public ArrayList<ReservationDTO> reservationCheck(String radioReservation, Model model) {
		String hostName = radioReservation;
	    
		System.out.println("hostName : " + hostName);
		System.out.println("adminName : " + (String)session.getAttribute("adminName"));
		ArrayList<ReservationDTO> reservations = reservationMapper.reservationCheckProc(hostName, (String)session.getAttribute("adminName"));
	    		
		model.addAttribute("reservations",reservations);
		
		return reservations;
	}
	
	public void testCheckIn(ReservationDTO reservation) {
		reservationMapper.clickCheckInProc(reservation);
	}
	
	public void testCheckOut(ReservationDTO reservation) {
		reservationMapper.clickCheckOutProc(reservation);
	}
}
