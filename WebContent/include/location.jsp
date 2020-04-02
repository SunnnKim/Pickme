<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lourl = request.getServletPath();  //프로젝트의 경로값만 가져옴
// System.out.println(ifurl);
%>


<!-- recruit - 구인 현황  -->
<% if (lourl.contains("c_message.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>구인 현황</span>
	<span>></span>
	<span>메세지함</span>
</div> 
<% } %>

<!-- 기업로그인 페이지 -->
<% if (lourl.contains("/login/")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>기업서비스</span>
	<span>></span>
<% if(lourl.contains("comLogin.jsp")){
	%>
		<span>기업로그인</span>
	<%
	}else if(lourl.contains("comJoin.jsp")){
		%>
		<span>기업회원가입</span>
		<%
	}
%>
</div>
<% } %>

<!--  -->
