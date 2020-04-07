<%@page import="model.CMemberDto"%>
<%@page import="model.AMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session
	AMemberDto member = (AMemberDto) session.getAttribute("loginuser");
	CMemberDto company = (CMemberDto) session.getAttribute("logincompany");
	String userName = "";
	if( member != null ){
		userName = member.getName();
		System.out.println("유저네임 : "+userName);
	}
	else if( company != null ){
		userName = company.getName();
	}
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 삭제 alert -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">
<!-- 디자인 CSS -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- font-awesome -->
</head>
<body>
	<div id="wrap">
		<header>
			<div class="inner clfix">
				<strong class="logo"><a href="/Pickme/login/main.do">PICK ME</a></strong>
			<%
			 // 일반 로그인일 떄 
		 	 if( member != null ){
		 		 %>
		 		 <nav class="gnb">
					<a href="#none">채용탐색</a> <!-- 일반회원 채용탐색  -->
					<a href="#">이력서</a><!-- 일반회원 이력서쓰기  -->
					<a href="/Pickme/e_apply/curCvReq.do">지원현황</a><!-- 일반회원 지원현황  -->
					<a href="#none">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li>
						<a href="#mypage.do"><%=userName %> 님 </a><!-- 일반회원 마이페이지 -->
					</li>
					<li><a href="/Pickme/login/company/comLogin.do">기업서비스</a></li>
				</ul>
		 		 <%
		 		 // 기업회원 로그인일때
		 	 } else if( company != null ){
				 %>
				 <nav class="gnb">
					<a href="#none">인재탐색</a> <!-- 기업회원 인재탐색  -->
					<a href="#">지원현황</a><!-- 기업 회원 지원현황  -->
					<a href="/Pickme/e_apply/curCvReq.do">채용관리</a><!-- 일반회원 지원현황  -->
					<a href="#none">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li>
						[기업] <%=userName %> 
					</li>
					<!-- 일반회원 마이페이지 -->
					<li><a href="/Pickme/login/company/comLogin.do">기업페이지</a></li>
				</ul>
				 <%
				 // 비로그인 시
			 } else {
				 %>
				 <nav class="gnb">
					<a href="#none">채용탐색</a> <!-- 일반회원 채용탐색  -->
					<a href="/Pickme/login/memLogin.do">이력서</a><!-- 일반회원 이력서쓰기  -->
					<a href="/Pickme/login/memLogin.do">지원현황</a><!-- 비로그인 -> 로그인 페이지로 -->
					<a href="#none">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li>
						<a href="/Pickme/login/memLogin.do">로그인</a>
							 			/
					 	<a href="/Pickme/login/memJoin.do">회원가입</a>
					</li>
					<li><a href="/Pickme/login/company/comLogin.do">기업서비스</a></li>
				</ul>
				 <%
			 }
			%>
			</div>
		</header>
		<!-- // header -->
		<div id="sub-container">
			<div class="inner">
				<div class="subTit">
					<h2 class="pageTit"><%@include file ="./title01.jsp" %></h2>
					<!-- location -->
					<%@include file ="../../../include/location.jsp" %>
					<!-- depth02 -->
					<%@include file ="./depth02.jsp" %>
				</div>
				<!-- // subTit -->
				<div class="subCont">
				
