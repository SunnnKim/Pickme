<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

if (ifurl.contains("comLogin")){
%>
<h2>ABOUT US</h2>
<%
}	
%>

<!-- recruit - 구인 현황  -->
<% if (ifurl.contains("c_message.jsp")){ %>
구인 현황
<% } %>	
