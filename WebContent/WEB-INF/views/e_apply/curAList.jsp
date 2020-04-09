<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="curAList.do" >현재지원내역</a></li>
	<li><a href="pastAList.do">지난지원내역</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text"  id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>
	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt"> 총 <span>${totalRecordCount }</span>개</div>
		<div class="bbs-rt"><p class=cancel-notice>※담당자 확인 후에는 지원을 취소하실 수 없습니다.</p></div>
	</div>
	<!-- 리스트 -->
	<div class="table-col table-bbs cur mt10">
		<table >
			<caption>전체</caption>
			<colgroup>
				<col style="width: 100px">
				<col style="width: 400px">
				<col style="width: 150px">
				<col style="width: 180px">
				<col style="width: 140px">
				<col style="width: 180px">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>기업명</th>
					<th>지원일</th>
					<th>채용마감일</th>
					<th>담당자확인</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty myApplyList }">
				<tr>
				<c:if test="${sKeyword != null }">
					<td colspan="5">찾으시는 지원내역이 없습니다</td>
				</c:if>
				<c:if test="${sKeyword == null }">
					<td colspan="5">지원하신 내역이 없습니다</td>
				</c:if>
				</tr>
			</c:if>
			
			<c:forEach items="${myApplyList }" var="myApply" varStatus="vs">
			<c:set var="adate" value="${myApply.adate }"/>
				<tr >
					<td>${vs.index + 1 }</td>
					<td><a href="채용공고페이지로" title="채용공고 페이지로 이동" style="text-align:center;">${myApply.name }</a></td>
					<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("adate").toString())%></td>
					<td>${myApply.edate }</td>
					<c:if test="${myApply.open == 0 }">
					<td>
						<span>미확인</span>
					</td>
					<td><button class="applyDelBtn" onclick="cancelApply(${myApply.seq})">지원취소</button></td>	
					</c:if>
					<c:if test="${myApply.open == 1 }">
					<td>
						<span>확인</span>
						</td>
					<td><span style="color:red;">취소불가</span></td>
					</c:if>
					
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div><!-- 페이징 -->
<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/e_apply/paging.jsp" flush="false">
			<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
		</jsp:include>
	</div><!-- // paging_wrap -->

</div>
<!-- // allList -->

<script>
	
	function cancelApply(seq){
		Swal.fire({
		  title: '지원취소하시기를 원하십니까?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'돌아가기',
		  confirmButtonText: '지원취소'
		}).then((result) =>{
		  if (result.value) {
			  $.ajax({
					url        : "cancelApply.do",
					dataType   : "json",
					type       : "post",
					data       : {"seq" : seq },
					success    : function(data){
						
						if(data != null){
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '취소되었습니다!',
								  showConfirmButton: false,
								  timer: 1000
							}).then( (result) =>{

							  var sKeyword = '<c:out value="${sKeyword}"/>';
							  var pn = '<c:out value="${pageNumber}"/>'
							
							location.href="curAList.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
							});
						}
					},
					error      : function(request, status, error){
						alert("error");
					}
				});	
		  }
		});
		
	}

	

	
		/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
		
	  location.href="curAList.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
	}
	
	/* 검색 */
	function searchAction() {
		var sKeyword =($("#_keyword").val()).trim();
		
		//	alert("sKeyword: " + sKeyword );
			if(sKeyword == null || sKeyword == ""){
				alert("검색어를 입력해주세요.");
			}else{
			 location.href="curAList.do?sKeyword=" + sKeyword +"&pageNumber=0";
			}	
		}
		
		$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

		
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>



















