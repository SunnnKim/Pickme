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

<!--  apply - 지원 현황 -->
<% if(ifurl.contains("e_apply")){%>
	지원현황
<% }%>

<!--  recruit - 채용등록 -->
<% if(ifurl.contains("/recruit/recInsert")){%>
	채용등록
<% }%>

<!--  searchJob - 채용탐색 -->
<% if(ifurl.contains("/searchJob/recSearch")){%>
	채용탐색
<% }%>


