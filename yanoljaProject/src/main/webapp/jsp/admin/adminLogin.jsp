<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">


<title>사업자용 로그인</title>
<!-- header -->
<div class="headerLogin">
	<div class="inner">
		<a href="index"><img src="img/default/headerImg/logoYanolja.png"
			alt="logoYanolja"></a>
	</div>
</div>
<!-- header -->

<form action="adminLoginProc" method="post" id="f">
	<div class="loginContent inner800">
		<div class="login">
			<p>
				<label for="adminId">아이디</label> 
				<input type="text" maxlength="12" name="adminId" id="adminId" placeholder="야놀자 사업자용 아이디 6~12자">
			</p>
			<p>
				<label for="adminPassword">비밀번호</label> 
				<input type="password"	maxlength="12" name="adminPw" id="adminPw" placeholder="영문, 특수문자, 숫자혼합 6~12자">
			</p>
		</div>
		<p>
			<input type="checkbox" name="idSave" id="idSave">&nbsp;&nbsp;<label for="idSave">아이디 저장</label>
		</p>
		
		<button onclick="loginCheck()">로그인</button>
		
		<div class="find">
			<p>
				야놀자 회원이 아니신가요? <a href="adminRegister">회원가입</a>
			</p>
		</div>
	</div>
</form>
<c:import url="/footer" />
