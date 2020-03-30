<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>recruit. test.jsp</h1>
<table style="width: 85%">
<colgroup>
	<col style="width: 70px">
	<col style="width: auto">
	<col style="width: 100px">	
</colgroup>

<thead>
	<tr>
		<th>번호</th><th>지원자</th><th>요청일</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty requestList }">	<!-- bbslist가 비었을때 -->
	<tr>
		<td colspan="3"> 작성된 글이 없습니다 </td>
	</tr>
	</c:if>
	
	<c:forEach items="${requestList }" var="request" varStatus="vs">			
		<tr>
			<td>${vs.count }</td>
			<td style="text-align:left;">
				
				<c:if test="${request.del==0 }">
					<a href="bbsdetail.do?seq=${request.seq }">${request.comment }</a>
				</c:if>
				<c:if test="${request.del==1 }">
					<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font> 
				</c:if>		
			</td>
			<td>${request.rdate }</td>
		</tr>	
	</c:forEach>
	
	
</tbody>

</table>


</body>
</html>