package com.care.yanolja.reservation;

import java.awt.Window;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.admin.AdminService;
import com.care.yanolja.rental.RentalDTO;
import com.care.yanolja.rental.RentalService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private RentalService rentalService;
	@Autowired
	private HttpSession session;
	
	

	@RequestMapping("reservationManager")
	public String reservationManager(Model model) {
		if (session.getAttribute("adminId") == null) {
			return "redirect:adminLogin";
		}

		rentalService.rentalSelect((String) session.getAttribute("adminId"), model);

		return "reservation/reservationManager";

	}

	@ResponseBody
	@PostMapping(value = "reservationCheck")
	public ArrayList<ReservationDTO> reservationCheck(@RequestBody(required = false) String radioReservation,
			Model model) {
		System.out.println("클릭 되었나 : " + radioReservation);

		return reservationService.reservationCheck(radioReservation, model);
	}

	@ResponseBody
	@PostMapping("testCheckIn")
	public void testCheckIn(@RequestBody(required = false) ReservationDTO reqData) {	
		
		reservationService.testCheckIn(reqData);

	}
	
	@ResponseBody
	@PostMapping("testCheckOut")
	public void testCheckOut(@RequestBody(required = false) ReservationDTO reqData) {	
		
		reservationService.testCheckOut(reqData);

	}

}
