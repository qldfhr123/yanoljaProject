<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>

<link rel="stylesheet" href="/css/reset.css" type="text/css">

<title>사업자용 회원수정</title>

<c:import url="/header" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<form action="adminUpdateProc" method="post" id="f">
	<div class="adminRegister">
		<div class="inner">
			<h2>[사업자용] 개인정보 수정</h2>
			<hr>
			<!-- 사업자용 -->
			<div class="register_business" id="businessState">
				<ul>
					<li>아이디</li>
					<li><input type="text" style="width: 500px; background:#eee;" id="adminId" name="adminId" value=${adminId } readonly="readonly"></li>
					<li>(수정불가)</li>
					<!-- 중복확인 시 중복확인 환료 출력 -->
				</ul>				
				<ul>
					<li>이름</li>
					<li><input type="text" id="adminName" name="adminName" style="width: 500px;" value=${adminName }></li>
				</ul>
				<ul>
					<li>연락처</li>
					<li><input type="text" id="adminMobile" name="adminMobile" style="width: 500px;" value=${adminMobile }></li>
				</ul>
				<ul>
					<li>사업지 주소</li>
					<li><input type="text" id="postcode" name="postcode" value=${adminLocation.substring(0,6) }></li>
					<li><input type="button" class="postcodeBtn" onclick="adminExecDaumPostcode()" value="우편번호 찾기"></li>
				</ul>
				<ul>
					<li></li>
					<li>
						<input type="text" id="adminAddress" name="adminAddress" value="${adminLocation.substring(9) }"> 
						<input type="text" id="adminDetailAddress" name="adminDetailAddress" value="${fn:split(adminLocation,',')[1] }">
					</li>
				</ul>
				<ul>
					<li>사업 지역</li>
					<li>
						<select id="region" name="region" style="text-align:center;">
	                        <c:set var="regionOption" value="서울,경기,인천,강원,제주,부산,대구,광주" />
	                        <c:forEach var="regionName" items="${regionOption }">
	                           <c:if test="regionName == region">
	                              <option value="${region }" selected="selected">${region }</option>
	                           </c:if>
	                              <option value="${regionName }">${regionName }</option>
	                        </c:forEach>
                     	</select>
					</li>
				</ul>
				<ul>
					<li>사업자번호</li>
					<li><input type="text" style="width: 500px;"
						placeholder="사업자번호를 입력하세요( - 없이 10자리 숫자)" id="businessNumber" name="businessNumber" value=${businessNumber } onkeyup="businessNumberCheck()" maxlength="10"></li>
					<li><label id="businessNumberCheck" name="businessNumberCheck">* 사용가능한 사업자번호입니다.</label></li>
				</ul>				
				<ul>
					<li>수정할 비밀번호</li>
					<li><input type="password" style="width: 500px;" id="adminPw"	name="adminPw" maxlength="12" placeholder="비밀번호를 입력하세요(영문+숫자+특수문자 6~12자리)" onkeyup="adminPwRegCheck()"></li>
					<li><label id="adminPwReg" name="adminPwReg"></label></li>
				</ul>
				<ul>
					<li></li>
					<li><input type="password" style="width: 500px;"
						placeholder="비밀번호 확인" id="adminPwConfirm" name="adminPwConfirm" maxlength="12" onkeyup="adminPwCheck()"></li>
					<li><label id="adminPwCheck" name="adminPwCheck"></label></li>
					<!-- 일치/불일치 출력 -->
				</ul>
				<ul>
					<li>현재 비밀번호(*)</li>
					<li><input type="password" style="width: 500px;" id="adminPwCurrent"	name="adminPwCurrent" maxlength="12" placeholder="현재 비밀번호를 입력하세요" onkeyup="adminPwRegCheck()"></li>
					<li><label id="adminPwReg" name="adminPwReg"></label></li>
				</ul>
			</div>

			<button type="button" class="Btn" onclick="adminUpdateAllCheck()">회원 정보 수정</button>
			<button type="button" class="Btn" onclick="location.href='reservationManager'">취소</button>

		</div>

	</div>
</form>
<c:import url="/footer" />