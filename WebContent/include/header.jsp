<%@page import="model.CMemberDto"%>
<%@page import="model.AMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	// session invalid check
	if( session==null || !request.isRequestedSessionIdValid()){ 
		response.sendRedirect("/Pickme/login/main.do");
	}
 %>
<%
	// session
	AMemberDto member = (AMemberDto) session.getAttribute("loginuser");
	CMemberDto company = (CMemberDto) session.getAttribute("logincompany");
	String userName = "";
	// 일반 로그인 
	if( member != null ){
		// 미인증 메일일 때 
		if(member.getDel() == -1 ){
			response.sendRedirect("/Pickme/login/validate.do");
			return;
		}
		userName = member.getName();
	}
	// 기업 로그인 
	else if( company != null ){
		// 미인증 메일일 때
		if(company.getDel() == -1 ){
			response.sendRedirect("/Pickme/login/validate.do");
			return;
		}
		// 사업자번호 미승인 일 때
		else if(company.getDel() == -2 ){
			response.sendRedirect("/Pickme/login/upapproval.do");
			return;
		}
		userName = company.getName();
	}
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1050, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="refresh" content="3600">
<title>Pick me</title>
<link rel="icon" href="/Pickme/images/main/pickme.ico" sizes="32x32">
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 -->
 
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">
<!-- 디자인 CSS -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- font-awesome -->
<script src="/Pickme/js/jquery/jquery-3.4.1.min.js"></script>
<!-- jquery -->
<script src="/Pickme/js/sweetalert2/sweetalert2.all.js"></script>
<!-- sweetAlert2 -->
<link rel="stylesheet" href="/Pickme/js/sweetalert2/sweetalert2.css" type="text/css"/>
<!-- 구글폰트 적용 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">




</head>
<body>
<!-- message alert  -->
<div id="socketAlert">

</div>

	<div id="wrap">
	
		<header>
			<div class="inner clfix">
				<strong class="logo"><a href="/Pickme/login/main.do">PICK ME</a></strong>
			<%
			 // 일반 로그인일 떄 
		 	 if( member != null ){
		 		 %>
		 		 <nav class="gnb">
					<a href="/Pickme/searchJob/recSearch.do">채용탐색</a> <!-- 일반회원 채용탐색  -->
					<a href="/Pickme/resume/resume.do">이력서</a><!-- 일반회원 이력서 관리  -->
					<a href="/Pickme/e_apply/curCvReq.do">지원현황</a><!-- 일반회원 지원현황  -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li> 
					<li class="alert-wrap bell">
					   <span class="alert-bell"><img class="company-img" alt="" src="../images/main/alarm-bell.png"></span>
					   <div id='alert-NoContent' class="alertContWrap">현재 관심등록한 기업의 채용공고가 없습니다.</div>	
					 </li>		
					 <li class="alert-wrap msg">  
					   <a href="/Pickme/e_apply/inMsg.do"><img alt="" src="../images/main/message.png" width="20px" height="20px"></a>    
					</li>
					<li>
						<a href="/Pickme/a_mypage/profile.do"><%=userName %> 님 </a><!-- 일반회원 마이페이지 -->
					</li>
					<li><a href="/Pickme/login/logout.do">로그아웃</a></li>
				</ul>
		 		 <%
		 		 // 기업회원 로그인일때
		 	 } else if( company != null ){
				 %>
				 <nav class="gnb">
					<a href="/Pickme/searchPeople/searchPeopleIntro.do">인재탐색</a> <!-- 기업회원 인재탐색  -->
					<a href="/Pickme/c_apply/cApplyMain.do">지원현황</a><!-- 기업 회원 지원현황  -->
					<a href="javascript:goPageRec('now');">채용관리</a><!-- 채용공고   -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li class="alert-wrap msg">
					   		<a href="/Pickme/c_apply/cRcvMsg.do"><img alt="" src="../images/main/message.png" width="20px" height="20px"></a> 
					   		
					</li>
					<li>
						<!-- 기업회원 마이페이지 -->
						<a href="/Pickme/c_mypage/goCMypage.do">[기업] <%=userName %> </a>
					</li>
					<li><a href="/Pickme/login/company/logout.do">로그아웃</a></li>
				</ul>
				 <%
				 // 비로그인 시
			 } else {
				 %>
				 <nav class="gnb">
					<a href="/Pickme/searchJob/recSearch.do">채용탐색</a> <!-- 일반회원 채용탐색  -->
					<a href="/Pickme/login/memLogin.do">이력서</a><!-- 일반회원 이력서쓰기  -->
					<a href="/Pickme/login/memLogin.do">지원현황</a><!-- 비로그인 -> 로그인 페이지로 -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
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
				
