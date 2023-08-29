<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>숙소 상세정보</title>

<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>
<div class="places">
	<div class="inner" >
		<div class="placesInfo">
			<span><img src="img/default/places/img2.jpg" alt="img2"/></span>
			<h2>${sessionScope.host_name }</h2>
			<p><span>★★★★☆</span>4.0 (200)</p>				
			<h4>인기 시설 및 서비스</h4>
			<ul class="popularService">
				<li>
					<span><img src="img/default/places/business.png" alt="비즈니스"/></span>
					<p>비즈니스</p>
				</li>
				<li>
					<span><img src="img/default/places/buffet.png" alt="뷔페"/></span>
					<p>뷔페</p>
				</li>
				<li>
					<span><img src="img/default/places/baggage.png" alt="수화물보관"/></span>
					<p>수화물보관</p>
				</li>
				<li>
					<span><img src="img/default/places/amenity.png" alt="어매니티"/></span>
					<p>어매니티</p>
				</li>
				<li>
					<span><img src="img/default/places/breakfast.png" alt="조식운영"/></span>
					<p>조식운영</p>
				</li>
				<li>
					<span><img src="img/default/places/cafe.png" alt="커피숍"/></span>
					<p>커피숍</p>
				</li>
				<li>
					<span><img src="img/default/places/24hrDesk.png" alt="24시간 데스크"/></span>
					<p>24시간 데스크</p>
				</li>
			</ul>
		</div>
		<div class="placesList">
			<ul class="placesMenu">
				<li>
					<a href="#">객실선택</a>
				</li>
				<li>
					<a href="#">위치/교통</a>
				</li>
				<li>
					<a href="#">안내/정책</a>
				</li>
				<li>
					<a href="#">후기</a>
				</li>
			</ul>
		<div class="ReservationInfoPlace">
			<ul>
				<li>
					<div>
						<span><img src="img/default/main/calendar.png" alt="calendar" /></span>
						<p id="reservationDate">${sessionScope.check_in } ~ ${sessionScope.check_out }</p>
					</div>
				</li>
				<li>
					<div>
						<span><img src="img/default/main/myPage.png" alt="personNumber" /></span>
						<p id="reservationPersonNumber">성인 ${sessionScope.people }, 아동 ${sessionScope.children }</p>
					</div>
				</li>
			</ul>
		</div>
		</div>
		<div class="roomList">
			<ul>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>${sessionScope.room_name }</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>${sessionScope.room_name }</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>${sessionScope.room_name }</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>
				<li>
					<div>
						<span><img src="img/default/main/img1.jpg" alt="img1" /></span>
						<p>Standard</p>
						<p>기준 2인 / 최대 2인 ㆍ퀸 침대 1개</p>
						<ul class="price">
							<li>
								<p>대실 5시간</p>
								<p>30,000원 ~</p>
							</li>
							<li>
								<p>숙박 15:00~</p>
								<p>63,000원 ~</p>
							</li>
						</ul>
						<a href="placesDetail">객실 선택하기</a>
					</div>	
				</li>

			</ul>
			

		</div>
		
		

	</div>		
</div>

<c:import url="/footer"/>