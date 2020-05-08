<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width= 1050px, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Pick me 관리자</title>
<link rel="icon" href="/Pickme/images/main/pickme.ico" sizes="32x32">
<!-- 
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css"> <!-- 디자인 CSS -->
<link rel="stylesheet" href="/Pickme/css/adminmember.css" type="text/css"> <!-- 디자인 CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css" crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script><!-- font-awesome -->
<!-- JQuery -->
 <script src="/Pickme/js/jquery/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<!-- Kendo-Grid --> 
<link rel="stylesheet" href="/Pickme/js/chartist/chartist.css" crossorigin="anonymous"/>
<script src="/Pickme/js/chartist/chartist.js" crossorigin="anonymous"></script>
<!-- (cdn) -->
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2020.1.406/styles/kendo.common.min.css" crossorigin="anonymous">
<script src="https://kendo.cdn.telerik.com/2020.1.406/js/kendo.all.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2020.1.406/styles/kendo.rtl.min.css" crossorigin="anonymous">
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2020.1.406/styles/kendo.default.min.css" crossorigin="anonymous">
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2020.1.406/styles/kendo.mobile.all.min.css" crossorigin="anonymous">
<script src="https://kendo.cdn.telerik.com/2020.1.406/js/angular.min.js" crossorigin="anonymous"></script>
<script src="https://kendo.cdn.telerik.com/2020.1.406/js/jszip.min.js" crossorigin="anonymous"></script>
<!-- // kendo -->

</head>
<body>
<div id="wrap">
  <header>
    <div class="inner clfix">
      <strong class="logo"><a href="#none">PICK ME</a></strong>
      <nav class="gnb" style="width: 700px; margin-left: 50px; padding-left:0">
        <a href="/Pickme/admin/adminMember.do">회원관리</a>
        <a href="/Pickme/admin/adminCompany.do">기업관리</a>
        <a href="/Pickme/admin/notice/noticeList.do">공지사항</a>
        <a href="/Pickme/admin/payment/paidServiceView.do">유료서비스</a>
        <a href="/Pickme/admin/question/questionList.do">문의내역</a>
        <a href="/Pickme/admin/manageResume.do">이력서/공고관리</a>
      </nav><!-- // gnb -->
      <ul class="header_infoBtn clfix">
        <li></li>
        <li>관리자모드</li>
      </ul>
    </div><!-- // inner -->
  </header><!-- // header -->
  
  <div id="sub-container" style="background: #eaeaea">
    <div class="inner">
      <div class="subTit">
        <h2 class="pageTit" style="color:#333"><%@include file="./title01.jsp" %></h2>
        <%@include file="./depth2.jsp" %>
      </div><!-- // subTit -->

      <div class="subCont">