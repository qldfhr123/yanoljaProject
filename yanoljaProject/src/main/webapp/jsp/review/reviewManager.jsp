<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>

<link rel="stylesheet" href="/css/reset.css" type="text/css">

<title>사업자용 리뷰관리</title>

<c:import url="/header" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>
<div class="reviewManager">
	<h1>My 야놀자 [사업자용]</h1>
	<div class="sideMenuBar_inner">

		<div class="manager_menu">
			<ul>
				<li>숙소 관리</li>
				<li><a href="existedHouseManager">기존 숙소 관리</a></li>
				<li><a href="newHouseManager">신규 숙소 등록</a></li>
				<li><a href="reservationManager">예약 현황</a></li>
				<li><a href="reviewManager">후기 관리</a></li>
			</ul>
		</div>

		<div class="reviewManager_content">
			<h2 onclick="openInformationBusiness()">회원 정보 <span id="toggle">-</span></h2>
				<hr>
				<div class="information_business" id="informationBusiness">
					<ul>
						<li>아이디</li>
						<li><input type="text" style="width:500px; background:#eee;" id="adminId" name="adminId" value=${adminId } readonly="readonly"></li>						
					</ul>
					<ul>
	                  <li>이름</li>
	                  <li><input type="text" id="adminName" name="adminName" style="width:500px; background:#eee;"value=${adminName }></li>
	               </ul>
	               <ul>
	                  <li>연락처</li>
	                  <li><input type="text" id="adminMobile" name="adminMobile" style="width:500px; background:#eee;" value=${adminMobile } ></li>
	               </ul>
	               <ul>
	                  <li>사업지 주소</li>
	                  <li><input type="text" id="postcode" name="postcode" style="background:#eee; width:90px;" value=${adminLocation.substring(0,6) }></li>
					</ul>
	               <ul>
	               	 <li></li>
					<li>
						  <input type="text" id="adminAddress" name="adminAddress" style="background:#eee;" value="${adminLocation.substring(9) }">
		                  <input type="text" id="adminDetailAddress" name="adminDetailAddress" style="background:#eee;" value="${fn:split(adminLocation,',')[1] }">
					</li>
	               </ul>
	               <ul>
	                  <li>사업 지역</li>
	                  <li>
	                  		<input type="text" id="region" name="region" style="background:#eee; width:80px;" value="${region }">
														
					  </li>
	               </ul>
					<ul>
						<li>사업자번호</li>
						<li><input type="text" style="width:500px;background:#eee;" value=${businessNumber } id="businessNumber"
						name="businessNumber" onkeyup="businessNumberCheck()" maxlength="10"></li>
						<li><label id="businessNumberCheck" name="businessNumberCheck"></label></li>
					</ul>
					<button class="Btn" onclick="location.href='adminLogout'">로그아웃</button>
         			<button class="Btn" onclick="location.href='adminUpdate'">회원 정보 수정</button>
        			<button class="Btn" onclick="location.href='adminDelete'">회원 탈퇴</button>
				</div>
				
				
				<h2>숙소 목록</h2>
				<hr>
				<!-- 숙소 목록 테이블 -->
				<c:choose>
					<c:when test="${empty rentals}">
						<h3 id="reservationPlace">등록된 숙소가 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="manager_reservationTable"
							id="manager_reservationTable" align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="5%"></th>
										<th width="10%">종류</th>
										<th width="35%">업체명</th>
										<th width="50%">주소</th>
									</tr>
								</thead>
								<tbody align="center">
									<!-- for문 사용 -->
									<c:forEach var="rental" items="${rentals}" varStatus="status">
										<tr>
											<td><input type="radio" name="reviewRadio"
												onclick="reviewCheck()" value="${rental.hostName }">
											</td>
											<td>${rental.lodType }</td>
											<td>${rental.hostName }</td>
											<td>${rental.adminLocation }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:otherwise>
				</c:choose>


			<h2 id="reviewTitle">객실 후기</h2>
			
			<div class="roomReview">
				<div class="sortReview">
					<ul>
						<li><p class="recentSort" id="recentSort" onclick="reviewCheck()">ㆍ최근 작성순</p></li>
						<li><p class="starsSort" id="starsSort" onclick="reviewCheckStars()">ㆍ별점 높은순</p></li>
					</ul>
				</div>
				<hr>
				<div class="ReviewList">
				
						<h3 id="selecetedRental"></h3>
						<ul id="ReviewList" name="ReviewList">
			
	
						</ul>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/footer" />