<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>개인용 마이페이지</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>

<body onload="memReserve(); ReserveAndReview();">

<div class="mypageMember">
	<h1>My 야놀자 [개인용]</h1>
	<div class="inner">

		<h2 onclick="openInformation()">회원 정보 <span id="toggle">-</span></h2>
		<hr>
		<div class="userInfoBox" id="userInfoBox">
			<form action="updateMemberProc" method="post" id="f">
				<div class="memberInfo">
					<ul>
						<li>아이디</li>
						<li><input type="text" style="width:500px; background:#eee;" value="${sessionScope.user_id }" readonly></li>
					</ul>
					<ul>
						<li>이메일</li>
						<li><input type="text" style="width:500px; background:#eee;" value="${sessionScope.user_email }"  readonly></li>
					</ul>
					<ul>
						<li>이름</li>
						<li><input type="text" name="userName" id="name" style="width:500px; background:#eee;" value="${sessionScope.user_name }"  readonly></li>
					</ul>
					<ul>
						<li>생년월일</li>
						<li>
							<select id="select_year" style="background:#eee;" onchange="selectDob()" disabled>
								<option value="${sessionScope.user_dob.substring(0, 4) }">${sessionScope.user_dob.substring(0, 4) }</option>
								<c:forEach var="i" begin="1930" end="2023">
								<option value="${i}">${i}</option>
								</c:forEach>	
							</select>&nbsp;년&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							<select id="select_month" style="background:#eee;" onchange="selectDob()" disabled>
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
							<select id="select_day" style="background:#eee;" onchange="selectDob()" disabled>
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
						<li><input type="text" name="userDob" id="doc" style="display:none;"></li>
					</ul>
					<ul>
						<li>연락처</li>
						<li><input type="text" name="userMobile" style="width:500px; background:#eee;" value="${sessionScope.user_mobile }"></li>
					</ul>
				</div>		
			</form>	
			<button class="Btn" onclick="location.href='logoutMember'">로그아웃</button>
			<button class="Btn" onclick="location.href='memberUpdate'">회원 정보 수정</button>
			<button class="Btn" onclick="location.href='memberDelete'">회원 탈퇴</button>
		</div>

		<div class="myReservation">
			<h2>예약 내역</h2>
			<hr>
			<div class="sortReservation">
				<ul>
					<li><p class="recent3MonthSort" id="recent3MonthSort" onclick="recent3MonthSort()">ㆍ최근 3개월</p></li>
					<li><p class="recent6MonthSort" id="recent6MonthSort" onclick="recent6MonthSort()">ㆍ최근 6개월</p></li>
					<li><p class="recent1YearSort" id="recent1YearSort" onclick="recent1YearSort()">ㆍ최근 1년</p></li>
				</ul>
			</div>
			<div class="reservationList">
				<h3 id="reserveNone"></h3>
				<ul id="reservationList" name="reservationList">
					<!-- js로 불러오는 중 -->
	 			</ul>

			</div>
			
		</div>	
		
		
		
		
		
		<div class="myReview">
			<div class="myReview_part" id="myReview_part">
				<!-- js로 불러오는 중 -->
			</div>
			<hr>
			<div class="reviewList">
				<h3 id="reviewNone"></h3>
				<ul id="reviewList" name="reviewList">
					<!-- js로 불러오는 중 -->
	 			</ul>

			</div>
	
		</div>
		

	</div>

</div>

<c:import url="/footer"/>