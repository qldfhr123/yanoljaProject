<%@page import="com.care.yanolja.common.indexDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yanolja</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<script src="yanoljaChoice.js"></script>
</head>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<span class="material-symbols-outlined" id="arrow_upward" onClick="javascript:window.scrollTo(0,0)">arrow_upward</span>

<body>

	<c:import url="/index_header"/>


<div class="inner">
	<div class="content" id="choice_main">
		<div class="sort">
			<ul>
				<li><p onclick="handleSortClick('낮은 가격순')">ㆍ낮은 가격순</p></li>
				<li><p onclick="handleSortClick('높은 가격순')">ㆍ높은 가격순</p></li>
				<li><p onclick="handleSortClick('별점 높은순')">ㆍ별점 높은순</p></li>
				<li><p onclick="handleSortClick('후기 많은순')">ㆍ후기 많은순</p></li>
			</ul>
		</div>
	</div>

	<div class="index" id = "main">
         <div class="inner">
            <div class="houseList" >
               <ul>
                   <c:forEach var="item" items="${mainList}"  varStatus="status">

                       <li>
                           <div>

                            <span><img src="${imagePaths[status.index]}" alt="img1" id="sendData${status.index}"
                            onload="priceSetPresent(this)" onclick="pageChange(this); location.href='places'" /></span>

                        
                               <p>${item.host_name }</p>
                               <p><span>★★★★☆</span>4.0 (200)</p>
                               <ul class="price">
                               <c:forEach var="hostNameDto" items="${hostNameDto }">
                                   <li>
                                       <p>${hostNameDto.sleep_typeDae } <br>
                                 <c:if test="${not empty hostNameDto.useTimeDae }">
                                     이용가능 시간${hostNameDto.useTimeDae }
                                 </c:if>
                                 </p>
                                       <c:if test="${not empty hostNameDto.room_payDae }">
                                       <input type="text" style="display:none;" id="index_room_payDae${status.index}" value="${hostNameDto.room_payDae }">
	                                   <p style="display:flex;"><input type="text" style="border:none; padding-right:10px; display:flex; font-size:20px; text-align:right; margin-top:5px;" id="index_room_payDae_Set${status.index}"><span style="margin-top:10px;"> 원</span></p>
                                    </c:if>
                                    </li>
                                    <li>
                                    <c:if test="${not empty hostNameDto.sleep_typeSu }">
                                        <p>${hostNameDto.sleep_typeSu } </p>
                                    </c:if>
                                    
                                    <c:if test="${not empty hostNameDto.room_paySu }">
                                    	<input type="text" style="display:none;" id="index_room_paySu${status.index}" value="${hostNameDto.room_paySu }">
                                        <p style="display:flex;"><input type="text" style="border:none; padding-right:10px; display:flex; font-size:20px; text-align:right; margin-top:5px;" id="index_room_paySu_Set${status.index}"><span style="margin-top:10px;"> 원</span></p>
                                    </c:if>
                                   </li>
                                   
                                   <!-- 세션 저장용 -->
                                   <input type="text" style="display:none;" id="index_host_name_send${status.index}" value="${item.host_name }">
                                   <input type="text" style="display:none;" id="index_room_name_send${status.index}" value="${item.room_name }">
                                   <input type="text" style="display:none;" id="index_admin_id_send${status.index}" value="${item.admin_id }">
                                   <input type="text" style="display:none;" id="index_admin_name_send${status.index}" value="${item.admin_name }">
                                   <input type="text" style="display:none;" id="index_room_price_send${status.index}" value="${item.room_pay }">
                                   </c:forEach>
                               </ul>
                           </div>
                       </li>

                   </c:forEach>

               </ul>
            
            </div>
            
         </div>
      </div><!-- 마지막 -->
</div>


	<c:import url="/footer"></c:import>

</body>

</html>
