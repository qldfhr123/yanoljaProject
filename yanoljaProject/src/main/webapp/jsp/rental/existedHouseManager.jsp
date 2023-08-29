<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>[사업자용]기존숙소관리</title>
  <link rel="stylesheet" href="css/reset.css" type="text/css">
 </head>
<script src="yanoljaFunction.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>
  <script>
	function checkBtn_show() {
		var roomType1 = document.getElementById("roomType1");
        var roomType2 = document.getElementById("roomType2");
		var roomTypeState1 = document.getElementById("roomTypeState1");
		var roomTypeState2 = document.getElementById("roomTypeState2");

		if (roomType1.checked) { // 대실
			roomTypeState1.style.display = "block";
		} else {
			roomTypeState1.style.display = "none";
		}

		if (roomType2.checked) {  // 숙박
			roomTypeState2.style.display = "block";
		} else {
			roomTypeState2.style.display = "none";
		}
	}

	function roomregisterBtn_show(){
		var room_registerState = document.getElementById("room_registerState");	

		if (room_registerState.style.display === 'none') { // 객실등록
			room_registerState.style.display = 'block';
		} else {
			room_registerState.style.display = 'none';
		}
	}
</script>

<c:import url="/header"></c:import>
 <body>

	<!-- *************************************************************************************** -->

	<div class="existedHouseManager">
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
			
			

			<!-- newHouseManager.jsp 적용 -->
			<div class="newHouseManager_content">
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
				<div class="existedHouseManager_content">
					<div class="manager_houseTable">
						<table border=1 class="manager_table">
							<thead>
								<tr>
									<th width="50">No.</th>
									<th width="120">종류</th>
									<th width="300">업체명</th>
									<th width="430">주소</th>
								</tr>
							</thead>
							
							<tbody>
								<!-- for문 사용 -->
								<c:forEach var="item" items="${UpdateMain}">
								<tr>
									<td onclick="UpdateHostInfo()">${item.Num }</td>
									<td>${item.lod_type }</td>
									<td>${item.host_name }</td>
									<td>${item.address }</td>
									
									<td style="display:none">${item.room_name }</td>
									<td style="display:none">${item.roo_img }</td>
									<td style="display:none">${item.service	 }</td>
									<td style="display:none">${item.roo_img }</td>
									<td style="display:none">${item.Representative_photo }</td>
								</tr>
							
								</c:forEach>
							</tbody>
							
						</table>
					</div>
					
				</div>




				<h2>숙소 상세정보 관리</h2>
				<hr>
				<div class="newHouse_register">
					<ul> <!-- 1 -->
						<li>숙소 종류</li>
						<li>
							<select>
								<option value="선택">-선택-</option>
								<option value="1">모텔</option>
								<option value="2">호텔/리조트</option>
								<option value="3">펜션/풀빌라</option>
								<option value="4">캠핑/글램핑</option>
							</select>
						</li>
					</ul>
					<ul> <!-- 2 -->
						<li>숙소명</li>
						<li><input type="text" style="width:500px;" placeholder="숙소명을 입력하세요"></li>
					</ul> 
					<ul> <!-- 3 -->
						<li>주소</li>
						<li><input type="text" style="width:200px;" id="postcode" name="postcode" placeholder="우편번호"></li>
						<li><button type="button" class="addressBtn" onclick="execDaumPostcode()">우편번호 찾기</button></li>
					</ul>
					<ul> <!-- 4 -->
						<li></li>
						<li><input type="text" style="width:500px;" id="address" name="address" placeholder="주소를 입력하세요"></li>
					</ul>
					<ul> <!-- 5 -->
						<li></li>
						<li><input type="text" style="width:500px;" placeholder="상세주소를 입력하세요"></li>
					</ul>

					<hr>
					<ul> <!-- 6 -->
						<li>안내/정책</li>
						<li><textarea class="roomInfo" placeholder="안내/정책을 입력하세요."></textarea></li>
					</ul>
					<hr>
					<ul> <!-- 7 -->
						<li>인기시설/서비스</li>
						<li class="circleCheck">
							<input type="checkbox" id="roomService1" value="주차가능"><label for="roomService1">&nbsp;&nbsp;주차가능</label>
							<input type="checkbox" id="roomService2" value="파티룸"><label for="roomService2">&nbsp;&nbsp;파티룸</label>
							<input type="checkbox" id="roomService3" value="와이파이"><label for="roomService3">&nbsp;&nbsp;와이파이</label>
							<input type="checkbox" id="roomService4" value="어메니티"><label for="roomService4">&nbsp;&nbsp;어메니티</label>
							<input type="checkbox" id="roomService5" value="트윈베드"><label for="roomService5">&nbsp;&nbsp;트윈베드</label>
						</li>
					</ul>
					<ul> <!-- 8 -->
						<li></li>
						<li class="circleCheck">
							<input type="checkbox" id="roomService6" value="커피숍"><label for="roomService6">&nbsp;&nbsp;커피숍</label>
							<input type="checkbox" id="roomService7" value="객실금연"><label for="roomService7">&nbsp;&nbsp;객실금연</label>
							<input type="checkbox" id="roomService8" value="수화물보관"><label for="roomService8">&nbsp;&nbsp;수화물보관</label>
							<input type="checkbox" id="roomService9" value="비즈니스"><label for="roomService9">&nbsp;&nbsp;비즈니스</label>
						</li>
					</ul>
					<ul> <!-- 9 -->
						<li></li>
						<li class="circleCheck">
							<input type="checkbox" id="roomService10" value="24시간 데스크"><label for="roomService10">&nbsp;&nbsp;24시간 데스크</label>
							<input type="checkbox" id="roomService11" value="부티크브랜드"><label for="roomService11">&nbsp;&nbsp;부티크브랜드</label>
						</li>
					</ul>

					<hr>
					
					<ul> <!-- 10 table -->
						<li>숙소 사진 등록</li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="200">파일명</th>
										<th width="320">URL</th>
										<th width="100">SIZE</th>
									</tr>
								</thead>
								<tbody>
									<!-- for문 사용 -->
									<tr>
										<td>
											<input type="checkbox" id="housePhoto1" name="fileNum" value="1">
											<label for="housePhoto1"></label>
										</td>
										<td>파일이름</td>
										<td>경로경로 url url</td>
										<td>100MB</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="housePhoto2" name="fileNum" value="1">
											<label for="housePhoto2"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="housePhoto3" name="fileNum" value="1">
											<label for="housePhoto3"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 11 -->
						<li></li>
						<li><button type="button" class="fileBtn" onclick="fileChoose()">파일 추가</button></li>
						<li><button type="button" class="fileBtn" onclick="fileDelete()">파일 삭제</button></li>
					</ul>

					<hr>
					<ul> <!-- 12 table -->
						<li>객실 등록</li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="150">객실명</th>
										<th width="100">객실 수</th>
										<th width="185">판매가(대실)</th>
										<th width="185">판매가(숙박)</th>
									</tr>
								</thead>
								<tbody>
									<!-- for문 사용 -->
									<tr>
										<td>
											<input type="checkbox" id="roomPhoto1" name="fileNum" value="1">
											<label for="roomPhoto1"></label>
										</td>
										<td>파일이름</td>
										<td>111</td>
										<td>1000000</td>
										<td>1000000</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="roomPhoto2" name="fileNum" value="1">
											<label for="roomPhoto2"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="roomPhoto3" name="fileNum" value="1">
											<label for="roomPhoto3"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 13 -->
						<li></li>
						<li><button type="button" class="fileBtn" onclick="roomregisterBtn_show()">객실 추가</button></li>
						<li><button type="button" class="fileBtn" onclick="fileDelete()">객실 수정</button></li>
						<li><button type="button" class="fileBtn" onclick="fileDelete()">객실 삭제</button></li>
					</ul>
				</div>

				<!-- 객실등록 -->
				<div class="room_register" id="room_registerState" style="display:none;">
					<ul> <!-- 1 -->
						<li>숙소명</li>
						<li><input type="text" style="width:500px;" value="숙소명" readonly></li>
					</ul>
					<ul> <!-- 2 -->
						<li>객실명</li>
						<li><input type="text" style="width:500px;" placeholder="객실명을 입력하세요"></li>
					</ul> 
					<ul> <!-- 3 -->
						<li>인원</li>
						<li>기준 인원</li>
						<li><input type="text" style="width:110px;" placeholder="기준인원">&nbsp;명</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>최대 인원</li>
						<li><input type="text" style="width:110px;" placeholder="최대인원">&nbsp;명</li>
					</ul>
					<ul> <!-- 4 -->
						<li>판매 종류</li>
						<li class="circleCheck">
							<input type="checkbox" id="roomType1" value="대실" onclick="checkBtn_show()"><label for="roomType1">&nbsp;&nbsp;대실</label>
							<input type="checkbox" id="roomType2" value="숙박" onclick="checkBtn_show()"><label for="roomType2">&nbsp;&nbsp;숙박</label>
						</li>
					</ul>
					<ul id="roomTypeState1" style="display:none;"> <!-- 5 -->
						<li>대실</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>이용시간</li>
						<li>
							<select>
								<option value="선택">-선택-</option>
								<option value="1">01 시간</option><option value="2">02 시간</option><option value="3">03 시간</option>
								<option value="4">04 시간</option><option value="5">05 시간</option><option value="6">06 시간</option>
								<option value="7">07 시간</option><option value="8">08 시간</option><option value="9">09 시간</option>
								<option value="10">10 시간</option><option value="11">11 시간</option><option value="12">12 시간</option>
								<option value="13">13 시간</option><option value="14">14 시간</option><option value="15">15 시간</option>
								<option value="16">16 시간</option><option value="17">17 시간</option><option value="18">18 시간</option>
								<option value="19">19 시간</option><option value="20">20 시간</option><option value="21">21 시간</option>
								<option value="22">22 시간</option><option value="23">23 시간</option><option value="24">24 시간</option>
							</select>
						</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>운영시간</li>
						<li>
							<select>
								<option value="선택">-선택-</option>
								<option value="1">01 시</option><option value="2">02 시</option><option value="3">03 시</option>
								<option value="4">04 시</option><option value="5">05 시</option><option value="6">06 시</option>
								<option value="7">07 시</option><option value="8">08 시</option><option value="9">09 시</option>
								<option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option>
								<option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option>
								<option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option>
								<option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option>
								<option value="22">22 시</option><option value="23">23 시</option><option value="24">24 시</option>
							</select>
							~
							<select>
								<option value="선택">-선택-</option>
								<option value="1">01 시</option><option value="2">02 시</option><option value="3">03 시</option>
								<option value="4">04 시</option><option value="5">05 시</option><option value="6">06 시</option>
								<option value="7">07 시</option><option value="8">08 시</option><option value="9">09 시</option>
								<option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option>
								<option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option>
								<option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option>
								<option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option>
								<option value="22">22 시</option><option value="23">23 시</option><option value="24">24 시</option>
							</select>
						</li>
					</ul>
					<ul id="roomTypeState2" style="display:none;"> <!-- 6 -->
						<li>숙박</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>입실시간</li>
						<li>
							<select>
								<option value="선택">-선택-</option>
								<option value="1">01 시</option><option value="2">02 시</option><option value="3">03 시</option>
								<option value="4">04 시</option><option value="5">05 시</option><option value="6">06 시</option>
								<option value="7">07 시</option><option value="8">08 시</option><option value="9">09 시</option>
								<option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option>
								<option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option>
								<option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option>
								<option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option>
								<option value="22">22 시</option><option value="23">23 시</option><option value="24">24 시</option>
							</select>
						</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>퇴실시간</li>
						<li>
							<select>
								<option value="선택">-선택-</option>
								<option value="1">01 시</option><option value="2">02 시</option><option value="3">03 시</option>
								<option value="4">04 시</option><option value="5">05 시</option><option value="6">06 시</option>
								<option value="7">07 시</option><option value="8">08 시</option><option value="9">09 시</option>
								<option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option>
								<option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option>
								<option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option>
								<option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option>
								<option value="22">22 시</option><option value="23">23 시</option><option value="24">24 시</option>
							</select>
						</li>
					</ul>	
					<ul> <!-- 7 -->
						<li>객실 사진</li>
						<li><button type="button" class="fileBtn" onclick="fileChoose()">파일 추가</button></li>
						<li><button type="button" class="fileBtn" onclick="fileDelete()">파일 삭제</button></li>
					</ul>
					<ul> <!-- 8 table -->
						<li></li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="180">파일명</th>
										<th width="300">URL</th>
										<th width="80">SIZE</th>
									</tr>
								</thead>
								<tbody>
									<!-- for문 사용 -->
									<tr>
										<td>
											<input type="checkbox" id="checkbox" name="fileNum" value="1">
											<label for="checkbox"></label>
										</td>
										<td>파일이름</td>
										<td>경로경로 url url</td>
										<td>100MB</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="checkbox2" name="fileNum" value="1">
											<label for="checkbox2"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="checkbox3" name="fileNum" value="1">
											<label for="checkbox3"></label>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 9 -->
						<button type="button" class="roomSaveBtn" onclick="roomManager_save()">객실 정보 저장</button>
					</ul>
				</div>
				

				<button type="button" class="houseSaveBtn" onclick="roomManager_save()">숙소 정보 수정</button>
			</div>

			

		</div>
	</div>
  





	<!-- *************************************************************************************** -->
	<div class="footer">
		<div class="footer_Content">
			<div class="inner">
				<img src="img/default/footerImg/yanolja-logo-gray.png" alt="yanolja-logo-gray">
				<div class="footer_Site">
					<select>
						<option value="apple">비즈니스사이트</option>
						<option value="banana">파트너센터</option>
						<option value="orange">호텔업</option>
						<option value="grape">야놀자 광고센터</option>
						<option value="watermelon">나우웨이팅</option>
						<option value="watermelon">도도포인트</option>
					</select> 
					<span><img src="img/default/footerImg/arrow_drop_down.png" alt="arrow_drop_down"></span>
				</div>

				<div class="footer_companyInfo">
					(주)야놀자 | 대표이사 : 이수진, 김종윤, 배보찬 | 사업자 등록번호 : 220-87-42885 | 통신판매업신고 :
					강남-14211호 | 메일 : help@yanolja.com<br> 관광사업자 등록번호 : 제2016-31호 |
					주소 : 서울특별시 강남구 테헤란로108길 42 | 호스팅서비스 제공자 :
					<!-- -->
					주식회사 야놀자<br> 고객센터 : 1644-1346 (오전 9시 - 익일 새벽 3시)
				</div>

				<div class="footer_Info">
					<span><a href="#">회사소개</a></span>
					<span><a href="#">광고제휴문의</a></span>
					<span><a href="#">인재채용</a></span>
					<span><a href="#">개인정보처리방침</a></span>
					<span><a href="#">청소년 보호 정책</a></span>
					<span><a href="#">서비스 이용약관</a></span>
					<span><a href="#">위치정보이용약관</a></span>
					<span><a href="#">사업자 정보확인</a></span>
					<span><a href="#">전자금융거래 이용약관</a></span>
					<span><a href="#">전자금융거래 이용자 유의사항</a></span>
				</div>

				<div class="footer_sns">
					<a href="#"><img src="img/default/footerImg/instagram_logo.png" alt="instagram_logo"></a>
					<a href="#"><img src="img/default/footerImg/youtube_logo.png" alt="youtube_logo"></a>
					<a href="#"><img src="img/default/footerImg/facebook_logo.png" alt="facebook_logo"></a>
					<a href="#"><img src="img/default/footerImg/blog_logo.png" alt="blog_logo"></a>
				</div>

				<div class="footer_contentLaw">
					<p>(주) 야놀자는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한
						의무와 책임은 각 판매자에게 있습니다.</p>
					<p>(주)야놀자가 소유/운영/관리하는 웹사이트 및 앱 내의 상품/판매자/이벤트 정보, 디자인 및 화면의 구성,
						UI를 포함하여 일체의 콘텐츠에 대한 무단 복제, 배포, 방송 또는 전송, 스크래핑 등의 행위는 저작권법 및 콘텐츠산업
						진흥법 등 관련 법령에 의하여 엄격히 금지 됩니다.</p>
					<span>콘텐츠산업 진흥법에 따른 표시</span>
					<hr>
					<ul>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company1.svg" alt="footer_company1"> 
								<br>정보보호관리체계인증<br>ISMS
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company2.svg" alt="footer_company2"> 
								<br>공정거래위원회 인증<br>소비자중심경영(CCM)
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company3.svg" alt="footer_company3"> 
								<br>2017하이서울<br>브랜드 선정
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company4.svg" alt="footer_company4"> 
								<br>2017브랜드스타<br>숙박앱 부문1위
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company5.svg" alt="footer_company5"> 
								<br>2016모바일어워드코리아<br>박정보부문 대상
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company6.svg" alt="footer_company6"> 
								<br>2015앱어워드코리아<br>숙박정보부문 대상
							</div>
						</li>
						<li>
							<div>
								<img src="img/default/footerImg/footer_company7.svg" alt="footer_company7"> 
								<br>2015대한민국<br>마케팅대상 
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>