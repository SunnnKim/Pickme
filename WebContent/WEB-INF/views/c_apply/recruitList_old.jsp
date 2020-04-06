<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file ="/include/header.jsp" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="profile-wrap">
<table border="1" style="width: 100%">

<thead>
	<tr>
		<th>번호</th>
		<th>지원자</th>
		<th>요청일</th>
		<th>수락여부</th>
		<th>상태</th>
		<th>관심 지원자</th>
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
			
			<td style="text-align:left;">	<!-- 지원자 -->				
				<c:if test="${request.del==0 }">
					<a href="bbsdetail.do?seq=${request.seq }">구직자 시퀀스  : ${request.p_seq }</a>
				</c:if>
				<c:if test="${request.del==1 }">
					<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font> 
				</c:if>		
			</td>
			
			<td>	<!-- 요청일 -->
				<fmt:parseDate value='${request.rdate }' var='test' pattern='yyyy-mm-dd HH:mm:ss'/>
				<fmt:formatDate value="${test}" pattern="yyyy년 mm월 dd일 HH시mm분ss초"/>
			</td>
			
			
			<td>	<!-- 수락여부 -->
				<c:if test="${request.accept==0 }">
					<font color="#ff0000">허용</font> 
				</c:if>
				<c:if test="${request.accept==1 }">
					<font color="#ff0000">거부</font> 
				</c:if>
				<c:if test="${request.accept==3 }">
					<font color="#0000ff">대기</font> 
				</c:if>				
			</td>
			
			<td>	<!-- 상태 -->
				<c:if test="${request.accept==0 }">
					<!-- <button type="button">이력서 확인</button> -->
					<input type="button" value="이력서 열람">
				</c:if>
				<c:if test="${request.accept==1 }">
					<font color="#ff0000">거부</font> 
				</c:if>
				<c:if test="${request.accept==3 }">
					<!-- <button type="button">요청취소</button> -->
					<input type="button" value="요청취소">
					<!-- <font color="#0000ff">요청취소</font> --> 
				</c:if>		
			</td>
			
			<td>	<!-- 관심 지원자 -->
			<%-- 
				<c:if test="${request.accept==0 }">
					<font color="#ff0000">거부</font> 
				</c:if>
				<c:if test="${request.accept==1 }">
					<font color="#ff0000">거부</font> 
				</c:if>
				<c:if test="${request.accept==3 }">
					<!-- <button type="button">요청취소</button> -->
					<input type="button" value="요청취소">
					<!-- <font color="#0000ff">요청취소</font> --> 
				</c:if>		
				 --%>
			</td>
			
		</tr>	
	</c:forEach>
	
	
</tbody>

</table>

<div>
<input>

</div>


</div>



<%@include file ="/include/footer.jsp" %>
