package com.care.yanolja.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.yanolja.admin.AdminDTO;
import com.care.yanolja.common.indexDTO;
import com.care.yanolja.reservation.MemReserveDTO;
import com.care.yanolja.reservation.MemReserveService;
import com.care.yanolja.review.MemReviewDTO;
import com.care.yanolja.review.MemReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService mService;
	@Autowired private MemReserveService mReseService;
	@Autowired private MemReviewService mReviewService;
	@Autowired private HttpSession session;
	@Autowired private KakaoService kakao;

	
	
	@GetMapping("registerMember")
	public String registerMember() {
		return "member/registerMember";
	}
	@PostMapping("registerMemberProc")
	public String registerMemberProc(MemberDTO member, String confirm) {
		String result = mService.registerMemberProc(member, confirm);
		if(result.equals("회원 등록 완료")) {
			return "redirect:loginMember";
		}
		return "redirect:registerMember";
	}
//	@ResponseBody   아이디 중복확인 넣기
//	@RequestMapping(value="checkAvailableID", method=RequestMethod.POST)
//	public String checkAvailableID(String userId) {
//		MemberDTO result = service.isIdAvailable(userId);
//		
//	}
	
	
	@GetMapping("loginMember")
	public String loginMember() {
		return "member/loginMember";
	}	
	@PostMapping("loginMemberProc")
	public String memberDto(MemberDTO member) {
		String result = mService.loginMemberProc(member);
		if(result.equals("로그인 성공")) {
			System.out.println("로그인 성공");
			return "redirect:index";
		}
		System.out.println("로그인 실패");
		return "redirect:loginMember";
	}
	
	
	@ResponseBody
	@PostMapping(value = "memberdupCheck", produces = "text/plain; charset=utf-8")
	public String dupCheck(@RequestBody(required = false) String Id) {

		return mService.memberdupCheckProc(Id);

	}
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin(String code) {
//		System.out.println("code : " + code);
		kakao.getAccessToken(code);
		MemberDTO member = kakao.getUserInfo();
		String result = mService.kakaoLoginProc(member);
		System.out.println("카카오계정(controller-kakaoLogin) : " + member);
		if(result.equals("카카오 회원등록하기")) {
			session.setAttribute("user_id", member.getUserId());	
			session.setAttribute("user_email", member.getUserEmail());
			session.setAttribute("user_name", member.getUserName());
//			memberMapper.kakaoInsert(member);
            return "redirect:kakaoRegister"; 
        } else {  
        	System.out.println("로그인 성공");
            return "redirect:index";
        }
	}
	

	
	
	@GetMapping("kakaoRegister")
	public String kakaoRegister() {
		return "member/kakaoRegister";
	}
	@PostMapping("kakaoRegisterProc")
	public String kakaoRegisterProc(MemberDTO member, String confirm) {
		String result = mService.kakaoRegisterProc(member);
		if(result.equals("카카오 회원가입 완료")) {
			System.out.println("카카오 회원가입 완료");
			return "redirect:index";
		}
		return "redirect:loginMember";
	}
	
	
	@GetMapping("memberUpdate")
	public String memberUpdate() {
		return "member/memberUpdate";
	}
	@GetMapping("mypageMember")
	public String mypageMember(Model model) {
		String id = (String)session.getAttribute("user_id");
		if(id == null || id.isEmpty()) {
			return "redirect:loginMember";
		}
		return "member/mypageMember";
	}
	@PostMapping("updateMemberProc")
	public String updateMemberProc(MemberDTO member, String confirm) {
		String id = (String)session.getAttribute("user_id");
		member.setUserId(id);
		String result = mService.updateMemberProc(member, confirm);
		if(result.equals("회원정보 수정 완료")) {
			System.out.println("회원정보 수정 완료");
			return "member/mypageMember";
		}
		return "member/mypageMember";
	}
	
	
	@GetMapping("memberDelete")
	public String memberDelete() {
		return "member/memberDelete";
	}	
	@PostMapping("deleteMemberProc")
	public String deleteMemberProc(MemberDTO member) {
        String result = mService.memberLoginType(member);
		if(result.equals("카카오계정")) {
			kakao.unLink();
		}
		mService.deleteMemberProc(member);
		session.invalidate();
        System.out.println("회원 탈퇴 성공");
        return "redirect:index";
    }

	
	@GetMapping("logoutMember")
	public String logoutMember(MemberDTO member) {
//		String result = service.memberLoginType(member);
//		if(result.equals("카카오계정")) {
//			kakao.unLink();
//		}
		session.invalidate();
		System.out.println("로그아웃 완료");
		return "redirect:index";
	}

	@GetMapping("kakaoLogout")
	public String kakaoLogout() {
		kakao.unLink();
		return "redirect:index";
	}

	
	
	
	
	
	
	
	
	
	
	// 메인페이지에서 숙소정보 전달 -> places/placesDetail
