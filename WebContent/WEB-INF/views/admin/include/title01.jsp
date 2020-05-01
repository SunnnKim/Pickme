<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String ifurl = request.getServletPath();  //프로젝트의 경로값만 가져옴
 System.out.println(ifurl);

%>
<%
if( ifurl.contains("adminMember")){
	%>회원관리<%
}%>
<%
if( ifurl.contains("company")){
	%>기업관리	<%
}%>
<%
if( ifurl.contains("notice")){
	%>공지사항 관리	<%
}%>

<%
if( ifurl.contains("/payment/")){
	%>유료서비스<%
}%>

<%
if( ifurl.contains("/question/")){
	%>문의내역<%
}%>
  
<%
if( ifurl.contains("/admin/manage")){
	%>이력서/공고 관리 <%
}%>
  