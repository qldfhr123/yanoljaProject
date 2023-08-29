<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="/css/header.css" type="text/css">
<style type="text/css">
</style>
</head>

<c:url var="context" value="/"/>
<body>

	<div class="header">
		<div class="inner">
			<a href="${context }index"><img src="img/default/headerImg/logoYanolja.png" alt="logoYanolja"></a>
			<div class="header_menu">
				<ul>
					<li>
						<a href="${context }index">
							<img src="img/default/headerImg/home.png" alt="home"> 
							<p>HOME</p>
						</a>
					</li>
					<li>
						<a href="${context }Cart">
							<img src="img/default/headerImg/shoppingCart.png" alt="shoppingCart"> 
							<p>장바구니</p>
						</a>
					</li>
					<li>
						<a href="${context }myPage">
							<img src="img/default/headerImg/myPage.png" alt="myPage"> 
							<p>마이페이지</p>
						</a>
					</li>
				</ul>
			</div>

		</div>
	</div>

</body>
</html>