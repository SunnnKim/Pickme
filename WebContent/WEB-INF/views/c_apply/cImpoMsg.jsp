<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>

<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li id="rcvMsg"><a href="cRcvMsg.do">받은 메시지</a></li>
	<li id="sendMsg"><a href="cSendMsg.do">보낸 메시지</a></li>
	<li id="impoMsg" class="active"><a href="cImpoMsg.do">중요 메시지</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" id="_keyword" name="sKeyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value=${sKeyword }>
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>
	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt"> 
			총 <span>${totalRecordCount }</span>개
		</div>
		<div class="bbs-rt">
			<a href="unread.do?page=cImpoMsg"><p class="unread">안읽은메시지 ${unreadCount }</p></a>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs msg mt10">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 45%">
				<col style="width: 15%">
				<col style="width: 20%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkall"></th>
					<th>중요</th>
					<th>내용</th>
					<th>발신자</th>
					<th>발신일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty impoMsglist }">
					<tr>
						<c:if test="${unreadCount == 0 && isUnread != null}">
							<td colspan="5">안읽으신 메시지가 없습니다</td>
						</c:if>
						<c:if test="${sKeyword != null }">
							<td colspan="5">찾으시는 메시지가 없습니다</td>
						</c:if>
						<c:if test="${sKeyword == null && isUnread == null}">
							<td colspan="5">받은 메시지가 없습니다</td>
						</c:if>
					</tr>
				</c:if>

				<c:forEach items="${impoMsglist }" var="cImpoMsg" varStatus="vs">
					<c:set var="content" value="${cImpoMsg.content }" />
					<tr>
						<td><input type="checkbox" name="checkRow" value="${cImpoMsg.seq }"></td>
						<!-- 중요메시지 표시 -->
						<td class="star-td">
							<c:if test="${ cImpoMsg.important == 0 }">
								<i class="fas fa-star"> 
									<input type="hidden" value="${cImpoMsg.seq }">
								</i>
							</c:if> 
							
							<c:if test="${ cImpoMsg.important == 1 }">
								<i class="fas fa-star on"> 
									<input type="hidden" value="${cImpoMsg.seq }">
								</i>
							</c:if>
						</td>
						<!-- 메시지내용 안읽은경우 굵은글씨 -->
						<td>
							<c:if test="${ cImpoMsg.open == 0 }">
								<c:if test="${isUnread != null }">
									<a href="msgDetail.do?msgSeq=${cImpoMsg.seq }&page=cImpoMsg&pageNumber=${pageNumber}&unread=1">
										<span class="unread-msg">
											<%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%>
										</span>
									</a>
								</c:if>
								<c:if test="${isUnread == null }">
									<a href="msgDetail.do?msgSeq=${cImpoMsg.seq }&page=cImpoMsg&pageNumber=${pageNumber}&unread=0">
										<span class="unread-msg">
											<%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%>
										</span>
									</a>
								</c:if>
							</c:if> 
							<c:if test="${cImpoMsg.open == 1 }">
								<a href="msgDetail.do?msgSeq=${cImpoMsg.seq }&page=cImpoMsg&pageNumber=${pageNumber}&unread=0">
									<span class="read-msg">
										<%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%>
									</span>
								</a>
							</c:if>
						</td>
						
						<td>${cImpoMsg.name } 
							<input type="hidden" id="_seq" value="${cImpoMsg.seq }">
						</td>
						<%-- <td><%=EApplyUtil.todayMsg(pageContext.getAttribute("sdate").toString())%></td> --%>
						<td>${cImpoMsg.sdate }</td>
						

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
	</div>
	<!-- // paging_wrap -->
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

		// 중요메세지 표시
		$('.star-td i').click(function() {
			$(this).toggleClass('on');
			
			 var trNum = ($(this).closest('tr').prevAll().length) + 1;
			//	alert("trNum" + trNum);
			 
				var seq = $('table tr').eq(trNum).find('#_seq').val();
			//	alert("seq: " + seq);
			
			//	alert($(this).attr('class'));
			if($(this).attr('class')=="fas fa-star on"){
			 
			 // 클릭한 중요 별이 속해있는 tr 가져오기 
			 // prevAll은 현재 tr요소 앞의 모든 tr요소 이므로 그 length 값에 +1을 해야 현재 tr의 넘버를 알 수 있음

			 	$.ajax({
			 			url:"addStar.do",
			 			dataType: "JSON",
			 			Type: "post",
			 			data:{ "seq" : seq },
			 			success: function(data){
			 				
			 				if(data != null){
			 				//	alert("중요메시지에 추가되었습니다 ");
			 				}
			 			},
			 			error: function(){
			 				
			 			}
			 	});
			}else if($(this).attr('class')=="fas fa-star" ){
			 	$.ajax({
		 			url:"removeStar.do",
		 			dataType: "JSON",
		 			Type: "post",
		 			data:{ "seq" : seq },
		 			success: function(data){
		 				
		 				if(data != null){
		 					location.href="cImpoMsg.do"
		 					//alert("중요메시지에서 삭제되었습니다 ");
		 				}
		 			},
		 			error: function(){
		 				
		 			}
		 	});
				
			}
			
		});
	})

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
								    	location.href="cImpoMsg.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
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
	


		/*
		if (confirm("정보를 삭제 하시겠습니까?")) {
		   
			$.ajax({
				url        : "deleteMsg.do",
				dataType   : "json",
				type       : "post",
			    traditional: true, // array보낼때 필요
				data       : {"seqArray" : seqArray },
				success    : function(data){
					
					if(data != null){
						  var sKeyword = '<c:out value="${sKeyword}"/>';
						  var pn = '<c:out value="${pageNumber}"/>'
						//삭제처리 후 다시 불러올 리스트 url   
						location.href="cRcvMsg.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
						
					}
				},
				error      : function(request, status, error){
					alert("error");
				}
			});
		}
		*/
	}

	/* 페이지 이동 */
function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	

	  var isUnread = '<c:out value="${isUnread}"/>';
	  //alert("확인 " + isUnread);

	  if(isUnread == 'yes'){
		  location.href="unread.do?page=cImpoMsg&pageNumber=" + pn;


	 }else{	
	
	  location.href="cImpoMsg.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
	}
}
	
	/* 메시지 작성 */
	function writeAction() {
	   $('.messenger-wrap').fadeIn(200);
	}

	/* 메시지 창 닫기 */
	$('.close_window').click(function(){
          $('input').val('');
          $('textarea').val('');
        $('.messenger-wrap').fadeOut(200);
      });
	
	function searchAction() {
	//	alert("검색 버튼 클릭");
		
		var sKeyword =($("#_keyword").val()).trim();
		
	//	alert("sKeyword: " + sKeyword );
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else{
		 location.href="cImpoMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}	
	}
	
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

	
	
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
