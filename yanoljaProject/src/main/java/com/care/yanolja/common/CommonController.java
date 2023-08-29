package com.care.yanolja.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommonController {
	@Autowired
	private CommonService service;
	@Autowired
	private HttpSession session;

//	@RequestMapping("index")
//	public String index() {
//		return "default/index";
//	}
	
	@RequestMapping("index_header")
	public String index_header() {
		return "default/index_header";
	}

	@RequestMapping("header")
	public String header() {
		return "default/header";
	}

	@RequestMapping("footer")
	public String footer() {

		return "default/footer";
	}

	@RequestMapping("loginMain")
	public String loginMain() {
		return "default/loginMain";
	}

	@RequestMapping("myPage")
	public String myPage() {
		String adminId = (String) session.getAttribute("adminId");
		String userId = (String) session.getAttribute("user_id");

		if (adminId == null || adminId.isEmpty()) {
			if (userId == null || userId.isEmpty()) {
				return "default/loginMain";
			}else {
				return "redirect:mypageMember";
			}
			
		}

		return "redirect:existedHouseManager";

	}
	
	@RequestMapping("Cart")
	public String Cart() {
		String adminId = (String) session.getAttribute("adminId");
		String userId = (String) session.getAttribute("user_id");

		if (adminId == null || adminId.isEmpty()) {
			if (userId == null || userId.isEmpty()) {
				return "default/loginMain";
			}else {
				return "redirect:memberCart";
			}
			
		}

		return "redirect:index";

	}
}
