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

<!-- 기업로그인  서비스 -->
<% if(ifurl.contains("/login/mem")){
%>
회원서비스 
<% } %>
<!-- 일반로그인 서비스 -->
<% if(ifurl.contains("/login/com")){
%>
기업서비스 
<% } %>

<!--  apply - 지원 현황 -->
<% if(ifurl.contains("e_apply")){%>
	지원현황
<% }%>

