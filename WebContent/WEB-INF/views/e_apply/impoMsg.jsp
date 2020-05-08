<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

<!-- subCont 시작 -->
	<!-- 메뉴 -->
	<ul class="tab-default column3 mt30" data-tab="">
		<li ><a href="inMsg.do" >받은 메시지</a></li>
		<li><a href="outMsg.do" >보낸 메시지</a></li>
		<li class="active"><a href="impoMsg.do" >중요 메시지</a></li>
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

		<div class="bbs-rt">
		     <a href="unread.do?page=impoMsg"><p class="unread">안읽은메시지 ${unreadCount}</p></a>
		</div>
	</div>	<!-- 리스트 -->
	<div class="table-col table-bbs msg mt10">
		<jsp:useBean id="paging" class="pickme.com.a.util.EApplyUtil"/>
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 60%">
				<col style="width:15%">
				<col style="width:15%">
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
				<c:if test="${unreadCount == 0 && isUnread != null }">
					<td colspan="5">안읽으신 메시지가 없습니다</td>
				</c:if>

				<c:if test="${(sKeyword eq null || (empty sKeyword) ) && isUnread == null }">
					<td colspan="5">중요 메시지가 없습니다</td>
				</c:if>
				<c:if test="${!sKeyword eq null || (not empty sKeyword)}">
					<td colspan="5"> 찾으시는 메시지가 없습니다</td>
				</c:if>
			</tr>
				
			</c:if>
			
			<c:forEach items="${impoMsglist }" var="impoMsg" varStatus="vs">
			<c:set var="content" value="${impoMsg.content }" />
			<c:set var="sdate" value="${impoMsg.sdate }" />
					<tr><!-- 중요메시지 표시 -->
					<td><input type="checkbox" name="checkRow" value="${impoMsg.seq }"></td>
					<td class="star-td">
						<c:if test="${ impoMsg.important == 0 }" >
							<i class="fas fa-star"> <input
								type="hidden" value="">
							</i>
						</c:if>
						<c:if test="${ impoMsg.important == 1 }">
							<i class="fas fa-star on"> <input
							type="hidden" value="">
							</i>
						</c:if> 
					
					</td>
						<!-- 메시지내용 안읽은경우 굵은글씨 --> 
						<td>	
							<c:if test="${ impoMsg.open == 0 }" >
								<c:if test="${isUnread != null }">
									<a href="seeMsg.do?seq=${impoMsg.seq }&page=impoMsg&pageNumber=${pageNumber}&unread=1"><span class="unread-msg"><%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%></span></a>
								</c:if>
								<c:if test="${isUnread == null }">
									<a href="seeMsg.do?seq=${impoMsg.seq }&page=impoMsg&pageNumber=${pageNumber}&unread=0"><span class="unread-msg"><%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%></span></a>	
								</c:if>
									
							</c:if>
							<c:if test="${impoMsg.open == 1 }">
									<a href="seeMsg.do?seq=${impoMsg.seq }&page=impoMsg&pageNumber=${pageNumber}&unread=0"><span class="read-msg"><%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%></span></a>
							</c:if>
						</td>
						<td> ${ impoMsg.name } <input type="hidden" id="_seq" value="${ impoMsg.seq}"></td>
						<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("sdate").toString())%></td>	
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

		// 중요메세지 표시
		$('.star-td i').click(function() {
			$(this).toggleClass('on');
			//	alert("확인");
			
			 var trNum = ($(this).closest('tr').prevAll().length) + 1;
			//	alert("trNum" + trNum);
			 
				var seq = $('table tr').eq(trNum).find('#_seq').val();
			//	alert("seq: " + seq);
			//	alert($(this).attr('class'));
				 if($(this).attr('class')=="fas fa-star on"){
					// alert(" on");
					 // 클릭한 중요 별이 속해있는 tr 가져오기 
					 // prevAll은 현재 tr요소 앞의 모든 tr요소 이므로 그 length 값에 +1을 해야 현재 tr의 넘버를 알 수 있음
					 	$.ajax({
					 			url:"addStar.do",
					 			dataType: "JSON",
					 			Type: "post",
					 			data:{ "seq" : seq },
					 			success: function(data){
					 				if(data != null){
					 					alert("중요메시지에 추가되었습니다 ");
					 				}
					 			},
					 			error: function(){
					 				
					 			}
					 	});
					}else if($(this).attr('class') == "fas fa-star" ){
					
				//	alert("확인!");
				 	$.ajax({
			 			url:"removeStar.do",
			 			dataType: "JSON",
			 			Type: "post",
			 			data:{ "seq" : seq },
			 			success: function(data){
			 				
			 				if(data != null){
			 					location.href="impoMsg.do"
			 				//	alert("중요메시지에서 삭제되었습니다 ");
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
		var seqArray = [];
		$("input[name='checkRow']:checked").each(function() {
			// 배열에 집어넣기
			seqArray.push($(this).val());
		});

		if (seqArray == null || seqArray.length == 0) {
			Swal.fire({
				  title: '삭제하실 메시지를 선택해주세요',
				  text: "",
				  icon: 'warning',
				  showCancelButton: false,
				  timer: 1500
				})
			return false;
		}

		Swal.fire({
			  title: '선택하신 메시지를 삭제하시겠습니까?',
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
						url        : "deleteMsg.do",
						dataType   : "json",
						type       : "post",
					    traditional: true, // array보낼때 필요
						data       : {"seqArray" : seqArray },
						success    : function(data){

							if(data != null){
									
								 Swal.fire(
								      '삭제되었습니다',
								      '',
								      'success'
							    ).then((reslut)=>{

							    	  var sKeyword = '<c:out value="${sKeyword}"/>';
									  var pn = '<c:out value="${pageNumber}"/>'
									
									location.href="impoMsg.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
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
		  alert("sKeyword: " + sKeyword);
	
		  var isUnread = '<c:out value="${isUnread}"/>';
	
		  alert(isUnread);
	
		  if(isUnread == 'yes'){
			  
			  location.href="unread.do?sKeyword=" + sKeyword + "&page=impoMsg&pageNumber=" + pn;
	
		 }else{	
			
		  	location.href="impoMsg.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
	
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
		// alert("검색 버튼 클릭");
		
		var sKeyword =($("#_keyword").val()).trim();		
		// alert("sKeyword: " + sKeyword );
		
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else if(isUnread == 'yes'){
			location.href="unread.do?sKeyword=" + sKeyword + "&page=impoMsg&pageNumber=0";
		}else{
		 location.href="impoMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}
	}
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });	

</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