//	@ResponseBody
//	@PostMapping("sendHostInfoData")
//	public void sendHostInfoData(@RequestBody(required = false) indexDTO reqData) {
//		System.out.println("sendHostInfoData : " + reqData);
//		String userId = (String)session.getAttribute("user_id");
//		session.setAttribute("user_id", userId);
//		session.setAttribute("host_name", reqData.getHost_name());	
//		session.setAttribute("room_name", reqData.getRoom_name());
//		session.setAttribute("admin_id", reqData.getAdmin_id());
//		session.setAttribute("admin_name", reqData.getAdmin_name());
//		session.setAttribute("room_price", reqData.getRoom_pay());
//		
//		String admin_id = (String)session.getAttribute("admin_id");
//		
//		System.out.println("index 세션저장 : " + admin_id);
//		System.out.println("index 세션저장 : " + reqData.getRoom_name());
//		System.out.println("index 세션저장 : " + reqData.getAdmin_id());
//		System.out.println("index 세션저장 : " + reqData.getAdmin_name());
//		System.out.println("index 세션저장 : " + reqData.getRoom_pay());
//		//return "default/places";
//	}
	@ResponseBody
	@PostMapping("pageChange")
	public String pageChange(@RequestBody(required = false) indexDTO reqData) {
		
		System.out.println("sendHostInfoData : " + reqData);
		String admin_id = reqData.getAdmin_id();
		System.out.println("admin_id::::::"+admin_id);
		String userId = (String)session.getAttribute("user_id");
		session.setAttribute("user_id", userId);
		session.setAttribute("host_name", reqData.getHost_name());	
		session.setAttribute("room_name", reqData.getRoom_name());
		session.setAttribute("admin_id", reqData.getAdmin_id());
		session.setAttribute("admin_name", reqData.getAdmin_name());
		session.setAttribute("room_price", reqData.getRoom_pay());
		
//		String admin_id = (String)session.getAttribute("admin_id");
		
		System.out.println("index 세션저장 : " + userId);
		System.out.println("index 세션저장 : " + reqData.getRoom_name());
		System.out.println("index 세션저장 : " + reqData.getAdmin_id());
		System.out.println("index 세션저장 : " + reqData.getAdmin_name());
		System.out.println("index 세션저장 : " + reqData.getRoom_pay());	
		return "redirect:places";
	}
	

	
	
	
	@GetMapping("places")
	public String places(Model model) {
		String sessionid = (String)session.getAttribute("user_id");
		String sessionUserName = (String)session.getAttribute("user_name");
		String sessionUserMobile = (String)session.getAttribute("user_mobile");
		session.setAttribute("user_name", sessionUserName);
		session.setAttribute("user_id", sessionid);
		session.setAttribute("user_mobile", sessionUserMobile);
		
		
		// 예약을 위한 세션저장
		
		//session.setAttribute("region", "숙소위치");		
		//session.setAttribute("room_type", "숙박/대실");		
		//session.setAttribute("children", "2");
		//session.setAttribute("people", "3");
		
//		session.setAttribute("host_name", "신천(잠실새내) FOREST 2호점 (포레스타2)");
//		session.setAttribute("room_name", "Deluxe");
//		session.setAttribute("admin_name", "관리자1");
//		session.setAttribute("room_price", "50000");
	
		//session.setAttribute("check_in", "2023.07.24 (월) 06:00");
		//session.setAttribute("check_out", "2023.07.25 (화) 13:00");
		
		
		
		return "default/places";
	}
	
	
	
	@GetMapping("placesDetail")
	public String placesDetail() {
		return "default/placesDetail";
	}
	
	
	




	///////////////////////////////////////////////////////////////////
	

	
	@ResponseBody
	@PostMapping(value = "sendEmail", produces = "text/plain; charset=utf-8")
	public String sendEmail(@RequestBody(required = false) String email) {
		return mService.sendEmail(email);
	}
	
	@ResponseBody
	@PostMapping(value = "sendAuth", produces = "text/plain; charset=utf-8")
	public String sendAuth(@RequestBody(required = false) String auth) {
		System.out.println("sendAuth()");
		return mService.sendAuth(auth);
	}
	
	
	
	
	

	
	
	
	
	
}





