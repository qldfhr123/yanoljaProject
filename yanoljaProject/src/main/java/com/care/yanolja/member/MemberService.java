package com.care.yanolja.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.yanolja.admin.AdminDTO;

import jakarta.servlet.http.HttpSession;


@Service
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private HttpSession session;

	
	public String loginMemberProc(MemberDTO member) {
		if(member.getUserId() == null || member.getUserId().isEmpty()) {
			return "아이디를 입력하세요.";
		}		
		if(member.getUserPw() == null || member.getUserPw().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}	
		MemberDTO result = memberMapper.loginMemberProc(member.getUserId());
		if(result != null){  // pw 암호화 후 로그인 시
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			if(bpe.matches(member.getUserPw(), result.getUserPw())) {  // (원본 Pw, 암호화된 Pw)
				session.setAttribute("user_id", result.getUserId());	
				session.setAttribute("user_email", result.getUserEmail());
				session.setAttribute("user_name", result.getUserName());
				session.setAttribute("user_mobile", result.getUserMobile());
				session.setAttribute("user_dob", result.getUserDob());
				session.setAttribute("user_snsC", result.getUserSnsC());
				System.out.println("회원가입종류 : " + session.getAttribute("user_snsC"));
				return "로그인 성공";
			}
		}	
		return "아이디/비밀번호를 확인 후 다시 시도하세요.";
	}
	
	public String memberdupCheckProc(String Id) {
		if (Id == null || Id.isEmpty()) {
			return "아이디를 입력하세요.";
		}
		
		MemberDTO result = memberMapper.loginMemberProc(Id);
		
		if (result != null) {
			return "중복된 아이디입니다.";
		}
		
		return "사용 가능한 아이디입니다.";	
	}

	public String registerMemberProc(MemberDTO member, String confirm) {
		if(member.getUserPw().equals(confirm) == false) {
			return "비밀번호가 일치하지 않습니다. 다시 입력하세요.";
		}	
		MemberDTO result = memberMapper.loginMemberProc(member.getUserId());
		if(result == null) {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String cryptPassword = bpe.encode(member.getUserPw());
			member.setUserPw(cryptPassword);
			memberMapper.registerMemberProc(member);
			return "회원 등록 완료";
		}	
		return "이미 가입된 아이디 입니다.";
	}

//	public String isIdAvailable(String userId) {
//        MemberDTO result = memberMapper.loginMemberProc(userId);
//        if(result == null) {
//        	return "사용가능 아이디";
//        }
//        return "사용불가능 아이디";
//	}
        

	
	// 카카오 계정
	public String kakaoLoginProc(MemberDTO member) {	
		MemberDTO result = memberMapper.loginMemberProc(member.getUserId());
		if(result != null){  // pw 암호화 후 로그인 시
			session.setAttribute("user_id", result.getUserId());	
			session.setAttribute("user_email", result.getUserEmail());
			session.setAttribute("user_name", result.getUserName());
			session.setAttribute("user_mobile", result.getUserMobile());
			session.setAttribute("user_dob", result.getUserDob());
			session.setAttribute("user_snsC", result.getUserSnsC());
			return "로그인 성공";
		}	
		return "카카오 회원등록하기";
	}

	public String kakaoRegisterProc(MemberDTO member) {
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String cryptPassword = bpe.encode(member.getUserPw());
		member.setUserPw(cryptPassword);
		memberMapper.kakaoInsert(member);
		session.setAttribute("user_id", member.getUserId());	
		session.setAttribute("user_email", member.getUserEmail());
		session.setAttribute("user_name", member.getUserName());
		session.setAttribute("user_mobile", member.getUserMobile());
		session.setAttribute("user_dob", member.getUserDob());
		session.setAttribute("user_snsC", member.getUserSnsC());

		return "카카오 회원가입 완료";
	}

	
	public String updateMemberProc(MemberDTO member, String confirm) {
		if(member.getUserPw() == null || member.getUserPw().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}	
		if(member.getUserPw().equals(confirm) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String cryptPassword = bpe.encode(member.getUserPw());
		member.setUserPw(cryptPassword);
		
		int result = memberMapper.updateMemberProc(member);
		if(result == 1)
			return "회원정보 수정 완료";
		return "회원정보 수정 실패";
	}

	public String deleteMemberProc(MemberDTO member) {
		String sessionId = (String)session.getAttribute("user_id");	
		System.out.println("sessionId : " + sessionId);
		memberMapper.deleteMember(sessionId);
		return "회원정보 삭제 완료";
	}

	public String memberLoginType(MemberDTO member) {
		String sessionSnsC = (String)session.getAttribute("user_snsC");	
		System.out.println("sessionSnsC : " + sessionSnsC);
		if(sessionSnsC.equals("카카오계정")){
			return "카카오계정";
		}
		return "회원가입";
	}
	
	
	
	
	
	
	@Autowired private MailService mailService;
	public String sendEmail(String email) {
		if(email == null || email.isEmpty())
			return "이메일을 확인 후 다시 입력하세요.";
		Random r = new Random();
		// 0 ~ 999,999 / 6자리가 아닐경우 오른쪽부터 0 입력
		content = String.format("%06d", r.nextInt(1000000));
		System.out.println("인증번호 : " + content);
		String msg = mailService.sendMail(email, "인증번호가 도착했습니다", content);
		if(msg.equals("입력한 이메일에서 인증번호를 확인하세요.") == false) {
			content = "";
		}
		return msg;
	}
	
	private String content;	
	public String sendAuth(String auth) {
		if(auth == null || auth.isEmpty()) {
			return "인증번호를 입력 후 다시 시도하세요.";
		}
		if(content == null || content.isEmpty()) {
			return "인증번호를 입력 후 다시 시도하세요.";
		}
		if(auth.equals(content)) {
			return "인증 성공";
		}	
		return "인증 실패";
	}

}




