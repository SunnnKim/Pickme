<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li><a href="curCvReq.do" >현재요청</a></li>
	<li class="active"><a href="pastCvReq.do">지난요청</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<c:if test="${not empty sKeyword}">
			<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="" value="${sKeyword }">
			</c:if>
			<c:if test="${empty sKeyword}">
			<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			</c:if>
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>

	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt"> 총 <span>${totalRecordCount }</span>개</div>
		<div class="bbs-rt"><p class=cancel-notice></p></div>
	</div>

<!-- all list -->
<div class="table-col table-bbs mt10">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 5%">
				<col style="width: 15%">
				<col style="width: 40%">
				<col style="width: 15%">
				<col style="width: 10%"> 
				<col style="width: 15%"> 
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkall"></th>
					<th>기업명</th>
					<th>COMMENT</th>
					<th>요청일</th>
					<th>수락여부</th>
					<th>열람여부</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty pastCvReqList }">
				<tr>
				<c:if test="${not empty sKeyword}">	
					<td colspan="6">검색결과가 없습니다</td>
				</c:if>				
				<c:if test="${empty sKeyword }">
					<td colspan="6">요청내역이 없습니다 </td>
				</c:if>
			</c:if>
			<c:forEach items="${pastCvReqList }" var="pastCvReq" varStatus="vs">
			<c:set var="rdate" value="${pastCvReq.rdate }"/>
				<tr>
					<td><input type="checkbox" name="checkRow" value="${pastCvReq.seq }"></td>
					<td><a href="/Pickme/c_mypage/goCMypage.do?sentSeq=${pastCvReq.cSeq }" style="text-align:center;">${pastCvReq.name }</a></td>
					<td>${pastCvReq.comment }</td>
					<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("rdate").toString())%></td>
				<!-- 수락여부 및 열람여부 확인 -->
				<c:if test="${pastCvReq.accept eq 1}">
					<td>
						<span class="req-response accept">
							<img alt="수락" src="<%=request.getContextPath()%>/images/sub/accept.png" style="width:15px;height:15px;">
						</span>
					</td>
					<td>
					<c:if test="${pastCvReq.open eq 0}">
						미열람 
					</c:if>
					<c:if test="${pastCvReq.open eq 1}">
						열람 
					</c:if>
					</td>	
				</c:if>
				<c:if test="${pastCvReq.accept eq 2}">	
					<td>
						<span class="req-response reject">
							<img alt="거절" src="<%=request.getContextPath()%>/images/sub/reject.png">	
						</span>
					</td>
					<td> - </td>
				</c:if>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div><!-- // table-col close -->
	<div class="cvreq-DelBtn clfix">
		<button type="button" style="float: left;" onclick="deleteAction()">선택삭제</button>
	</div>
	
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
	
	$(document).ready(function() {
		// 체크박스 전체 체크
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		});
	
	});

	/* 선택 삭제(체크박스된 것 전부) */
	function deleteAction() {
		// 삭제할 seq 넣을 배열 선언
		var seqArray = [];
		$("input[name='checkRow']:checked").each(function() {
			// 배열에 집어넣기
			seqArray.push($(this).val());
		
		});
		
		if (seqArray == null) {
			alert("삭제 할 대상을 선택하세요.");
			return false;
		}
		
		if(seqArray.length == 0){
			alert("삭제하실 내역이 없습니다");
			return false;
		}

		if(seqArray != null){
		Swal.fire({
			  title: '선택하신 항목을 삭제하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'취소',
			  confirmButtonText: '삭제'
			}).then((result) =>{
				  if (result.value) {
						$.ajax({
							url        : "deletePastReq.do",
							dataType   : "json",
							type       : "post",
						    traditional: true, // array보낼때 필요
							data       : {"seqArray" : seqArray },
							success    : function(data){
			
								if(data != null){	
									 Swal.fire({
										  icon: 'success',
										  position: 'center',
										  title: '삭제되었습니다!',
										  showConfirmButton: false,
										  timer: 1000	
									 }).then((reslut)=>{
			
								    	  var sKeyword = '<c:out value="${sKeyword}"/>';
										  var pn = '<c:out value="${pageNumber}"/>'
										
										location.href="pastCvReq.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
								    });		
			
								}	 	   	    	
							},
								error      : function(request, status, error){
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
					   });
			      }												
		    });
		  }
	  }

	// 검색하기 
	function searchAction() {
		var sKeyword =($("#_keyword").val()).trim();
		
		//	alert("sKeyword: " + sKeyword );
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else{
	       location.href="pastCvReq.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}	
	}

	// enter키로 검색 
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

	// 페이지이동 
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	  var filter = '<c:out value="${filter}"/>';
		
	  location.href="pastCvReq.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
	}
	
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
