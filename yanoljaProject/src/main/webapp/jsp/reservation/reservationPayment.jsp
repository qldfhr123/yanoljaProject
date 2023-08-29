<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>결제</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header" />

<body onload="check_DateTimeSET(); save_CurrentDateTime(); calculateNightCount(); moneyFormat();">

<div class="reservation">
	<div class="inner">
		<h2>숙박 예약</h2>
		<hr>
		<form action="memReserveProc" method="post" id="f">
			<div class="reservationInfo">
				<span>
					<input type="text" name="hostName" id="reservationInfo" value="${sessionScope.host_name }" readonly>
					<input type="text" name="roomName" id="reservationInfo" value="${sessionScope.room_name }" readonly>
					
				</span>
				
				<ul>
					<li class="reservation_checkIn">
						<p>체크인</p>
						<input type="text" id="roomReservation_checkInDate" value="${sessionScope.check_in.substring(0, check_in.lastIndexOf(')')+1) }" readonly>
						<input type="text" id="roomReservation_checkInTime" value="${sessionScope.check_in.substring(check_in.length()-5, check_in.length()) }" readonly>
					</li>
					<li style="background:#ddd; border:none; width:200px; margin:0 70px;">
						<span><input type="text" id="roomReservation_DateCount" readonly></span>
					</li>
					<li class="reservation_checkOut" style="display:inline-block;">
						<p>체크아웃</p>
						<input type="text" id="roomReservation_checkOutDate" value="${sessionScope.check_out.substring(0, check_out.lastIndexOf(')')+1) }" readonly>
						<input type="text" id="roomReservation_checkOutTime" value="${sessionScope.check_out.substring(check_out.length()-5, check_out.length()) }" readonly>	
					</li>
				</ul>
				<p>
					<span>취소 및 환불 불가</span>
				</p>
				<p>ㆍ모텔의 경우 예약 완료 시점부터 1시간 이내 전액 취소가 가능합니다.</p>
				<p>ㆍ단, 입실 시간이 경과된 경우 예약완료 후 1시간 이내라도 취소 및 환불이 불가합니다.</p>
<!--				
		 		<div class="reservationChoice">
					<input type="text" id="reservationChoice_price" value="3600000원" readonly>
					<div>
						<button type="submit" name="buttonType" value="saveCartBtn">장바구니 담기</button>
						<button type="submit" name="buttonType" value="paymentBtn">결제하기</button>
					</div>
				</div>
-->
		 
		 
		 		<div class="reservationChoice">
					<input type="text" name="roomPrice" id="reservationChoice_price_ex" style="display:none;" value="${sessionScope.room_price }">
					<input type="text" id="reservationChoice_price" readonly>
					<div>
						<button id="resePay_openPopupButton" type="submit" name="buttonType" value="saveCartBtn">장바구니 담기</button>
			<!--  			
						<div class="resePay_popup" style="display:none;" id="resePay_confirmationPopup">
							<div class="resePay_popup_content">
								<h3>이미 장바구니에 추가된 항목입니다.</h3>
								<button id="resePay_confirmButton">확인</button>
							</div>
						</div>
			 -->			
						
						<button type="submit" name="buttonType" value="paymentBtn">결제하기</button>
					</div>
				</div>
				
				
				<!-- reservation DB 저장용 -->
				<input type="text" name="reseNum" style="display:none;" id="reserve_number"> 
				<input type="text" name="userId" style="display:none;" value="${sessionScope.user_id }">
				<input type="text" name="userName" style="display:none;" value="${sessionScope.user_name }">
				<input type="text" name="userMobile" style="display:none;" value="${sessionScope.user_mobile }">
				<input type="text" name="adminName" style="display:none;" value="${sessionScope.admin_name }">
				<input type="text" name="region" style="display:none;" value="${sessionScope.region }">
				
				<input type="text" name="children" style="display:none;" value="${sessionScope.children }">
				<input type="text" name="people" style="display:none;" value="${sessionScope.people }">
				
				<input type="text" name="checkIn" style="display:none;" id="checkIn_DateTime">
				<input type="text" name="checkOut" style="display:none;" id="checkOut_DateTime">
		<!--  		
				<input type="text" name="payCheck" style="display:none;" id="payCheck_type">
				<input type="text" name="roomInfo" style="display:none;" value="${sessionScope.room_info }">
				<input type="text" name="idSelectLod" style="display:none;" value="${sessionScope.id_select_lod }">
		-->		
				<input type="text" name="roomType" style="display:none;" value="${sessionScope.room_type }">
				<input type="text" name="representativeImg" style="display:none;" value="${sessionScope.imagePath }">
				
	
			</div>
		</form>
				
				
				
	</div>
</div>


<c:import url="/footer" />