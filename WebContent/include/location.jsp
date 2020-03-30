<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lourl = request.getServletPath();  //프로젝트의 경로값만 가져옴
// System.out.println(ifurl);

if (lourl.contains("aboutus.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>ABOUT US</span>
</div>
<%
}	
%>

<!-- exhibit -->
<% 
if (lourl.contains("exhibit")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>EXHIBIT</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span id="loc_depth02">현재전시</span>
</div>
<%
}	
%>


<!-- schedule -->
<% 
if (lourl.contains("schedule.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>SCHEDULE</span>
</div>
<%
}	
%>	

<!-- community -->
<% 
if (lourl.contains("notice.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>공지사항</span>
</div>
<%
}	
%>

<% 
if (lourl.contains("faq.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>자주하는 질문</span>
</div>
<%
}	
%>	

<% 
if (lourl.contains("review.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>COMMUNITY</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>공지사항</span>
</div>
<%
}	
%>	


<!-- member -->
<% 
if (lourl.contains("login.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>MEMBER</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>LOGIN</span>
</div>
<%
}	
%>	

<% 
if (lourl.contains("join.jsp")){
%>
<div class="location">
	<span>HOME</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>MEMBER</span>
	<img src="../images/sub/lo_arrow.jpg" alt=">">
	<span>회원가입</span>
</div>
<%
}	
%>	

<!-- Reservation -->
<% 
if (lourl.contains("reserv.jsp")){
%>
<div class="location">
   <span>HOME</span>
   <img src="../images/sub/lo_arrow.jpg" alt=">">
   <span>RESERVATION</span>
   <img src="../images/sub/lo_arrow.jpg" alt=">">
   <span>예매하기</span>
</div>
<%
}   
%>