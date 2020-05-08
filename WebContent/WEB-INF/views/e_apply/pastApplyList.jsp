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
		<li><a href="curApplyList.do" >현재지원내역</a></li>
		<li class="active"><a href="pastApplyList.do">지난지원내역</a></li>
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
	
	<!-- 리스트 -->
		<div class="table-col table-bbs past mt10">
			<table>
				<caption>전체</caption>
				<colgroup>
					<col style="width: 5%">
					<col style="width: 10%">
					<col style="width: 25%">
					<col style="width: 20%">
					<col style="width: 20%">
					<col style="width: 15%">
					<col style="width: 10%">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="checkall"></th>
						<th>기업명</th>
						<th>지원직무</th>
						<th>지원일</th>
						<th>채용마감일</th>
						<th>담당자확인</th>
						<th>삭제여부</th>
					</tr>
				</thead>
				<tbody>
				   <c:if test="${empty myPastApplyList }">
						<tr>
						<c:if test="${not empty sKeyword}">
							<td colspan="7">검색결과가 없습니다</td>
						</c:if>
						<c:if test="${empty sKeyword }">
							<td colspan="7">지난지원내역이 없습니다</td>
						</c:if>
						</tr>
				</c:if>
				<c:forEach items="${myPastApplyList }" var="myPastApply" varStatus="vs">
				<c:set var="adate" value="${myPastApply.adate }"/>
					<tr>
						<td><input type="checkbox" name="checkRow" value="${myPastApply.seq  }"></td>
						<td><a href="0/Pickme/c_mypage/goCMypage.do?sentSeq=${myPastApply.comSeq}">${myPastApply.comName }</a></td>
						<td>${myPastApply.comJob2 }</td>
						<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("adate").toString())%></td>
						<td>${myPastApply.edate }</td>
						<c:if test="${myPastApply.open == 0 }">
						<td>
							<span>미확인</span>
						</td>	
						</c:if>
						<c:if test="${myPastApply.open == 1 }">
						<td>
							<span>확인</span>
						</td>
						</c:if>
						<td><button class="applyDelBtn" onclick="delApply(${myPastApply.seq})">삭제</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="btn-apply clfix">
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

		// 체크박스 전체 체크
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		});
		
		function delApply(seq){
			Swal.fire({
			  title: '정말 삭제 하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'돌아가기',
			  confirmButtonText: '삭제'
			}).then((result) =>{
				
			  if (result.value) {
				  var seqArray = [];
					 seqArray.push(seq);
				  
				  $.ajax({
						url        : "delApply.do",
						dataType   : "json",
						type       : "post",
						traditional: true, // array보낼때 필요
						data       : {"seqArray" : seqArray},
						success    : function(data){
							
							if(data != null){
		
								Swal.fire({
									  position: 'center',
									  icon: 'success',
									  title: '삭제되었습니다!',
									  showConfirmButton: false,
									  timer: 1000
								}).then( (result) =>{
									  var sKeyword = '<c:out value="${sKeyword}"/>';
									  var pn = '<c:out value="${pageNumber}"/>'
									
									location.href="pastApplyList.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
								})
							}
						},
						error      : function(request, status, error){
							alert("error");
						}
					});	
			      }
			    });
			
		    }
		
				/* 선택 삭제(체크박스된 것 전부) */
			function deleteAction() {
				// 삭제할 seq 넣을 배열 선언
				var seqArray = [];
				$("input[name='checkRow']:checked").each(function() {
					// 배열에 집어넣기
					seqArray.push($(this).val());
				
				});
				
				if (seqArray == null || seqArray.length == 0) {
					Swal.fire({
						  title: '',
						  text: "삭제하실 대상을 선택하세요",
						  icon: 'warning',
						  showCancelButton:false,
						  timer: 1500

					});	  
					return false;
				}
	
				
	
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
							url        : "delApply.do",
							dataType   : "text",
							type       : "post",
						    traditional: true, // array보낼때 필요
							data       : {"seqArray" : seqArray },
							success    : function(data){
	
								if(data != null){
										
									 Swal.fire({
										position: 'center',
								    	icon: 'success',
									    title: '삭제되었습니다!',
									    showConfirmButton: false,
									    timer: 1000
									 }).then((reslut)=>{
								    	  var sKeyword = '<c:out value="${sKeyword}"/>';
										  var pn = '<c:out value="${pageNumber}"/>'
										
										location.href="pastApplyList.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
										
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
		
			/* 페이지 이동 */
			function goPage(pn){
			  	var sKeyword = '<c:out value="${sKeyword}"/>';
			 	 location.href="pastApplyList.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
				
			}
	
		
			/* 검색 */
			function searchAction() {
				var sKeyword =($("#_keyword").val()).trim();

				if(sKeyword == null || sKeyword == ""){
					alert("검색어를 입력해주세요.");
				}else{
				 location.href="pastApplyList.do?sKeyword=" + sKeyword +"&pageNumber=0";
				}	
			}
				
			$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });
	
			

	</script>


<%@include file="/include/footer.jsp"%>
