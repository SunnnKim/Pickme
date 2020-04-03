<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String durl = request.getServletPath();  
/* System.out.println("durl:"+durl); */
%>


<!-- recruit -->
<% 
if (durl.contains("recruit")){
%>
<ul class="depth02 clfix">
	<li ><a href="getRequestList.do">지원자 관리</a></li>
	<li class=<%= durl.contains("c_message.jsp") ? " on" :" "%>>
		<a href="c_message.do">메시지함</a>
	</li>
	<li><a href="">이력서 열람요청</a></li>
</ul>
<%
}	
%>	

<!-- 기업 로그인 페이지  -->
<% 
if (durl.contains("/login")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("comLogin.jsp") ? " on" :" "%>>
		<a href="comLogin.do">기업로그인</a>
	</li>
	<li class=<%= durl.contains("comJoin.jsp") ? " on" :" "%>>
		<a href="comJoin.do">기업회원가입</a>
	</li>
</ul>
<%
}	
%>	



<!-- apply  -->
<%
if( durl.contains("apply")){
%>
<ul class="depth02 clfix">
	<li class=<%= durl.contains("CvReq")? " on" : " " %>>
		<a href="curCvReq.do">열람요청보기</a>
	</li>
	<li class=<%= durl.contains("Msg") ? " on" :" "%>>
		<a href="inMsg.do">메시지함</a>
	</li>
	<li class=<%= durl.contains("AList")? " on" : " "%>>
	  <a href="curAList.do">나의지원내역</a>
	</li>
</ul>

<%} %>

