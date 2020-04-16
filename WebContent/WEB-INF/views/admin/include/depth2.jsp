<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String durl = request.getServletPath();  
System.out.println("durl:"+durl);
%>
    
<% if( durl.contains("adminMember") ){
	%>
		<ul class="depth02 clfix">
			<li class=<%= durl.contains("adminMember.jsp") ? " on" :" "%>> 
				<a href="adminMember.do">일반회원관리</a>
			</li>
			<li class=<%= durl.contains("adminMemberWithdrawal.jsp") ? " on" :" "%>> 
				<a href="withdrawal.do">탈퇴관리</a>
	        </li>
		</ul><!-- // depth02 -->
<% } %>
<!-- 기업관리쪽 -->
<% if( durl.contains("company") ){
	%>
		<ul class="depth02 clfix">
			<li class=<%= durl.contains("companyMember.jsp") ? " on" :" "%>> 
				<a href="adminCompany.do">기업회원관리</a>
			</li>
			<li class=<%= durl.contains("companyApproval.jsp") ? " on" :" "%>> 
				<a href="#">가입승인</a>
	        </li>
			<li class=<%= durl.contains("companyWithdrawal.jsp") ? " on" :" "%>> 
				<a href="comWithdrawal.do">탈퇴관리</a>
	        </li>
		</ul><!-- // depth02 -->
<% } %>

<!-- 공지사항 -->
<% if( durl.contains("notice") ){
	%>
		<ul class="depth02 clfix">
			<li class=<%= durl.contains("noticeList.jsp") ? " on" :" "%>> 
				<a href="noticeList.do">공지목록</a>
			</li>
			<li class=<%= durl.contains("noticeWrite.jsp") ? " on" :" "%>> 
				<a href="noticeWrite.do">공지등록</a>
	        </li>
		</ul><!-- // depth02 -->
<% } %>