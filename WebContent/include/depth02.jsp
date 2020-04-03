<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String durl = request.getServletPath();  
System.out.println("durl:"+durl);
%>


<!-- recruit -->

<% if (durl.contains("c_apply")){ %>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("recruitList.jsp") ? " on" :" "%>>
		<a href="">지원자 관리</a>
	</li>
	<li class=<%= durl.contains("c_message.jsp") ? " on" :" "%>>
		<a href="c_message.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("requestList.jsp") ? " on" :" "%>>
		<a href="getRequestList.do">이력서 열람 요청</a>
	</li>
</ul>
<% } %>	
