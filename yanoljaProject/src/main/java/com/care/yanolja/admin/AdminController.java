package com.care.yanolja.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private HttpSession session;

	@GetMapping("adminLogin")
	public String adminLogin() {
		String adminId = (String)session.getAttribute("adminId");
		System.out.println("adminId : " + adminId);
		if (adminId == null || adminId.isEmpty()) {
			return "admin/adminLogin";
		}
		return "redirect:index";
	}

	@PostMapping("adminLoginProc")
	public String adminLoginProc(AdminDTO admin) {

		String result = service.adminLoginProc(admin);
		System.out.println(result);
		if (result.equals("로그인 성공")) {
			return "redirect:index";
		}
		return "redirect:adminLogin";
	}

	@RequestMapping("adminLogout")
	public String adminLogout() {
		session.invalidate();
		return "redirect:loginMain";
	}

	@GetMapping("adminRegister")
	public String adminRegister() {
		return "admin/adminRegister";
	}

	@PostMapping("adminRegisterProc")
	public String adminRegisterProc(AdminDTO admin, String adminPwConfirm, String adminAddress,
			String adminDetailAddress, String postcode) {
		String adminLocation = postcode + " " + adminAddress + " " + "," + adminDetailAddress;
		admin.setAdminLocation(adminLocation);
		String result = service.adminRegiterProc(admin, adminPwConfirm);
		if (result.equals("회원 등록 완료")) {
			System.out.println("등록 성공!");
			return "redirect:index";
		}
		System.out.println("등록 실패!");
		return "admin/adminRegister";
	}

	@ResponseBody
	@PostMapping(value = "dupCheck", produces = "text/plain; charset=utf-8")
	public String dupCheck(@RequestBody(required = false) String adminId) {

		return service.dupCheckProc(adminId);

	}

	@GetMapping("adminUpdate")
	public String adminUpdate() {
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null || adminId.isEmpty()) {
			return "redirect:adminLogin";
		}
		return "admin/adminUpdate";
	}

	@PostMapping("adminUpdateProc")
	public String adminUpdateProc(AdminDTO admin, String adminPwCurrent, String adminPwConfirm, String adminAddress,
			String adminDetailAddress, String postcode) {
		String adminLocation = postcode + " " + adminAddress + " " + "," + adminDetailAddress;
		admin.setAdminLocation(adminLocation);
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null || adminId.isEmpty()) {
			return "redirect:adminLogin";
		}
		admin.setAdminId(adminId);
		String result = service.adminUpdateProc(admin, adminPwConfirm, adminPwCurrent);
		System.out.println("회원정보수정결과 : " + result);
		if (result.equals("회원 정보 수정 완료")) {
			return "forward:adminLogout";
		}

		return "admin/adminUpdate";
	}

	@GetMapping("adminDelete")
	public String adminDelete() {
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null || adminId.isEmpty()) {
			return "redirect:adminLogin";
		}
		return "admin/adminDelete";
	}

	@PostMapping("adminDeleteProc")
	public String adminDeleteProc() {
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null || adminId.isEmpty()) {
			return "redirect:adminLogin";
		}
		String result = service.adminDeleteProc(adminId);
		System.out.println("회원정보삭제 : " + result);
		if (result.equals("회원 정보 삭제 완료")) {
			return "forward:adminLogout";
		}
		return "admin/adminDelete";
	}

}
