<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

if (ifurl.contains("aboutus.jsp")){
%>
<h2>ABOUT US</h2>
<%
}	
%>

<!-- exhibit -->
<% 
if (ifurl.substring(8).contains("exhibit")){
%>
<h2 id="ex-title" >현재전시</h2>
<%
}else{%>
	<h2 id="ex-title"></h2>
<%
}
%>		

<!-- schedule -->
<% 
if (ifurl.contains("schedule.jsp")){
%>
<h2>SCHEDULE</h2>
<%
}	
%>	

<!-- community -->
<% 
if (ifurl.contains("faq.jsp")){
%>
<h2>FAQ</h2>
<%
}	
%>	

<% 
if (ifurl.contains("notice.jsp")){
%>
<h2>NOTICE</h2>
<%
}	
%>	

<% 
if (ifurl.contains("review.jsp")){
%>
<h2>리뷰보기</h2>
<%
}	
%>	

<!-- member -->
<% 
if (ifurl.contains("login.jsp")){
%>
<h2>LOGIN</h2>
<%
}	
%>

<% 
if (ifurl.contains("join.jsp")){
%>
<h2>JOIN</h2>
<%
}	
%>
<!-- Reservation -->
<% 
if (ifurl.contains("reserv.jsp")){
%>
<h2>예매하기</h2>
<%
}   
%>
	



