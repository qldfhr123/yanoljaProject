<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>후기 작성</title>

<script src="yanoljaFunction.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<div class="reviewMember inner">
	<h2>후기 작성</h2>
	<hr>
	
	<div class="inner800">
	
		<form action="memReviewProc" method="post">
			<div class="reviewMember_info" id="reviewMember_info">
			<div>
					<span>숙소명</span><input type="text" name="hostName" value="${sessionScope.host_name }" readonly>
				</div>
				<div>
					<span>객실명</span><input type="text" name="roomName" value="${sessionScope.room_name }" readonly>
				</div>
			</div>
	

			<div class="starSet" id="starSet">
				<h2>별점 입력란</h2>
				<fieldset>
					<input type="radio" name="reviewPoint" value="5" id="rate1"><label for="rate1">⭐</label>
					<input type="radio" name="reviewPoint" value="4" id="rate2"><label for="rate2">⭐</label>
					<input type="radio" name="reviewPoint" value="3" id="rate3"><label for="rate3">⭐</label>
					<input type="radio" name="reviewPoint" value="2" id="rate4"><label for="rate4">⭐</label>
					<input type="radio" name="reviewPoint" value="1" id="rate5"><label for="rate5">⭐</label>
				</fieldset>
			</div>
			
			<div class="review_write">
				<h2>후기 작성란</h2>
				<textarea name="content" placeholder="후기를 입력하세요."></textarea>
			</div>
	
			<div class="review_button">
  				<button class="saveMemReviewBtn">완료</button>
				<input type="text" name="userId" style="display:none;" value="${sessionScope.user_id }">
				<input type="text" name="reseNum" style="display:none;" value="${sessionScope.rese_num }">
				<input type="text" name="checkIn" style="display:none;" value="${sessionScope.check_in }">
			</div>
			
			
		</form>
	</div>
</div>

<c:import url="/footer"/>