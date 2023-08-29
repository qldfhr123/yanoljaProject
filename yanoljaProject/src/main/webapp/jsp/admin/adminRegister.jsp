<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">

<title>사업자용 회원가입</title>

<c:import url="/header"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<form action="adminRegisterProc" method="post" id="f">
<div class="adminRegister">
		<div class="inner">
			<h2>[사업자용] 회원가입</h2>
			<hr>
			<div class="adminRegisterAgree">
				<h2>이용약관 동의</h2>
				<h3><input type="checkbox" id="registerAgreeBtn" name="selectAll" value="selectAll" onclick="adminAgreeSelectAll(this)">
					<label for="registerAgreeBtn">&nbsp;&nbsp;전체 동의 <span>(선택 포함)</span></label></h3>
				<ul class="agreeCheckbox">
					<li>
						<input type="checkbox" id="adminAgreeBtn1" name="agreement"  onclick="checkSelectAll()">
						<label for="adminAgreeBtn1">&nbsp;&nbsp;&nbsp;&nbsp;만 14세 이상 이용, 서비스 이용약관 동의<span>(필수)</span></label>
					</li>
					<li>
						<input type="checkbox" id="adminAgreeBtn2" name="agreement" onclick="checkSelectAll()">
						<label for="adminAgreeBtn2">&nbsp;&nbsp;&nbsp;&nbsp;개인정보 수집 및 이용 동의<span>(필수)</span></label>
					</li>
					<li>
						<input type="checkbox" id="adminAgreeBtn3" name="agreement" onclick="checkSelectAll()">
						<label for="adminAgreeBtn3">&nbsp;&nbsp;&nbsp;&nbsp;숙소 특가, 쿠폰 등 마케팅 수신 동의<span>(선택)</span></label>
					</li>
					<li>
						<input type="checkbox" id="adminAgreeBtn4" name="agreement" onclick="checkSelectAll()">
						<label for="adminAgreeBtn4">&nbsp;&nbsp;&nbsp;&nbsp;위치 정보 이용 약관 동의<span>(선택)</span></label>
					</li>
					<li>
						<input type="checkbox" id="adminAgreeBtn5" name="agreement" onclick="checkSelectAll()">
						<label for="adminAgreeBtn5">&nbsp;&nbsp;&nbsp;&nbsp;장기 미접속 시에도 계정 유지<span>(선택)</span></label>
					</li>
				</ul>	
				<hr>
			</div>	

			<div class="register_content">

				<!-- 사업자용 -->
				<div class="register_business" id="businessState">
					<ul>
						<li>아이디</li>
						<li><input type="text" style="width:400px;" id="adminId" name="adminId" placeholder="아이디를 입력하세요"></li>
						<li><button type="button" class="registerBtn" onclick="dupCheck()">중복 확인</button></li>
						<li><label id="adminIdCheck"></label></li> <!-- 중복확인 시 중복확인 환료 출력 -->
					</ul>
					<ul>
						<li>비밀번호(*)</li>
						<li><input type="password" style="width:400px;" id="adminPw" name="adminPw" maxlength="12"
						placeholder="비밀번호를 입력하세요(영문+숫자+특수문자 6~12자리)" onkeyup="adminPwRegCheck()"></li>
						<li><label id="adminPwReg" name="adminPwReg"></label></li>
					</ul>
					<ul>
						<li></li>
						<li><input type="password" style="width:400px;" placeholder="비밀번호 확인" id="adminPwConfirm" name="adminPwConfirm" maxlength="12"
						onkeyup="adminPwCheck()"></li>
						<li><label id="adminPwCheck" name="adminPwCheck"></label></li>  <!-- 일치/불일치 출력 -->
					</ul>
					<ul>
	                  <li>이름</li>
	                  <li><input type="text" id="adminName" name="adminName" style="width:400px;" placeholder="이름을 입력하세요"></li>
	               </ul>
	               <ul>
	                  <li>연락처</li>
	                  <li><input type="text" id="adminMobile" name="adminMobile" style="width:400px;" placeholder="연락처를 입력하세요"></li>
	               </ul>
	               <ul>
	                  <li>사업지 주소</li>
	                  <li><input type="text" id="postcode" name="postcode" placeholder="우편번호"></li>
					  <li><input type="button" class="postcodeBtn" onclick="adminExecDaumPostcode()" value="우편번호 찾기"></li>
					</ul>
	               <ul>
	               	 <li></li>
					<li>
						  <input type="text" id="adminAddress" name="adminAddress"  placeholder="주소">
		                  <input type="text" id="adminDetailAddress" name="adminDetailAddress"  placeholder="상세주소">
					</li>
	               </ul>
	               <ul>
	                  <li>사업 지역</li>
	                  <li>
							<select id="region" name="region">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="제주">제주</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="광주">광주</option>
							</select>
					  </li>
	               </ul>
					<ul>
						<li>사업자번호</li>
						<li><input type="text" style="width:400px;" placeholder="사업자번호를 입력하세요( - 없이 10자리 숫자)" id="businessNumber"
						name="businessNumber" onkeyup="businessNumberCheck()" maxlength="10"></li>
						<li><label id="businessNumberCheck" name="businessNumberCheck"></label></li>
					</ul>
				</div>

			</div>

			<button type="button" class="Btn" onclick="adminAllCheck()">회원 가입</button>

		</div>

	</div>
</form>
<c:import url="/footer"/>