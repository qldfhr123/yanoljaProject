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
  <title>[사업자용]신규숙소등록</title>
    <style>
/* 팝업 배경 스타일 */
.popup-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
}

/* 팝업 내용 스타일 */
.popup-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

/* 닫기 버튼 스타일 */
.popup-close {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
}
</style>
  <link rel="stylesheet" href="css/reset.css" type="text/css">

 </head>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="yanoljaFunction.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>

<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
            	if(data.userSelectedType === 'R'){
            		document.getElementById('address').value= data.roadAddress;
            	}
            	else{
            		document.getElementById('address').value= data.jibunAddress;
            	}
            	document.getElementById('postcode').value= data.zonecode;
            	/*
	            	console.log(data.userSelectedType)
	            	console.log(data.jibunAddress)
	            	console.log(data.roadAddress)
	            	console.log(data.zonecode)
            	*/
            	
            	
            }
        }).open();
    }

	function checkBtn_show() {
		
		
		var roomType1 = document.getElementById("roomType1");
        var roomType2 = document.getElementById("roomType2");
		var roomTypeState1 = document.getElementById("roomTypeState1");
		var roomTypeState2 = document.getElementById("roomTypeState2");
		
		var roomType1_Update = document.getElementById("roomType1_Update");
        var roomType2_Update = document.getElementById("roomType2_Update");
		var roomTypeState1_Update = document.getElementById("roomTypeState1_Update");
		var roomTypeState2_Update = document.getElementById("roomTypeState2_Update");

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
		
		if (roomType1_Update.checked) { // 대실
			roomTypeState1_Update.style.display = "block";
		} else {
			roomTypeState1_Update.style.display = "none";
		}

		if (roomType2_Update.checked) {  // 숙박
			roomTypeState2_Update.style.display = "block";
		} else {
			roomTypeState2_Update.style.display = "none";
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


 <body>
 	<c:import url="/header"></c:import>
 	

	<!-- *************************************************************************************** -->

	<div class="newHouseManager">
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
			
			
			<form method="post" id="MG_frist_form">
				<h2>신규 숙소 상세정보 등록</h2>
				<hr>
				
				<div class="newHouse_register">
				
					<ul> <!-- 1 -->
						<li>숙소 종류</li>
						<li>
							<select id="selectedCategory" name="selectedCategory">
								<option value="선택">-선택-</option>
								<option value="모텔">모텔</option>
								<option value="호텔/리조트">호텔/리조트</option>
								<option value="펜션/풀빌라">펜션/풀빌라</option>
								<option value="캠핑/글램핑">캠핑/글램핑</option>
							</select>
						</li>
					</ul>
					<ul> <!-- 2 -->
						<li>숙소명</li>
						<li><input type="text" style="width:500px;" placeholder="숙소명을 입력하세요" name="host_name" id="hostname"></li>
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
						<li><input type="text" style="width:500px;" name ="address_detail" placeholder="상세주소를 입력하세요"></li>
					</ul>

					<hr>
					<ul> <!-- 6 -->
						<li>안내/정책</li>
						<li><textarea class="roomInfo" name ="host_info" placeholder="안내/정책을 입력하세요."></textarea></li>
					</ul>
					<hr> 
					<ul> <!-- 7 -->
					    <li>인기시설/서비스</li>
					    <li class="circleCheck">
					        <input type="checkbox" name="roomServices" id="roomService1" value="주차가능"><label for="roomService1">&nbsp;&nbsp;주차가능</label>
					        <input type="checkbox" name="roomServices" id="roomService2" value="파티룸"><label for="roomService2">&nbsp;&nbsp;파티룸</label>
					        <input type="checkbox" name="roomServices" id="roomService3" value="와이파이"><label for="roomService3">&nbsp;&nbsp;와이파이</label>
					        <input type="checkbox" name="roomServices" id="roomService4" value="어메니티"><label for="roomService4">&nbsp;&nbsp;어메니티</label>
					        <input type="checkbox" name="roomServices" id="roomService5" value="트윈베드"><label for="roomService5">&nbsp;&nbsp;트윈베드</label>
					    </li>
					</ul>
					<ul> <!-- 8 -->
					    <li></li>
					    <li class="circleCheck">
					        <input type="checkbox" name="roomServices" id="roomService6" value="커피숍"><label for="roomService6">&nbsp;&nbsp;커피숍</label>
					        <input type="checkbox" name="roomServices" id="roomService7" value="객실금연"><label for="roomService7">&nbsp;&nbsp;객실금연</label>
					        <input type="checkbox" name="roomServices" id="roomService8" value="수화물보관"><label for="roomService8">&nbsp;&nbsp;수화물보관</label>
					        <input type="checkbox" name="roomServices" id="roomService9" value="비즈니스"><label for="roomService9">&nbsp;&nbsp;비즈니스</label>
					    </li>
					</ul>
					<ul> <!-- 9 -->
					    <li></li>
					    <li class="circleCheck">
					        <input type="checkbox" name="roomServices" id="roomService10" value="24시간 데스크"><label for="roomService10">&nbsp;&nbsp;24시간 데스크</label>
					        <input type="checkbox" name="roomServices" id="roomService11" value="부티크브랜드"><label for="roomService11">&nbsp;&nbsp;부티크브랜드</label>
					    </li>
					</ul>
					
					<hr><%--1번째 form 끝 --%>
					
					<ul> <!-- 10 table -->
						<li>숙소 이미지 등록</li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="200">이미지</th>
										<th width="320">이미지 이름</th>
										<th width="100">이미지 크키</th>
									</tr>
								</thead>
								<tbody id ="fileTableBody">
									<!-- for문 사용 -->
									
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 11 -->
						<li></li>
						<li>
							<button type="button" class="fileBtn1" onclick="handleFileInput()">이미지 등록</button>
						    <input type="file" name="file" id="file" style="display:none" multiple onchange="handleFiles(this.files)" /> 
						</li>
						<li><button type="button" class="fileBtn2" onclick="fileDelete()">이미지 삭제</button></li>
					</ul>
					
					<hr><%--2번째 form 끝 --%>
					
					<ul> <!-- 12 table -->
						<li>객실 등록</li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="150">객실명</th>
										<th width="100">인원</th>
										<th width="185">판매가(대실)</th>
										<th width="185">판매가(숙박)</th>
									</tr>
								</thead>
								<tbody id ="roomTableBody">
									<!-- for문 사용 -->
									
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 13 -->
						<li></li>
						<li><button type="button" class="fileBtn" onclick="roomregisterBtn_show()">객실 추가</button></li>
						<li><button type="button" class="fileBtn" onclick="fileUpdate()">객실 수정</button></li>
						<li><button type="button" class="fileBtn" onclick="roomfileDelete()">객실 삭제</button></li>
					</ul>
				</div>
				</form>
				<%--3번째 form 시작 --%>
				<form method="post" id="MG_last_form">
				<!-- 객실등록 -->
				<div class="room_register" id="room_registerState" style="display:none;">
					<ul> <!-- 1 -->
						<li>숙소명</li>
						<li><input type="text" style="width:500px;" name="host_nameInsert"  id="host_nameInsert"></li>
					</ul>
					<ul> <!-- 2 -->
						<li>객실명</li>
						<li><input type="text" style="width:500px;" placeholder="객실명을 입력하세요" name="roomName" id="roomName"></li>
					</ul> 
					<ul> <!-- 3 -->
						<li>인원</li>
						<li>기준 인원</li>
						<li><input type="text" style="width:110px;" placeholder="기준인원" name ="minPeopole" id ="minPeopole" >&nbsp;명</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>최대 인원</li>
						<li><input type="text" style="width:110px;" placeholder="최대인원" name ="maxPeopole" id ="maxPeopole" >&nbsp;명</li>
					</ul>
					<ul> <!-- 4 -->
						<li>판매 종류</li>
						<li class="circleCheck" id="roomTypeChioce">
							<input type="checkbox" id="roomType1" value="대실" onclick="checkBtn_show()" name="partTime" id="partTime"><label for="roomType1" >&nbsp;&nbsp;대실</label>
							<input type="checkbox" id="roomType2" value="숙박" onclick="checkBtn_show()" name="nonpartTime" id ="nonpartTime"><label for="roomType2" >&nbsp;&nbsp;숙박</label>
						</li>
					</ul>
					<ul id="roomTypeState1" style="display:none;"> <!-- 5 -->
						<li value="roomType">대실</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가" name="roomPay_dae" id="roomPay_dae">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>이용시간</li>
						<li>
							<select id="userTime">
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
							<select id="ableTime_start">
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
							<select id="ableTime_last">
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
						<li value="roomType">숙박</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가"name="roomPay_su" id="roomPay_su">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>입실시간</li>
						<li>
							<select id="ableTime_start_su">
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
						<li >퇴실시간</li>
						<li>
							<select id="ableTime_last_su">
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
						
						<li>
							<button type="button" class="fileBtn1" onclick="roomFileInput()">이미지 등록</button>
							
						    <input type="file" name="fileRoom" id="fileRoom" style="display:none" multiple onchange="roomInput(this.files)" /> 
						 	
						</li>
						 
						<li><button type="button" class="fileBtn2" onclick="roomfileimgDelete()">이미지 삭제</button></li>
					</ul>

					<ul> <!-- 8 table -->
						<li></li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="180">이미지</th>
										<th width="300">이미지 이름</th>
										<th width="80">이미지 크키</th>
									</tr>
								</thead>
								<tbody id= "roomInsertBody">
									<!-- for문 사용 -->
									
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 9 -->
						<button type="button" class="roomSaveBtn" onclick="roominfo_save()">객실 정보 저장</button>
					</ul>
					
				</div>
				
				<div class="room_register" id="room_registerState_update" style="display:none;">

					<ul> <!-- 1 -->
						<li>숙소명</li>
						<li><input type="text" style="width:500px;" name="hont_nameUpdate"  id="hont_nameUpdate"></li>
					</ul>
					<ul> <!-- 2 -->
						<li>객실명</li>
						<li><input type="text" style="width:500px;" placeholder="객실명을 입력하세요" name="roomName" id="roomName_Update"></li>
					</ul> 
					<ul> <!-- 3 -->
						<li>인원</li>
						<li>기준 인원</li>
						<li><input type="text" style="width:110px;" placeholder="기준인원" name ="minPeopole_Update" id ="minPeopole_Update" >&nbsp;명</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>최대 인원</li>
						<li><input type="text" style="width:110px;" placeholder="최대인원" name ="maxPeopole_Update" id ="maxPeopole_Update" >&nbsp;명</li>
					</ul>
					<ul> <!-- 4 -->
						<li>판매 종류</li>
						<li class="circleCheck" id="roomTypeChioce">
							<input type="checkbox" id="roomType1_Update" value="대실" onclick="checkBtn_show()" name="partTime" ><label for="roomType1_Update" >&nbsp;&nbsp;대실</label>
							<input type="checkbox" id="roomType2_Update" value="숙박" onclick="checkBtn_show()" name="nonpartTime" ><label for="roomType2_Update" >&nbsp;&nbsp;숙박</label>
						</li>
					</ul>
					<ul id="roomTypeState1_Update" style="display:none;"> <!-- 5 -->
						<li value="roomType">대실</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가" name="roomPay_dae_Update" id="roomPay_dae_Update">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>이용시간</li>
						<li>
							<select id="userTime_Update">
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
							<select id="ableTime_start_Update">
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
							<select id="ableTime_last_Update">
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
					<ul id="roomTypeState2_Update" style="display:none;"> <!-- 6 -->
						<li value="roomType">숙박</li>
						<li>판매가</li>
						<li><input type="text" style="width:120px;" placeholder="판매가"name="roomPay_su_Upadate" id="roomPay_su_Update">&nbsp;원</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>입실시간</li>
						<li>
							<select id="ableTime_start_su_Update">
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
						<li >퇴실시간</li>
						<li>
							<select id="ableTime_last_su_Update">
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
						
						<li>
							<button type="button" class="fileBtn1" onclick="roomFileInput_Update()">신규 이미지 등록</button>
						    <input type="file" name="fileRoom_Update" id="fileRoom_Update" style="display:none" multiple onchange="roomUpdate(this.files)" /> 
						</li>
						<li><button type="button" class="fileBtn2" onclick="roomfileimgDelete_update()">이미지 삭제</button></li>
					</ul>
					<ul> <!-- 8 table -->
						<li></li>
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="300">이미지 이름</th>
										<th width="180"><button type="button" class="fileBtn1" onclick="roomfileimgDelete_updateEx()">체크한 이미지 삭제</button></th>
									</tr>
								</thead>
								<tbody id= "roomUpdateBody_Ex">
									<!-- for문 사용 -->
									
								</tbody>
							</table>
						</li>
						
						<li align="center">
							<table border=1 class="manager_table">
								<thead>
									<tr>
										<th width="50"></th>
										<th width="180">이미지</th>
										<th width="300">이미지 이름</th>
										<th width="80">이미지 크키</th>
										
									</tr>
								</thead>
								<tbody id= "roomUpdateBody">
									<!-- for문 사용 -->
									
								</tbody>
							</table>
						</li>
					</ul>
					<ul> <!-- 9 -->
						<button type="button" class="roomSaveBtn" onclick="roominfo_save_update()">객실 정보 수정</button>
					</ul>
				</div>
				

				<button type="button" class="houseSaveBtn" onclick="roomManager_save()">신규 숙소 등록</button>
				</form>
			</div>
		
			<%--3번째 form 끝 --%>
			

		</div>
		
	</div>
				
			
				<div class="popup-overlay" id="popupOverlayNew" style="display:none;">
				    <!-- 팝업 내용 -->
				    <div class="popup-content">
				        <span class="popup-close" id="popupClose_check">&times;</span>
				        <h2>알림</h2>
				        <p>선택된 항목이 없습니다 다시 한번 확인해주세요</p>
				    </div>
				</div>
	
  <!-- x 추가  -->




	<!-- *************************************************************************************** -->
	
	<c:import url="/footer"></c:import>
	<script src="newHouseMG.js"></script>
 </body>
</html>