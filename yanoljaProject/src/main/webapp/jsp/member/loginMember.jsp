<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>개인용 로그인</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">

<!-- header -->
<div class="headerLogin">
	<div class="inner">
		<a href="#"><img src="img/default/headerImg/logoYanolja.png" alt="logoYanolja"></a>
	</div>
</div>
<!-- //header -->

<form action="loginMemberProc" method="post" id="f">
	<div class="loginContent inner800">
		<div class="login">
			<p>
				<label for="id">아이디</label> 
				<input type="text" maxlength="12" name="userId" id="id" placeholder="야놀자 아이디 6~12자">
			</p>
			<p>
				<label for="pw">비밀번호</label> 
				<input type="password" maxlength="20" name="userPw" id="pw" placeholder="영문, 특수문자, 숫자혼합 6~12자">
			</p>
		</div>
		<p>
			<input type="checkbox" name="" id="saveId"><label for="saveId">&nbsp;&nbsp;아이디 저장</label>
		</p>
		
		<button onclick="loginCheck()">로그인</button><br>
	</div>
</form>

<form action="kakaoLoginProc" method="post" id="f">
	<div class="loginContent inner800">
		<div class="kakaoLogin">
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
				&client_id=41e6e62701faf2fbb0f972419ce70b87
				&redirect_uri=http://localhost/kakaoLogin">
				<img src="/img/memberImg/kakaoLogo.png" /><span>카카오 로그인</span>
			</a>
		</div>
	
		<div class="find">
			<p>
				야놀자 회원이 아니신가요? <a href="registerMember"><strong>회원가입</strong></a>
			</p>
		</div>
		
	</div>
</form>
<!--  
<form action="kakaoLogin" method="post" id="f">
	<input type="text"  name="kakaoId" id="kakaoId" value="${kakaoId }" />
	<input type="text" name="kakaoNickname" id="kakaoNickname" value="${kakaoNickname }" />
	<input type="text"  name="kakaoEmail" id="kakaoEmail" value="${kakaoEmail }"  />
	<input type="text"  name="kakaoBirthday" id="kakaoBirthday" value="${kakaoBirthday }"  />
</form>
-->
<c:import url="/footer"/>