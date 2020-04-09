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
	<li><a href="inMsg.do" >받은 메시지</a></li>
	<li class="active"><a href="outMsg.do" >보낸 메시지</a></li>
	<li><a href="impoMsg.do" >중요 메시지</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" id="_keyword" name="sKeyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>

	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt"> 총 <span>${totalRecordCount }</span>개</div>
		<div class="bbs-rt">
		     <a href="unread.do?page=inMsg"></a>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs msg mt10">
		<jsp:useBean id="paging" class="pickme.com.a.util.EApplyUtil"/>
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 45%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width: 10%">
			</colgroup>
			<thead>
				<tr>
					<th>내용</th>
					<th>수신자</th>
					<th>발신일</th>
					<th>수신확인</th>
					<th><input type="checkbox" id="checkall"></th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty outMsglist }">
			<tr>
				<c:if test="${sKeyword != null }">
					<td colspan="5">찾으시는 메시지가 없습니다</td>
				</c:if>
				<c:if test="${sKeyword == null}">
					<td colspan="5">보낸 메시지가 없습니다</td>
				</c:if>
				</tr>
			</c:if>
				<c:forEach items="${outMsglist }" var="outMsg" varStatus="vs">
				<c:set var="content" value="${outMsg.content }" />
				<c:set var="sdate" value="${outMsg.sdate }" />
					<tr><!-- 중요메시지 표시 -->
					<td>
						
						<a href="seeMsg.do?seq=${outMsg.seq }&page=outMsg&pageNumber=${pageNumber}&unread=0"><span style="text-align:left;"><%=EApplyUtil.dots(pageContext.getAttribute("content").toString())%></span></a>
					
					</td>
					<td> ${ outMsg.name } <input type="hidden" id="_seq" value="${ outMsg.seq}"></td>
					<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("sdate").toString())%></td>
						
						<td>	
							<c:if test="${ outMsg.open == 0 }" >
								<span>읽지않음</span>
									
							</c:if>
							<c:if test="${outMsg.open == 1 }">
								<span>읽음</span>	
							</c:if>
						</td>
						
						<td><input type="checkbox" name="checkRow" value="${outMsg.seq }"></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btn-message">
		<button type="button" onclick="writeAction()">메시지 작성</button>
		<button type="button" style="float: right;" onclick="deleteAction()">선택삭제</button>
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

<!-- 메시지작성 팝업 -->
 <div class="messenger-wrap">
     <form id="frm" action="" method="post">
         <div class="msgBox">
                <div class="msg-bar">
                    <h4>메세지 보내기</h4>
                </div><!-- // message-bar-->
                <div class="msgCont">
                    <div class="msgTo"><!--검색기능 jquery-ui, ajax사용-->
                        <!--https://jqueryui.com/autocomplete/ 
                            https://hellogk.tistory.com/74
                            참고하면 될듯해요-->
                        <input type="text"  placeholder="To">
                    </div><!-- // messageTo-->
                    <div class="msgTit">
                        <input type="text" id="msgTitle" placeholder="Title">
                    </div><!-- // messageTit-->
                    <div class="msgText">
                        <textarea id="content" placeholder=""></textarea>
                    </div><!-- // messageText-->
                    <div class="msgBtn">
                        <button onclick="send()">보내기</button>
                        <button class="close_window">닫기</button>
                    </div><!-- // messageBtn-->
                </div><!-- // messageCont-->
          </div><!-- // messageBox-->
 	 </form>
</div><!-- //messenger-wrap -->
  


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
			
			//checkRow = checkRow + $(this).val() + ",";
		});
		// checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		
		if (seqArray == null) {
			alert("삭제 할 대상을 선택하세요.");
			return false;
		}
		// console.log("### checkRow => {}" + checkRow);
		
		// alert(seqArray.length);

		if(seqArray.length == 0){
			alert("삭제하실 내역이 없습니다");
			return false;
		}
		
		if (confirm("정보를 삭제 하시겠습니까?")) {
			//삭제처리 후 다시 불러올 리스트 url      
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
						
						location.href="outMsg.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
						
					}
				},
				error      : function(request, status, error){
					alert("error");
				}
			});
		}
	}

	/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
		
	  location.href="outMsg.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
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
		
		var sKeyword = ($("#_keyword").val()).trim();
			
		//	alert("sKeyword: " + sKeyword );
			
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else{
			 location.href="outMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}

	}	
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
