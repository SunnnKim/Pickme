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

<% if (lourl.contains("requestList.jsp")) {%>
<div class="location">
	<span>홈</span>
	<span>></span>
	<span>구인 현황</span>
	<span>></span>
	<span>이력서 열람 요청</span>
</div>
<% } %>
