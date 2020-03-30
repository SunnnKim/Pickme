<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="model.CMemberMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% CMemberMypageDto dto = (CMemberMypageDto)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>index2</h1>
<h3> <%=dto %> </h3>
<% System.out.println(dto.toString()); %>

<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
String payDate = dto.getPayDate();
String requestDate = dto.getRequest_date();
String refundDate = dto.getRefund_date();
out.println(sdf.format(payDate));
%>
</body>
</html>