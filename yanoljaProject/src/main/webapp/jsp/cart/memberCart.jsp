<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>장바구니</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

	
<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header" />

<body onload="memCart()">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>

<div class="memberCart">
	<div class="inner">
		<h2>장바구니</h2>
		<hr>
		<div class="selectCart_all">
			<input type="checkbox" name="cartSelectALLBtn" id="cartSelectALLBtn" onclick="selectCartAll(this);  cartTotalPrice();"> 
			<label for="cartSelectALLBtn" class="cartBtn">&nbsp;&nbsp;전체 선택</label>
		</div>

		<div class="cartList">
 			<h3 id="cartNone"></h3>
				<ul id="cartList" name="cartList">
					<!-- js로 불러오는 중 -->
	 			</ul>
		</div>

		<div class="cartResult" id="cartResult">

		</div>
	</div>
</div>


<c:import url="/footer" />