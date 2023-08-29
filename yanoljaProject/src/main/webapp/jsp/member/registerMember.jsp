<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>회원가입</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<div class="register">
	<div class="inner">
		<h2>회원가입</h2>
		<hr>
		<div class="register_agree">
			<h2>이용약관 동의</h2>
			<h3>
				<input type="checkbox" name="agreeAllBtn" id="registerAgreeBtn" onclick="registerAllAgree(this)">
				<label for="registerAgreeBtn" class="agreeBtn">&nbsp;&nbsp;전체 동의 <span>(선택 포함)</span></label>
			</h3>
			<ul class="agreeCheckbox">
				<li>
					<input type="checkbox" name="agreeBtn" id="agreeBtn1" onclick="individualAgree()">
					<label for="agreeBtn1">&nbsp;&nbsp;&nbsp;&nbsp;만 14세 이상 이용, 서비스 이용약관 동의<span>(필수)</span></label>
				</li>
				<li>
					<input type="checkbox" name="agreeBtn" id="agreeBtn2" onclick="individualAgree()">
					<label for="agreeBtn2">&nbsp;&nbsp;&nbsp;&nbsp;개인정보 수집 및 이용 동의<span>(필수)</span></label>
				</li>
				<li>
					<input type="checkbox" name="agreeBtn" id="agreeBtn3" onclick="individualAgree()">
					<label for="agreeBtn3">&nbsp;&nbsp;&nbsp;&nbsp;숙소 특가, 쿠폰 등 마케팅 수신 동의<span>(선택)</span></label>
				</li>
				<li>
					<input type="checkbox" name="agreeBtn" id="agreeBtn4" onclick="individualAgree()">
					<label for="agreeBtn4">&nbsp;&nbsp;&nbsp;&nbsp;위치 정보 이용 약관 동의<span>(선택)</span></label>
				</li>
				<li>
					<input type="checkbox" name="agreeBtn" id="agreeBtn5" onclick="individualAgree()">
					<label for="agreeBtn5">&nbsp;&nbsp;&nbsp;&nbsp;장기 미접속 시에도 계정 유지<span>(선택)</span></label>
				</li>
			</ul>
			<hr>
		</div>

		<div class="register_content">

			<!-- 개인용 -->
			<div class="register_individual">
				<form action="registerMemberProc" method="post" id="f">
					<ul>
						<li>아이디</li>
						<li><input type="text" name="userId" id="id" style="width:500px;" placeholder="아이디를 입력하세요"></li>
						<li><input type="button" class="registerBtn" value="중복 확인" onclick="memberdupCheck()"></li>
						<li><label id="userIdCheck"></label></li>
					</ul>
					<ul>
						<li>비밀번호(*)</li>
						<li><input type="password" name="userPw" id="pw" style="width:500px;" placeholder="비밀번호를 입력하세요(영문+숫자+특수문자 6~12자리)"></li>
					</ul>
					<ul>
						<li></li>
						<li><input type="password" name="confirm" id="confirm" style="width:500px;" placeholder="비밀번호 확인"  onkeyup="pwCheck()"></li>
						<li><label id="labelPw"></label></li>  <!-- 일치/불일치 출력 -->
					</ul>
					<ul >
						<li>이메일</li>
						<li><input type="text" name="userEmail" id="email" style="width:500px;" value="" placeholder="이메일을 입력하세요"></li>
						<li><input type="button" class="registerBtn" id="emailBtn" onclick="sendEmail()" value="인증번호 전송"></li>
						<li><label id="labelEmail"></label></li>
					</ul>
					<ul id="authUl">
						<li></li>
						<li><input type="text" id="auth" style="width:500px;" placeholder="인증번호 입력"></li>
						<li><input type="button" class="registerBtn" id="authBtn" onclick="sendAuth()" value="인증번호 확인"></li>
					</ul>
					<ul>
						<li>이름</li>
						<li><input type="text" name="userName" id="name" style="width:500px;" placeholder="이름을 입력하세요"></li>
					</ul>
					<ul>
						<li>생년월일</li>
						<li>
							<select id="select_year" onchange="selectDob()">
								<option value="">-선택-</option>
								<c:forEach var="i" begin="1930" end="2023">
								<option value="${i}">${i}</option>
								</c:forEach>	
							</select>&nbsp;년&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							<select id="select_month" onchange="selectDob()">
								<option value="">-선택-</option>
								<c:forEach var="i" begin="1" end="12">
								<c:choose>
								   <c:when test="${i lt 10 }">
								       <option value="0${i}">0${i}</option>
								   </c:when>
								   <c:otherwise>
								       <option value="${i}">${i}</option>
								   </c:otherwise>
								</c:choose>
								</c:forEach>
							</select>&nbsp;월&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							<select id="select_day" onchange="selectDob()">
								<option value="">-선택-</option>
								<c:forEach var="i" begin="1" end="31">
								<c:choose>
								   <c:when test="${i lt 10 }">
								       <option value="0${i}">0${i}</option>
								   </c:when>
								   <c:otherwise>
								       <option value="${i}">${i}</option>
								   </c:otherwise>
								</c:choose>
								</c:forEach>
							</select>&nbsp;일&nbsp;&nbsp;&nbsp;
						</li>
						<li><input type="text" name="userDob" id="doc" style="display:none;"></li>
					</ul>
					<ul>
						<li>연락처</li>
						<li><input type="text" name="userMobile" id="mobile" style="width:500px;" placeholder="연락처를 입력하세요(010-1234-1234)"></li>
					</ul>
				</form>	
			</div>
			
		</div>

		<button class="Btn" onclick="allCheck()">회원 가입</button>

	</div>

</div>

<c:import url="/footer"/>

