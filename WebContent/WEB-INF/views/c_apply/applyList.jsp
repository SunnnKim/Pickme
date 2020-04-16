<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>



<%-- 
seq : <%=company.getSeq() %>
email : <%=company.getEmail()%>
 --%>




<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<!-- <li class="active"><a href="#allList" onclick="getList('allList', 1)">요청 목록</a></li> -->
	<li class="active"><a href="getRequestList.do">요청 목록</a></li>
	<li	              ><a href="requestLike.do">관심 인재</a></li>
</ul>


<div class="bbsCont">
	<!-- allList -->
	<div id="allList" data-tab-content="" class="active">
		<!-- 검색창 -->
		<div class="bbs-top">
			<div class="form-search">
				<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value="">
				<button type="button" class="btn-search" onclick="searchAction()"><span>검색</span>	</button>
			</div>
		</div>

		<!-- 리스트 -->
		<div class="table-col table-bbs">
			<table>
				<caption>전체</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 30%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 5%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>관심</th>
						<th>이름</th>
						<th>요청일</th>
						<th>수락여부</th>
						<th>상태</th>
						<th><input type="checkbox" id="checkall"></th>
						<!-- 모두선택 -->
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty requestList }">
						<tr>
							<td colspan="7">요청 한 목록이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach items="${requestList }" var="request" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td class="like-td">
								<%-- <input type="hidden" id="amem_seq" value="${request.seq }"> --%>
								<c:choose>
									<c:when test="${request.likePick eq '1'}">
										<button type="button" onclick="likech(this, ${request.pseq }, '${request.email }')">
											<i class="fas fa-heart liked"></i>
										</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="likech(this, ${request.pseq }, '${request.email }')">
											<i class="fas fa-heart unliked"></i>
										</button>
									</c:otherwise>
								</c:choose>
							</td>
							
							<td>	<!-- 구직자 기본 정보 링크 들어가야함 -->
								<a href="" style="text-align: center;">
									${request.name }
								</a>
							</td>
							<td>${request.rdate }</td>
							<td>
								<c:choose>
									<c:when test="${request.accept eq '1'}">
									수락
									</c:when>
									<c:when test="${request.accept eq '2'}">
									거절
									</c:when>
									<c:otherwise>
									대기
									</c:otherwise>
								</c:choose>
							</td>

							<td>
								<c:choose>
								<c:when test="${request.accept eq '1'}">
									<button type="button" class="btn-resumeOpen" onclick="resumeOpen()">이력서 열람</button>
								</c:when>
									<c:when test="${request.accept eq '2'}">
										 <!-- 요청 거절 됨 -->
								</c:when>
								<c:otherwise>
									<button type="button" class="btn-cancel" onclick="cancelAction(${request.seq})">요청취소</button>
										<%-- ${request.seq} = cv_request에 대한 seq --%>
									</c:otherwise>
								</c:choose>
							</td>
							<td><input type="checkbox" class="checkRow" name="checkRow" value="${request.seq}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="btn-message" style="text-align: right;">
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




</div>
<!-- bbsCont -->

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

		// 전체 체크 후 개별 체크 해제할 경우 전체 체크 해제		
		$("input[name=checkRow]").click(function(){
			$("#checkall").prop("checked", false);
		});
	})
	
	/* 관심 인재  */
	function likech(btn, seq, email){
		console.log($(btn).children('i'));

		if( $(btn).children('i').hasClass('unliked')==true ){
			//alert("unliked 선택 / seq : " + seq + " email : " + email);
			$(btn).children('i').removeClass('unliked');
			$(btn).children('i').addClass('liked');

			$.ajax({
				url		: 'addLike.do',
				type	: 'POST',
				data	: { "likePickSeq" : seq , "email" : email },
				success : function(result) {
					if(result) {
						//alert("관심 인재 추가");
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			})
		} else if($(btn).children(':first').hasClass('liked')) {
			//alert("liked 선택 / seq : " + seq);
			$(btn).children(':first').removeClass('liked');
			$(btn).children(':first').addClass('unliked');

			
			$.ajax({
				url		: 'delLike.do',
				type	: 'POST',
				data	: { "likePickSeq" : seq , "email" : email },
				success : function(result) {
					if(result) {
						//alert("관심 인재 해제");
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			})
			
			
			
			
		
		}
	}
	
	
	function cancelAction(seq) {
		//alert("요청을 취소 할 cv_request의 seq : " + seq)
		
		if (confirm("열람 요청을 취소 합니다.")) {

			$.ajax({
				url : 'requestCancel.do',
				type : 'POST',
				data : { "cv_seq" : seq },
				/* dataType  : "String", */
				success : function(result) {
					//alert("요청 취소 리턴 값 : " + result);
					if(result) { 
						//alert("취소 완료");
						location.href="getRequestList.do";
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			});   
		}
	}
	
	
	
	
	
	/* 선택 삭제(체크박스된 것 전부) */
	function deleteAction() {
		
		var checkRow = "";
		$("input[name='checkRow']:checked").each(function() {
			checkRow = checkRow + $(this).val() + ",";
		});
		checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		//alert("checkRow seq : " + checkRow); 

		if (checkRow == '') {
			alert("삭제 할 목록을 선택하세요.");
			return false;
		}
		console.log("### checkRow => {" + checkRow + "}");

		if (confirm("선택된 목록을 삭제 합니다")) {

			$.ajax({
				url : 'requestDelete.do',
				type : 'POST',
				data : { checkRow },
				/* dataType  : "String", */
				success : function(result) {
					//alert("success : " + result );
					alert(result + "개가 삭제 되었습니다");
					location.href="getRequestList.do";
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			});   
		}
	}


	/* 검색 버튼 */
	function searchAction() {
		//alert("검색 버튼 클릭");
		var keyWord = "";
		keyWord = $.trim($("input[name=keyWord]").val());
		alert("키워드 : "+keyWord);
		
		if(keyWord == null || keyWord == "") {
			alert("검색어를 입력해주세요.");
		} else {
			location.href="getRequestList.do?sKeyword="+keyWord+"&pageNumber=0";		
		}
	}
	/* 검색 엔터키 입력 */
	$("input[name=keyWord]").keyup(function(e){if(e.keyCode == 13) searchAction(); });
	


	/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
		
	  location.href="getRequestList.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
	}



	

	function getList(mode, page) {
		var $area;
		var url = "";
		if (mode == "" || page == "") {return false;}
		
		if (mode == "notice") {
			url = "/pc/cs/noticeListData.json";
			$area = $("div#notice");
		} else if (mode == "favorite") {
			/* url = "/pc/cs/winnerListData.json"; */
			url = "requestLikeList.do";
			/* $area = $("div#winner"); */
		} else {
			url = "getRequestList2.do";
			$area = $("div#allList");
			//alert('11');
		}
		
		// 전송
		$.ajax({
			async		: true,
			url			: url,
			dataType	: 'text',
			type		: 'POST',
			contextType : 'application/json;charset=utf-8',
			data		: { }, //mode : mode , page : page , keyWord : keyWord
			success		: function(data, textStatus, jqXHR){
				// alert('getList : ' + data);
				// alert("dma : " +data.name);
					
			},
	
			error:function(request,status,error){ 
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		});
	}


	function resumeOpen() {
		alert(" 이력서 열람 요청 준비중 : resumeOpen() ")
	}



	
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>