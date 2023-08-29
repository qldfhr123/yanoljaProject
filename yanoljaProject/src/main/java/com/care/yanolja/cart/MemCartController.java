package com.care.yanolja.cart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.member.MemberDTO;
import com.care.yanolja.reservation.MemReserveDTO;
import com.care.yanolja.reservation.MemReserveService;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemCartController {
	@Autowired private MemCartService mCartService;
	@Autowired private HttpSession session;
	
	
	@GetMapping("memberCart")
	public String memberCart() {
		String id = (String)session.getAttribute("user_id");
		if(id == null || id.isEmpty()) {
			return "redirect:loginMember";
		}
		return "cart/memberCart";
	}

	@ResponseBody
	@PostMapping(value = "memCart")
	public ArrayList<MemCartDTO> memCart() {
		System.out.println("memCart");
		return mCartService.showCartList();
	}
	
	@ResponseBody
	@PostMapping("cartDeleteProc")
	public void cartDeleteProc(@RequestBody(required = false) MemCartDTO reqData) {
		System.out.println("cartDeleteProc : " + reqData.getUserId());
		mCartService.cartDeleteProc(reqData);
    }
	
	@ResponseBody
	@PostMapping("cartToRese")
    public String cartToRese(@RequestBody(required = false) ArrayList<String> selectedValues) {
		mCartService.cartToRese(selectedValues);
        return "success";
    }
	
	@ResponseBody
	@PostMapping("requestPay")
    public void requestPay() {
    }

	
}
