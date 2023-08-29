<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>

<link rel="stylesheet" href="/css/reset.css" type="text/css">

<title>사업자용 예약관리</title>

<c:import url="/header" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>


	<div class="reservationManager" onload="reservationCheck()">
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


			<div class="reservationManager_content">
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
											<td><input type="radio" name="reservatinRadio"
												onclick="reservationCheck()" value="${rental.hostName }">
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



				<h2>예약 현황 확인</h2>
				<hr>
				<!-- 예약 현황 테이블 -->
				<div id="reservationBody">
					<div class="reservation_stateTable">
						<h3 id="selecetdPlace"></h3>
						<table border=1 class="manager_table" id="manager_table">
							<thead id="reservationThead" name="reservationTable">
								<tr>
									<th >No.</th>
									<th >객실명</th>
									<th >인원</th>
									<th >예약자명</th>
									<th >연락처</th>
									<th >예약번호</th>
									<th >체크인</th>
									<th >체크인</th>
									<th >체크아웃</th>
									<th >체크아웃</th>
									<th >객실현황</th>
								</tr>
							</thead>
							<tbody id="reservationTbody" name="reservationTable" align="center">

								<!-- for문 사용 -->
	
							</tbody>
						</table>
					</div>

				</div>



			</div>



		</div>
	</div>






<c:import url="/footer" />