<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<!-- 
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="cApplyList.do">현재공고</a></li>
	<li><a href="">지난공고</a></li>
</ul>
 -->

<!-- allList -->

<div id="allList" data-tab-content="" class="active">
	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 35%">
				<col style="width: 20%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th>이미지</th>
					<th>이름</th>
					<th>이력서 제목</th>
					<th>지원날짜</th>
					<th>열람여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cApplyList }">
					<tr>
						<td colspan="5">지원자가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach items="${cApplyList }" var="dto" varStatus="vs">
					<tr>
						<td>
							<a href="#none" style="text-align: center"> 
								<img src="filedownload.do?filename=${dto.profilename }&filepath=/upload/recruit/"  style="width: 90px;"	alt="프로필사진">
							</a>
						</td>
						<td><a href="#none" style="text-align: center"> ${dto.memName } </a></td>
						<td><a href="#none" style="text-align: center"> ${dto.cvName } </a></td>
						<c:set var="aDate" value="${dto.aDate }"/>
						<td>${fn:substring(aDate,0,16) }</td>
						<c:if test="${dto.open == 0 }"><td>미열람</td></c:if>
						<c:if test="${dto.open == 1 }"><td>열람</td></c:if>		
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
<!-- // allList -->


<!-- // allList -->


<script>
/* 페이지 이동 */
 
//var seq = '${sessionScope.logincompany.seq}';
function goPage(pn){	

	 location.href="cApplyMain.do?&pageNumber=" + pn;
	
}

function cApply_list() {
	location.href="cApplyList.do"
}

</script>


<!-- subCont 끝 -->


<%@include file="/include/footer.jsp"%>
