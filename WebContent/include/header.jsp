<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="./css/reset.css" type="text/css">
<!-- 리셋 CSS -->
<link rel="stylesheet" href="./css/style.css" type="text/css">
<!-- 디자인 CSS -->
</head>
<body>
	<div id="wrap">
		<header>
			<div class="inner clfix">
				<strong class="logo"><a href="#none">PICK ME</a></strong>
				<nav class="gnb">
					<a href="#none">채용탐색</a> 
					<a href="#none">이력서</a> 
					<a href="#none">지원현황</a>
					<a href="#none">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li><span><a href="#none">로그인</a> / <a href="#none">회원가입</a></span></li>
					<li><a href="#none">기업서비스</a></li>
				</ul>
			</div>
			<!-- // inner -->
		</header>
		<!-- // header -->
		<div id="sub-container">
			<div class="inner">
				<div class="subTit">
					<h2 class="pageTit"><%@include file ="./title01.jsp" %></h2>
					<div class="location">
						<span>홈</span>
						<span>></span>
						<span>depth1</span>
						<span>></span>
						<span>depth2</span>
					</div>
					<ul class="depth02 clfix">
						<li class="on"><a href="#none">depth02-A</a></li>
						<li><a href="#none">depth02-B</a></li>
						<li><a href="#none">depth02-C</a></li>
					</ul>
					<!-- // depth02 -->
				</div>
				<!-- // subTit -->
				<div class="subCont">