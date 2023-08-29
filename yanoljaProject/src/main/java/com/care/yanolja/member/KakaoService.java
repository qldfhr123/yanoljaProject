package com.care.yanolja.member;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoService {
	private String accessToken;
	private String scope;
	
	public void getAccessToken(String code) {
		/*
		 * # 액세스 토큰 가져오기 #
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-token
		 * -sample
		 */
		String redirectUri = "http://localhost/kakaoLogin";
		String reqUrl = "https://kauth.kakao.com/oauth/token";
		String reqParam = "grant_type=authorization_code";
		reqParam += "&client_id=41e6e62701faf2fbb0f972419ce70b87";
		reqParam += "&redirect_uri="+redirectUri;
		reqParam += "&code=" + code;

		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST"); // POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
			conn.setDoOutput(true); // POST 메소드를 이용해서 데이터를 전달하기 위한 설정

			// 기본 outputStream을 통해 문자열로 처리할 수 있는 OutPutStreamWriter 변환 후 처리속도를 빠르게 하기위한
			// BufferedWriter로 변환해서 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(reqParam);
			bw.flush();

//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
//			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			ObjectMapper om = new ObjectMapper();
			Map<String, String> map = null;
			map = om.readValue(isr, new TypeReference<Map<String, String>>() {
			});
			accessToken = map.get("access_token");
			scope = map.get("scope");
			
			//setNeedsAgreement();
//			System.out.println("access_token : " + map.get("access_token"));
//			System.out.println("scope : " + map.get("scope"));

			/*
			 * response body : {
			 * "access_token":"W-_xD-t7fIv78Lzz06tCZyrlGDlYcR3kVWmxo_t0Cj11nAAAAYlm52VZ",
			 * "token_type":"bearer",
			 * "refresh_token":"3Llflzbp_vCUMMFss78twrO3G05MmHikDxZ6c8GbCj11nAAAAYlm52VY",
			 * "expires_in":21599,
			 * "scope":"age_range account_email profile_image gender profile_nickname",
			 * "refresh_token_expires_in":5183999 }
			 */

		} catch (IOException e) {
			e.printStackTrace();
		}
//		return accessToken;
	}
	
	public void setNeedsAgreement() {
	/*
	 * # 추가 항목 동의 받기 #
	 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-code-additional-consent
	 */
	//https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code&scope=account_email,gender	
	
		String redirectUri = "http://localhost/kakaoLogin";
		String reqUrl = "https://kauth.kakao.com/oauth/authorize";
		String reqParam = "?client_id=41e6e62701faf2fbb0f972419ce70b87";
		reqParam += "&redirect_uri="+redirectUri;
		reqParam += "&response_type=code&scope="+scope;
		
		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(reqParam);
			bw.flush();

//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
//			System.out.println("responseCode : " + responseCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MemberDTO getUserInfo() {
		/*
		 * 사용자 정보 가져오기
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#req-user-info
		 */
		//HashMap<String, Object> userInfo = new HashMap<String, Object>();  // DB 저장시 사용
		
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization: Bearer ${ACCESS_TOKEN}

//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
//			System.out.println("responseCode : " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonTree = om.readTree(conn.getInputStream());
			JsonNode kakaoAccount = jsonTree.get("kakao_account");

			System.out.println("id(getUserInfo) : " + jsonTree.get("id"));
			System.out.println("nickname(getUserInfo) : " + kakaoAccount.get("profile").get("nickname").textValue());
			System.out.println("email(getUserInfo) : " + kakaoAccount.get("email").textValue());

            String kakaoId = jsonTree.get("id").asText();
            String kakaoNickname = kakaoAccount.get("profile").get("nickname").textValue();
            String kakaoEmail = kakaoAccount.get("email").textValue();
            String kakaoSnsC = "카카오계정";

            MemberDTO member = new MemberDTO();
	        member.setUserId(kakaoId);
            member.setUserName(kakaoNickname);
            member.setUserEmail(kakaoEmail);
            member.setUserSnsC(kakaoSnsC);	
            return member;

		} catch (IOException e) {
			e.printStackTrace();			
		}
		return null;
	}

	
	public void unLink() {
		/*
		 * # 연결 끊기 #
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#unlink
		 */
		String reqUrl = "https://kapi.kakao.com/v1/user/unlink";
		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); 
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization: Bearer ${ACCESS_TOKEN}

//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());
			System.out.println("id : " + jsonNode.get("id"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void get() {
		/*
		 * 사용자 정보 가져오기
		 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#req-user-info
		 */

		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		HttpURLConnection conn;
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization: Bearer ${ACCESS_TOKEN}

//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공

//			ObjectMapper om = new ObjectMapper();
//			JsonNode jsonTree = om.readTree(conn.getInputStream());
//			JsonNode kakaoAccount = jsonTree.get("kakao_account");

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}













