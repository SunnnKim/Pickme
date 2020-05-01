<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>

<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li><a href="cRcvMsg.do" >받은 메시지</a></li>
	<li class="active"><a href="cSendMsg.do" >보낸 메시지</a></li>
	<li><a href="cImpoMsg.do" >중요 메시지</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" id="_keyword" name="sKeyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="${sKeyword }">
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>

	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt"> 총 <span>${totalRecordCount }</span>개</div>
		<div class="bbs-rt">
		     <a href="unread.do?page=cRcvMsg.do"></a>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs msg mt10">
		<jsp:useBean id="paging" class="pickme.com.a.util.EApplyUtil"/>
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 45%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkall"></th>
					<th>내용</th>
					<th>수신자</th>
					<th>발신일</th>
					<th>수신확인</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty sendMsglist }">
			<tr>
				<c:if test="${sKeyword != null }">
					<td colspan="5">찾으시는 메시지가 없습니다</td>
				</c:if>
				<c:if test="${sKeyword == null}">
					<td colspan="5">보낸 메시지가 없습니다</td>
				</c:if>
				</tr>
			</c:if>
				<c:forEach items="${sendMsglist }" var="sendMsg" varStatus="vs">
				<c:set var="content" value="${sendMsg.content }" />
				<c:set var="sdate" value="${sendMsg.sdate }" />
					<tr><!-- 중요메시지 표시 -->
					<td><input type="checkbox" name="checkRow" value="${sendMsg.seq }"></td>
					<td>
						<a href="msgDetail.do?msgSeq=${sendMsg.seq }&page=cSendMsg&pageNumber=${pageNumber}&unread=0">
							<span style="text-align:left;">
								<%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%>
							</span>
						</a>
					</td>
					<td> ${ sendMsg.name } <input type="hidden" id="_seq" value="${ sendMsg.seq}"></td>
					<td>${sendMsg.sdate }</td>
						
						<td>	
							<c:if test="${ sendMsg.open == 0 }" >
								<span>읽지않음</span>
									
							</c:if>
							<c:if test="${sendMsg.open == 1 }">
								<span>읽음</span>	
							</c:if>
						</td>
						
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btn-message clfix">
		<button type="button" onclick="deleteAction()">선택삭제</button>
	</div>

	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/c_apply/paging.jsp" flush="false">
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
		var checkRow = "";
		$("input[name='checkRow']:checked").each(function() {
			checkRow = checkRow + $(this).val() + ",";
		});
		checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		
		if (checkRow == '') {
			//alert("삭제 할 대상을 선택하세요.");
			Swal.fire({
			  icon : 'question',
			  text : '삭제 할 대상을 선택하세요',
			  confirmButtonColor: '#4f6eff'
			})
			return false;
		}
		// console.log("### checkRow => {}" + checkRow);
		
		// alert(seqArray.length);
		
		/* 
		if(checkRow.length == 0){
			alert("삭제하실 내역이 없습니다");
			return false;
		}
 		*/

 		Swal.fire({
			  //title: '선택 된 메시지를 삭제 합니다',
			  text : '선택 된 메시지를 삭제 합니다',
			  //text: "* 주의 : 요청 목록도 함께 삭제 됩니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#4f6eff',
			  cancelButtonColor: '#ff7373',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
				if(result.value) {

					$.ajax({
						url : 'deleteMsg.do',
						type : 'POST',
						data : { "checkRow" : checkRow },
						/* dataType  : "String", */
						success : function(deleteCount) {
							//alert("success : " + result );
							if(deleteCount != null) {
								//alert(deleteCount + "개가 삭제 되었습니다");
								var sKeyword = '<c:out value="${sKeyword}"/>';
								var pn = <c:out value="${pageNumber}"/>;

								var totalRecordCount = <c:out value="${totalRecordCount }"/>;
								var recordCountPerPage = <c:out value="${recordCountPerPage }"/>;
								var screenEndPageIndex = $('.paging > ul > li').last().text();
								//alert(screenEndPageIndex)
								
								/* 마지막 페이지에 글이 하나일때, 그 글을 삭제하면 앞페이지로 전송 */
								if( (pn+1) == screenEndPageIndex ) {	// 현재 페이지가 마지막 페이지 일 때 
									//alert('totalRecordCount % recordCountPerPage:'+totalRecordCount % recordCountPerPage)
									if( deleteCount == (totalRecordCount % recordCountPerPage)){
										pn = pn - 1;
									}else if( (totalRecordCount % recordCountPerPage) == 0 && deleteCount == 10 ){
										pn = pn - 1;
									}
								}
								if (pn < 0) pn = 0;
								//alert("pn  : "  + pn);
								
								if (result.value) {
								    Swal.fire(
								      '삭제 완료',
								      deleteCount +'개의 항목이 삭제 되었습니다.',
								      'success'
								    ).then( (result) => {
								    	location.href="cSendMsg.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
								    })
								}
							}
						},
						error:function(request,status,error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
						}
					})
				} else {
					/* 취소 했을 때 */					
				}
			}) /* Swal.fire end */
	}

	/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
		
	  location.href="cSendMsg.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
	}

	function searchAction() {
	//	alert("검색 버튼 클릭");
		
		var sKeyword = ($("#_keyword").val()).trim();
			
		//	alert("sKeyword: " + sKeyword );
			
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else{
			 location.href="cSendMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}

	}	
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
