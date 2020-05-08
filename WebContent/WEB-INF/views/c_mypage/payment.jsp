<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>    

<!-- 현재시간 Date형식으로 변환 (today) -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="todayStr" value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />

<fmt:parseDate var="todayString" value="${todayStr }" pattern="yyyy-MM-dd HH:mm:ss" />
<fmt:formatDate var="today" value="${todayString }" pattern="yyyy-MM-dd HH:mm:ss" />

<!-- endDate date형식으로 변환 (endDate2) -->
<fmt:parseDate var="endDateString" value="${endDate }" pattern="yyyy-MM-dd HH:mm:ss" />


<div class="allWrap">

<!-- 한번도 이용한 적이 없는 경우 -->
<c:if test = "${empty list }">
   현재 이용중인 서비스가 없습니다.
   <div class="allWrapDetail">
      합리적인 가격으로 최대의 혜택을 누리세요.
      <div class="buttonCls">
         <button type="button" onclick="goPage()"> 서비스 둘러보기 </button>
      </div>
   </div>
</c:if>

<!-- 이용내역이 존재하며, 현재 이용중인 서비스가 있는 경우 -->
<c:if test = "${not empty list && recentDto ne null }">
    <div class="previous">
    	<label> 현재 <span> ${serviceName } </span> 서비스를 이용중입니다. </label>
    	
    	<hr>
       <div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col>
				<col>
				<col>
				<col style="width: 120px">
			</colgroup>
			<thead>
				<tr>
					<th>서비스</th>
					<th>결제일</th>
					<th>만료일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="result" items="${list }">
				<tr>
					<td><c:out value="${result.serviceName }" /></td>
					<td><c:out value="${result.payDate}" /></td>
					<td><c:out value="${result.endDate }" /></td>
					<td>
						<c:choose>
							<c:when test="${today le result.endDate and result.refund eq 0}">
								<span style="color:#ff0000">이용중</span>
							</c:when>
							<c:when test="${today gt result.endDate or result.refund eq 1}">
								<span>만료</span>
							</c:when>
						</c:choose>
					</td>
				</tr>
					</c:forEach>
			</tbody>
		</table>
	   </div>
       
       <div class="previous_refundButton"><button onclick="refundPage(${logincompany.seq})"> 서비스 철회하기 </button></div>
    </div>
</c:if>

<!-- 이용내역이 존재하며, 현재 이용중인 서비스가 없는 경우 -->

<c:if test = "${not empty list && recentDto eq null }">
	<div class="previous">
		<label> 이전 결제 내역 </label>
		
		
		<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col>
				<col>
				<col>
				<col style="width: 120px">
			</colgroup>
			<thead>
				<tr>
					<th>서비스</th>
					<th>결제일</th>
					<th>만료일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="result" items="${list }">
				<tr>
					<td><c:out value="${result.serviceName }" /></td>
					<td><c:out value="${result.payDate}" /></td>
					<td><c:out value="${result.endDate }" /></td>
					<td>
						<c:choose>
							<c:when test="${today le result.endDate and result.refund eq 0}">
								<span style="color:#ff0000">이용중</span>
							</c:when>
							<c:when test="${today gt result.endDate or result.refund eq 1}">
								<span>만료</span>
							</c:when>
						</c:choose>
					</td>
				</tr>
					</c:forEach>
			</tbody>
		</table>
	   </div>
		<div class="buttonCls"><button onclick="goPage()"> 서비스 둘러보기 </button></div>
		
	</div>
</c:if>



</div>



<script>
   function goPage() {
      location.href="/Pickme/customer/paidService.do"
}

   // 환불페이지 가기
function refundPage( seq ){

	$.ajax({
		url:"/Pickme/admin/payment/checkRefundable.do",
		data: "seq="+seq,
		type:'post',
		success:function (data){
			if( data == true){
				 location.href="/Pickme/c_mypage/refundPage.do?seq=" + seq;
			}else{
				alert('환불할 서비스가 없습니다.')
			}
		}
	})

	   
	  
   }
</script>



<style>
/* 결제 내역 없을 때 화면 */
.allWrap{text-align:center;font-size:30px;margin-top:100px;}
.allWrapDetail{font-size:19px;margin-top:50px;}
.buttonCls button{margin-top:50px; width:200px; height: 50px; color:#fff; background-color:#4f6eff; border-radius:5px 5px 5px 5px;}
.buttonCls button:hover{background-color:#859aff;}
.previous label{margin-top:120px;}
/* .previous p{margin-top:220px;} */
.previous span{color:#4f6eff;}
.previous_refundButton button{margin-top:70px; color:#fff; width:150px; height: 50px; background-color:#4f6eff; border-radius:5px 5px 5px 5px;}
.payTable{border:1px solid gray;}

/* 결제 내역 있을 때 화면 */

</style>


<%@include file ="../../../include/footer.jsp" %>