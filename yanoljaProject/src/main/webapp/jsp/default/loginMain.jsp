<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>로그인 야놀자 메인 페이지</title>

<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header" />

<div class="loginMain inner">

		<button onclick="location.href='loginMember'">개인용</button>
		<button onclick="location.href='adminLogin'">사업자용</button>
		
	

</div>



<c:import url="/footer" />