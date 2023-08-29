<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>회원 정보 수정</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<div class="memberUpdate">
	<div class="inner">
		<h2>개인 정보 수정</h2>
		<hr>
		<form action="updateMemberProc" method="post" id="f">
			<div class="memberInfo">
				<ul>
					<li>아이디</li>
					<li><input type="text" style="width:500px; background:#eee;" value="${sessionScope.user_id }" readonly></li>
					<li>(수정불가)</li>
				</ul>
				<ul>
					<li>이메일</li>
					<li><input type="text" style="width:500px; background:#eee;" value="${sessionScope.user_email }" readonly></li>
					<li>(수정불가)</li>
				</ul>
				<ul>
					<li>이름</li>
					<li><input type="text" name="userName" id="name" style="width:500px;" value="${sessionScope.user_name }"></li>
				</ul>
				<ul>
					<li>생년월일</li>
					<li>
						<select id="select_year" onchange="selectDob()">
							<option value="${sessionScope.user_dob.substring(0, 4) }">${sessionScope.user_dob.substring(0, 4) }</option>
							<c:forEach var="i" begin="1930" end="2023">
							<option value="${i}">${i}</option>
							</c:forEach>	
						</select>&nbsp;년&nbsp;&nbsp;&nbsp;
					</li>
					<li>
						<select id="select_month" onchange="selectDob()">
							<option value="${sessionScope.user_dob.substring(4, 6) }">${sessionScope.user_dob.substring(4, 6) }</option>
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
							<option value="${sessionScope.user_dob.substring(6, 8) }">${sessionScope.user_dob.substring(6, 8) }</option>
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
					<li><input type="text" name="userDob" id="doc" style="display:none;" value="${sessionScope.user_dob }"></li>
				</ul>
				<ul>
					<li>연락처</li>
					<li><input type="text" name="userMobile" style="width:500px;" value="${sessionScope.user_mobile }"></li>
				</ul>
				<ul>
					<li>비밀번호(*)</li>
					<li><input type="password" name="userPw" id="pw" style="width:500px;" placeholder="비밀번호를 입력하세요(영문+숫자+특수문자 6~12자리)"></li>
				</ul>
				<ul>
					<li></li>
					<li><input type="password" name="confirm" id="confirm" style="width:500px;" placeholder="비밀번호 확인"  onchange="pwCheck()"></li>
					<li><label id="labelPw"></label></li>  <!-- 일치/불일치 출력 -->
				</ul>
	
			</div>		
		</form>	
		<button class="Btn" onclick="memberInfo_save()">회원 정보 수정</button>
	
	</div>
</div>


<c:import url="/footer"/>