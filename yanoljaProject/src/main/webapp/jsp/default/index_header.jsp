<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<%-- 달력 css --%>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

.calendarModal {
	background-color: white;
	height: auto;
	width: 400px;
	margin: 20px;
	padding: 20px;
	margin: 0 auto;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
}

td {
	width: 50px;
	height: 50px;
}

.Calendar {
	text-align: center;
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 45px;
	width: 45px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.today {
	background-color: #F5D042;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.futureDay {
	background-color: #FFFFFF;
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.saturday {
	color: blue;
	cursor: pointer;
}

.saturday:hover {
	background: #eee;
}

.sunday {
	color: red;
	cursor: pointer;
}

.sunday:hover {
	background: #eee;
}

.futureDay.choiceDay, .today.choiceDay, .saturday.choiceDay, .sunday.choiceDay
	{
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.modal {
	display: none; /* 기본적으로 모달 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: auto;
	height: auto;
	padding:30px;
	background-color: rgba(255, 255, 255, 1.0);
	border: 1px solid black; . close { color : #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

}
.choiceF {
	display: none; /* 기본적으로 숨김 */
}
</style>
<script src="yanoljaChoice.js"></script>


</head>
<body  onload="initialShow()">
	<c:import url="/header"></c:import>
<div class="inner" >
	<div class="nav">
		<ul>
			<li onclick="motelCheck()">
				<div>
					<span><img src="img/default/main/motel.png"
						alt="yanolja-motel"></span>
					<p id="selectedMotelId">모텔</p>
				</div>
			</li>
			<li onclick="hotelCheck()">
				<div>
					<span><img src="img/default/main/hotel.png"
						alt="yanolja-hotel"></span>
					<p id="selectedHotelId">호텔/리조트</p>
				</div>
			</li>
			<li onclick="pensionCheck()">
				<div>
					<span><img src="img/default/main/pension.png"
						alt="yanolja-pension"></span>
					<p id="selectedpensionId">펜션/풀빌라</p>
				</div>
			</li>
			<li onclick="campingCheck()">
				<div>
					<span><img src="img/default/main/camping.png"
						alt="yanolja-camping"></span>
					<p id="selectedCampingId">캠핑/글램핑</p>
				</div>
			</li>
		</ul>
	</div>
	<div class="nav2">
		<ul>
			<li class="choice" onclick="regionChoice('서울')"><p id="seoul">서울</p></li>
			<li class="choice" onclick="regionChoice('경기')"><p id="gyeonggi">경기</p></li>
			<li class="choice" onclick="regionChoice('인천')"><p id=incheon>인천</p></li>
			<li class="choice" onclick="regionChoice('강원')"><p id="gangwon">강원</p></li>
			<li class="choice" onclick="regionChoice('제주')"><p id="jeju">제주</p></li>
			<li class="choice" onclick="regionChoice('부산')"><p id="busan">부산</p></li>
			<li class="choice" onclick="regionChoice('대구')"><p id="daegu">대구</p></li>
			<li class="choice" onclick="regionChoice('광주')"><p id="gwangju">광주</p></li>

		</ul>
	</div>

	<div class="selected">
		<ul>
			<li onclick="allDelete()" id="delete">
				<div>
					<span><img src="img/default/main/refresh.png" alt="refresh"
						id="refresh" /></span>
					<p onclick="initialShow()">전체해제 |</p>
				</div>
			</li>
			<li>
				<div id="type_div">
					<p id="chioce_type"></p>
					<span class="close-icon" onclick="clearChoice('chioce_type')">
						<img src="img/default/main/close.png" alt="close" id="img1" />
					</span>
				</div>
			</li>
			<li>
				<div id="region_div">
					<p id="choice_region"></p>
					<span class="close-icon" onclick="clearChoice('choice_region')">
						<img src="img/default/main/close.png" alt="close" id="img2" />
					</span>
				</div>
			</li>
		</ul>
	</div>
	<div class="ReservationInfo">
		<ul>
			<li onclick="showCalendar()">
				<div>
					<span><img src="img/default/main/calendar.png"
						alt="calendar" /></span>
					<p id="reservationDate">예약 날짜 선택</p>
				</div>
			</li>
			<li onclick="selectPeopole()">
				<div>
					<span><img src="img/default/main/myPage.png"
						alt="personNumber" /></span>
					<p id="reservationPersonNumber">인원 입력하기</p>
				</div>
			</li>
			<!-- 인원 선택 부분 -->
			<li id="last_li">
				<div id="choice_user_form">
					<form action="index" method="post" id="choice_user_fomr">
						<label>성인 : </label><input type="text" name="adult" id="adult"
							min="0"> <label>아동 : </label><input type="text"
							name="children" id="children" min="0"> <input
							type="button" value="저장" id="user_submit"
							onclick="savePeople()"> <span class="close"
							onclick="closeUser()">&times;</span>
					</form>

				</div>
			</li>
		</ul>
	</div>

	<!-- 달력부분 -->
	<div id="calendarModal" class="modal">
		<span class="close" onclick="closeModal()" style="cursor: pointer;">&times;</span>
		<table class="Calendar">
			<thead>
				<tr>
					<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
					<td colspan="5"><span id="calYear"></span>년 <span
						id="calMonth"></span>월</td>
					<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>

			<tbody>
			</tbody>
		</table>
	</div>
	
</div>

</body>
</html>