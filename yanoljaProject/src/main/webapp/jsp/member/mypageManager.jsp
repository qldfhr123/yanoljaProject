<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>사업자용 마이페이지</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>


<div class="mypageManager">
	<h1>My 야놀자 [사업자용]</h1>
	<div class="inner">
		<h2>개인 정보</h2>
		<hr>
		<div class="mypageManager_memberInfo">
			<ul>
				<li>아이디</li>
				<li><input type="text" style="width:500px;" value="아이디" readonly></li>
				<li>(수정불가)</li>
			</ul>
			<ul>
				<li>사업자번호</li>
				<li><input type="text" style="width:500px;" value="사업자번호" readonly></li>
				<li>(수정불가)</li>
			</ul>
			<ul>
				<li>이메일</li>
				<li><input type="text" style="width:500px;" value="이메일" readonly></li>
				<li>(수정불가)</li>
			</ul>
			<ul>
				<li>생년월일</li>
				<li><select id="select_year" onchange="select_year()" placeholder="생년월일"></select>&nbsp;년&nbsp;&nbsp;&nbsp;</li>
				<li><select id="select_month" onchange="select_month()"></select>&nbsp;월&nbsp;&nbsp;&nbsp;</li>
				<li><select id="select_day" onchange="select_day()"></select>&nbsp;일&nbsp;&nbsp;&nbsp;</li>
				<li>나중에 콤보박스 만들 예정</li>
			</ul>
			<ul>
				<li>연락처</li>
				<li><input type="text" style="width:500px;" placeholder="연락처"></li>
			</ul>
			<ul>
				<li>비밀번호(*)</li>
				<li><input type="password" style="width:300px;" placeholder="영문+숫자+특수문자 8~20자리"></li>
				<li><input type="password" style="width:300px;" placeholder="비밀번호 확인"></li>
			</ul>


		</div>
		
		<button type="button" class="Btn" onclick="memberInfo_save()">회원 정보 수정</button>
		<button type="button" class="Btn" onclick="memberInfo_delete()">회원 탈퇴</button>

	</div>

</div>

<c:import url="/footer"/>