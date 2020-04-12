<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

%>

<!-- c_apply - 구인 현황  -->
<% if (ifurl.contains("c_apply")){ %>
구인 현황
<% } %>	

<!-- 일반로그인 서비스 -->
<% if(ifurl.contains("/login/mem")){
%>
회원서비스 
<% } %>

<!-- 기업 서비스 -->
<% if(ifurl.contains("/login/com")){
%>
기업서비스 
<% } %>

<!-- 이메일 인증페이지 -->
<% if (ifurl.contains("login/validate")){ %>
회원인증
<% } %>	

<!-- 일반 mypage -->
<% if(ifurl.contains("/a_mypage/profile")){%>
프로필
<% }%>


<!--  apply - 지원 현황 -->
<% if(ifurl.contains("e_apply")){%>
지원현황
<% }%>


<!--  recruit - 채용관리 -->
<% if(ifurl.contains("/recruit")){
	 if(ifurl.contains("recInsert.jsp")){ %>
	채용등록
<% } else if(ifurl.contains("recNow.jsp")){ %>
	현재공고
<% } else if(ifurl.contains("recPast.jsp")){ %>
	지난공고
<% } 
}%>

<!--  recruit - 채용등록 -->
<% if(ifurl.contains("/recruit/recInsert")){%>
채용등록
<% }%>


<!--  searchJob - 채용탐색 -->
<% if(ifurl.contains("/searchJob/recSearch")){%>
채용탐색
<% }%>

<!--  c_mypage 기업 마이페이지  -->
<% if(ifurl.contains("c_mypage")){
	 if(ifurl.contains("myPage.jsp")){%>
	<!-- <div id="company-logo"></div> -->
	회사 정보
	<% }else{%>
		마이페이지
<% }}%>

<!-- 기업 페이지 디테일   -->
<%%>
