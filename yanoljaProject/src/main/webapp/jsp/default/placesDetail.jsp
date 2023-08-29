<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>객실 상세정보</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>

<body onload="priceSetPresent()">
<div class="placesDetail">
	<div class="inner">
		<div class="placeDetailView" >
			<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
			<input type="text" name="roomName" id="placesDetail_room_name" value="${sessionScope.room_name }" readonly>
			<input type="text" name="hostName" id="placesDetail_house_name" value="${sessionScope.host_name }" readonly>
			<input type="text" name="roomDefaultPeoCount" id="placesDetail_people" value="기준 2명 / 최대 2명" readonly>
		</div>
		<div class="placeDetailContents">
		    <div class="ReservationInfoPlaceDetail">
				<ul>
					<li>
						<div>
							<span><img src="img/default/main/calendar.png" alt="calendar" /></span>
							<p>
								<span>
									<input type="text" id="ReservationInfoPlaceDetail_checkDate" value="${sessionScope.check_in }" readonly>
									<input type="text" id="ReservationInfoPlaceDetail_checkDate" value=" ~ " style="width:20px;" readonly>
									<input type="text" id="ReservationInfoPlaceDetail_checkDate" value="${sessionScope.check_out }" readonly>
								</span>
							</p>
						</div>
					</li>
					<li>
						<div>
							<span><img src="img/default/main/myPage.png" alt="personNumber" /></span>
							<p>
								<span>
									<input type="text" id="ReservationInfoPlaceDetail_people" value="성인 ${sessionScope.people }" readonly>
									<input type="text" id="ReservationInfoPlaceDetail_people" value=", " style="width:10px;" readonly>
									<input type="text" id="ReservationInfoPlaceDetail_people" value="아동 ${sessionScope.children }" readonly>
								</span>
							</p>
							<p id="reservationPersonNumber">성인 2, 아동 0</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="roomReservation">
				<ul>
					<li>
						<h4>대실</h4>
						<div class="useInfo">
							<p><span>인원</span><input type="text" id="roomReservation_people" value="2명 / 최대 2명" readonly></p>
							<p><span>이용시간</span><input type="text" id="roomReservation_hours" value="5시간" readonly></p>
							<p><span>운영시간</span><input type="text" id="roomReservation_time" value="15:00~22:00" readonly></p>
						</div>
						<input type="text" id="roomReservation_price" style="display:none; "value="${sessionScope.room_price }원" readonly>
						<input type="text" id="roomReservation_price_set" value=" 원" readonly>
						<a href="reservationPayment">객실 예약하기</a>
					</li>
					<li>
						<h4>숙박</h4>
						<div class="useInfo">
							<p><span>인원</span><input type="text" id="roomReservation_people" value="2명 / 최대 2명" readonly></p>
							<p><span>체크인</span><input type="text" id="roomReservation_checkIn" value="21:00" readonly></p>
							<p><span>체크아웃</span><input type="text" id="roomReservation_checkOut" value="13:00" readonly></p>
						</div>
						<input type="text" id="roomReservation_price" value="300,000원" readonly>
						<a href="reservationPayment">객실 예약하기</a>
					</li>
				</ul>
			</div>
			<div class="roomReview">
				<h3>객실 후기(200)</h3>
				<div class="sortReview">
					<ul>
						<li><p>ㆍ최근 작성순</p></li>
						<li><p>ㆍ별점 높은순</p></li>
					</ul>
				</div>
				<div class="ReviewList">
					<ul>
						<li>
							<div class="reviewerInfo">
							<p><span>★★★★☆</span>4.0 (200)</p>
							<h4>닥터카투사 | 2023.07.24</h4>						
							</div>	
							<p><strong>객실명</strong>${sessionScope.room_name }</p>
							<p>두번 이용했는데 괜춘 직원들도 친절</p>
							<div class="Reply">
							<h3>숙소 답변 |  2023.07.24</h3>
							<p>
								닥터카투사님 반갑습니다. <br/>
								포레스타 호텔입니다. <br/>
								항상 저희 포레스타를 이용해주셔서 감사합니다~~~~ <br/>
								다음에도 또 이용해주세요~~~~ <br/>
								- 포레스타 직원 일동 
							</p>
							</div>
						</li>
						<li>
							<div class="reviewerInfo">
							<p><span>★★★★☆</span>4.0 (200)</p>
							<h4>닥터카투사 | 2023.07.24</h4>						
							</div>	
							<p><strong>객실명</strong>${sessionScope.room_name }</p>
							<p>두번 이용했는데 괜춘 직원들도 친절</p>
							<div class="Reply">
							<h3>숙소 답변 |  2023.07.24</h3>
							<p>
								닥터카투사님 반갑습니다. <br/>
								포레스타 호텔입니다. <br/>
								항상 저희 포레스타를 이용해주셔서 감사합니다~~~~ <br/>
								다음에도 또 이용해주세요~~~~ <br/>
								- 포레스타 직원 일동 
							</p>
							</div>
						</li>
						<li>
							<div class="reviewerInfo">
							<p><span>★★★★☆</span>4.0 (200)</p>
							<h4>닥터카투사 | 2023.07.24</h4>						
							</div>	
							<p><strong>객실명</strong>${sessionScope.room_name }</p>
							<p>두번 이용했는데 괜춘 직원들도 친절</p>
							<div class="Reply">
							<h3>숙소 답변 |  2023.07.24</h3>
							<p>
								닥터카투사님 반갑습니다. <br/>
								포레스타 호텔입니다. <br/>
								항상 저희 포레스타를 이용해주셔서 감사합니다~~~~ <br/>
								다음에도 또 이용해주세요~~~~ <br/>
								- 포레스타 직원 일동 
							</p>
							</div>
						</li>
						<li>
							<div class="reviewerInfo">
							<p><span>★★★★☆</span>4.0 (200)</p>
							<h4>닥터카투사 | 2023.07.24</h4>						
							</div>	
							<p><strong>객실명</strong>${sessionScope.room_name }</p>
							<p>두번 이용했는데 괜춘 직원들도 친절</p>
							<div class="Reply">
							<h3>숙소 답변 |  2023.07.24</h3>
							<p>
								닥터카투사님 반갑습니다. <br/>
								포레스타 호텔입니다. <br/>
								항상 저희 포레스타를 이용해주셔서 감사합니다~~~~ <br/>
								다음에도 또 이용해주세요~~~~ <br/>
								- 포레스타 직원 일동 
							</p>
							</div>
						</li>
						<li>
							<div class="reviewerInfo">
							<p><span>★★★★☆</span>4.0 (200)</p>
							<h4>닥터카투사 | 2023.07.24</h4>						
							</div>	
							<p><strong>객실명</strong>${sessionScope.room_name }</p>
							<p>두번 이용했는데 괜춘 직원들도 친절</p>
							<div class="Reply">
							<h3>숙소 답변 |  2023.07.24</h3>
							<p>
								닥터카투사님 반갑습니다. <br/>
								포레스타 호텔입니다. <br/>
								항상 저희 포레스타를 이용해주셔서 감사합니다~~~~ <br/>
								다음에도 또 이용해주세요~~~~ <br/>
								- 포레스타 직원 일동 
							</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</div>


<c:import url="/footer" />