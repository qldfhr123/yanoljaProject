package com.care.yanolja.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {
	@Autowired	private AdminMapper adminMapper;
	@Autowired	private HttpSession session;

	public String adminLoginProc(AdminDTO admin) {

		if (admin.getAdminId() == null || admin.getAdminId().isEmpty()) {
			return "아이디를 입력하세요";
			
		}
		
		if (admin.getAdminPw() == null || admin.getAdminPw().isEmpty()) {
			return "비밀번호를 입력하세요";
		}

		AdminDTO result = adminMapper.adminLoginProc(admin.getAdminId());
		
		if (result != null) {
			// 암호화 비밀번호					
			System.out.println("admin pw : " + admin.getAdminPw());
			System.out.println("result pw : "+ result.getAdminPw());
			
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			if (bpe.matches(admin.getAdminPw(), result.getAdminPw())) {			
//			if (admin.getAdminPw().equals(result.getAdminPw())) {
				session.setAttribute("adminId", result.getAdminId());
				session.setAttribute("adminPw", result.getAdminPw());
				session.setAttribute("adminLocation", result.getAdminLocation());
				session.setAttribute("businessNumber", result.getBusinessNumber());
				session.setAttribute("adminMobile", result.getAdminMobile());
				session.setAttribute("adminName", result.getAdminName());
				session.setAttribute("region", result.getRegion());
				return "로그인 성공";
			}
		}

		return "아이디/비밀번호를 확인 후 다시 시도하세요.";

	}
	
	public String adminRegiterProc(AdminDTO admin, String adminPwConfirm) {
		System.out.println("admin location : " + admin.getAdminLocation());
		
		if(admin.getAdminId()== null || admin.getAdminId().isEmpty()) {
			System.out.println("아이디를 입력하세요.");
			return "아이디를 입력하세요.";
		}
		
		if(admin.getAdminPw() == null || admin.getAdminPw().isEmpty()) {
			System.out.println("비밀번호를 입력하세요.");
			return "비밀번호를 입력하세요.";
		}
		
		if(admin.getAdminPw().equals(adminPwConfirm) == false) {
			System.out.println("두 비밀번호를 일치하여 입력하세요.");
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		
		if(admin.getAdminName() == null || admin.getAdminName().isEmpty()) {
			System.out.println("이름을 입력하세요.");
			return "이름을 입력하세요.";
		}
		
		if(admin.getBusinessNumber() == null || admin.getBusinessNumber().isEmpty()) {
			System.out.println("사업자번호를 입력하세요.");
			return "사업자번호를 입력하세요.";
		}
		
		AdminDTO result = adminMapper.adminLoginProc(admin.getAdminId());
		if(result == null) {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String cryptPassword = bpe.encode(admin.getAdminPw());
			admin.setAdminPw(cryptPassword);
			adminMapper.adminRegisterProc(admin);
			System.out.println("회원 등록 완료");
			return "회원 등록 완료";
		}
		
		System.out.println("이미 가입된 아이디 입니다.");
		return "이미 가입된 아이디 입니다.";
		
	}
	
	public String dupCheckProc(String adminId) {
		if (adminId == null || adminId.isEmpty()) {
			return "아이디를 입력하세요.";
		}
		
		AdminDTO result = adminMapper.adminLoginProc(adminId);
		
		if (result != null) {
			return "중복된 아이디입니다.";
		}
		
		return "사용 가능한 아이디입니다.";	
	}
	
	public String adminUpdateProc(AdminDTO admin, String adminPwConfirm, String adminPwCurrent) {
		if(admin.getAdminPw() == null || admin.getAdminPw().isEmpty()) {
			return "수정할 비밀번호를 입력하세요.";
		}
		
		if(admin.getAdminPw().equals(adminPwConfirm) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		
		
		AdminDTO loginResult = adminMapper.adminLoginProc(admin.getAdminId());
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		if(!bpe.matches(adminPwCurrent, loginResult.getAdminPw())) {
			return "현재 비밀번호가 틀렸습니다.";
		}
				
		String cryptPassword = bpe.encode(admin.getAdminPw());
		admin.setAdminPw(cryptPassword);
				
		int result = adminMapper.adminUpdateProc(admin);
		if(result == 1)
			return "회원 정보 수정 완료";
		return "회원 정보 수정 실패";
	}
	
	public String adminDeleteProc(String adminId) {
		AdminDTO admin = adminMapper.adminLoginProc(adminId);
		if (admin != null) {
			adminMapper.adminDeleteProc(adminId);
			return "회원 정보 삭제 완료";
		}
		
		return "회원 정보 삭제 실패";				
		
	}

}
