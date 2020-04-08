<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"
	crossorigin="anonymous"></script>




<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="#allList" onclick="getList('allList', 1)">요청 목록</a></li>
	<!-- <li><a href="#favorite" onclick="getList('favorite', 1)">관심 인재</a></li> -->
	<li				  ><a href="#favorite" onclick="">관심 인재</a></li>
</ul>


<div class="bbsCont">


	<!-- allList -->
	<div id="allList" data-tab-content="" class="active">
		<!-- 검색창 -->
		<div class="bbs-top">
			<div class="form-search">
				<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value="">
				<button type="button" class="btn-search" onclick="search('allList', 1)">
					<span>검색</span>
				</button>
			</div>
		</div>
	
		<!-- 리스트 -->
		<div class="table-col table-bbs">
			<table>
				<caption>전체</caption>
				<colgroup>
					<col style="width: 70px">
					<col style="width: 70px">
					<col>
					<col>
					<col>
					<col style="width: 300px">
					<col style="width: 50px">
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
							<td>
								<!-- <ul class="pmList">
								<li> -->
								<button type="button" class="likeButton" onclick="likech(this)">
									<i class="fas fa-heart unliked"></i>
									<%-- <input type="hidden" id="pLikeSeq" value="${request.seq }"> --%>
								</button> <!-- <i class="fas fa-star"> <input name="bool" type="hidden" value=""></i> -->
								<!-- </li>
								</ul> -->
							</td>
							<td><a href="" style="text-align: center;">${request.name }</a>
							</td>
							<td>
								<%-- ${request.rdate } --%> ${fn:substring(request.rdate ,0,10) }
							</td>
							<td><c:choose>
									<c:when test="${request.accept eq '1'}">
										1: 수락
									</c:when>
									<c:when test="${request.accept eq '2'}">
										2: 거절
									</c:when>
									<c:when test="${request.accept eq '4'}">
										4: 요청 취소
									</c:when>
									<c:otherwise>
										0: 대기
									</c:otherwise>
								</c:choose></td>
	
							<td><c:choose>
									<c:when test="${request.accept eq '1'}">
										이력서 띄워야 
									</c:when>
									<c:when test="${request.accept eq '2'}">
										accept : 2
									</c:when>
									<c:when test="${request.accept eq '4'}">
										accept : 4
									</c:when>
									<c:otherwise>
										<button type="button" style="border: 1px solid #000;" onclick="cancelAction(${request.seq})">요청취소</button>
									</c:otherwise>
								</c:choose></td>
	
							<td><input type="checkbox" class="checkRow" name="checkRow"
								value="${request.seq}"> ${request.seq}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<div class="btn-message" style="text-align: right;">
			<button type="button" class="delete_btn" onclick="deleteAction()">선택삭제</button>
		</div>
	
		<!-- 페이징 -->
		<div class="paging">
			<button type="button" class="btn-first"	onclick="getList('allList', 1)">
				<span>처음</span>
			</button>
			<button type="button" class="btn-p rev" onclick="getList('allList', 1)">
				<span>이전</span>
			</button>
			<ul>
				<li class="active"><span>1</span></li>
				<li><a href="" onclick="">2</a></li>
				<li><a href="" onclick="">3</a></li>
			</ul>
			<button type="button" class="btn-next" onclick="getList('allList', 2)">
				<span>다음</span>
			</button>
			<button type="button" class="btn-last" onclick="getList('allList', 10)">
				<span>마지막</span>
			</button>
		</div>
	</div>
	<!-- // allList -->
	
	
	<!-- favorite -->
	<div id="favorite" data-tab-content="" class=>
		<!-- 검색창 -->
		<div class="bbs-top">
			<div class="form-search">
				<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value="">
				<button type="button" class="btn-search" onclick="search('favorite', 1)">
					<span>검색</span>
				</button>
			</div>
		</div>
	
		<!-- 리스트 -->
		<div class="table-col table-bbs">
			<table>
				<caption>전체</caption>
				<colgroup>
					<col style="width: 70px">
					<col style="width: 70px">
					<col>
					<col>
					<col>
					<col style="width: 300px">
					<col style="width: 50px">
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
					<c:if test="${empty requestLikeList }">
						<tr>
							<td colspan="7">요청 한 목록이 없습니다</td>
						</tr>
					</c:if>
	
					<c:forEach items="${requestLikeList }" var="like" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>
								<button type="button" class="likeButton" onclick="likech(this)">
									<i class="fas fa-heart unliked"></i>
								</button> <!-- <i class="fas fa-star"> <input name="bool" type="hidden" value=""></i> -->
							</td>
							<td><a href="" style="text-align: center;">${like.name }</a>
							</td>
							<td>
								<%-- ${request.rdate } --%> ${fn:substring(like.rdate ,0,10) }
							</td>
							<td><c:choose>
									<c:when test="${like.accept eq '1'}">
										1: 수락
									</c:when>
									<c:when test="${like.accept eq '2'}">
										2: 거절
									</c:when>
									<c:when test="${like.accept eq '4'}">
										4: 요청 취소
									</c:when>
									<c:otherwise>
										0: 대기
									</c:otherwise>
								</c:choose></td>
	
							<td><c:choose>
									<c:when test="${like.accept eq '1'}">
										이력서 띄워야 
									</c:when>
									<c:when test="${like.accept eq '2'}">
										accept : 2
									</c:when>
									<c:when test="${like.accept eq '4'}">
										accept : 4
									</c:when>
									<c:otherwise>
										<button type="button" style="border: 1px solid #000;" onclick="cancelAction(${request.seq})">요청취소</button>
									</c:otherwise>
								</c:choose></td>
	
							<td><input type="checkbox" class="checkRow" name="checkRow"
								value="${like.seq}"> ${like.seq}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<div class="btn-message" style="text-align: right;">
			<button type="button" class="delete_btn" onclick="deleteAction()">선택삭제</button>
		</div>
	
		<!-- 페이징 -->
		<div class="paging">
			<button type="button" class="btn-first"	onclick="getList('allList', 1)">
				<span>처음</span>
			</button>
			<button type="button" class="btn-prev" onclick="getList('allList', 1)">
				<span>이전</span>
			</button>
			<ul>
				<li class="active"><span>1</span></li>
				<li><a href="" onclick="">2</a></li>
				<li><a href="" onclick="">3</a></li>
			</ul>
			<button type="button" class="btn-next" onclick="getList('allList', 2)">
				<span>다음</span>
			</button>
			<button type="button" class="btn-last" onclick="getList('allList', 10)">
				<span>마지막</span>
			</button>
		</div>
	</div><!-- favorite -->

</div><!-- bbsCont -->

<script>
$(document).ready(function(){
	var cnt = 0;
	$('.bbsCont > div').hide().eq(0).show();
	$(".tab-default li").click(function(){
		cnt = $(this).index();
		$('.tab-default li').removeClass('active').eq(cnt).addClass('active');
		//$('.bbsCont > div').hide().eq(cnt).fadeIn('fast');
		$('.bbsCont > div').hide().eq(cnt).show();
		
	});
});

</script>


<script>

	$(document).ready(function() {
				
		// 중요메세지 표시
		$('.star-td i').click(function() {
			$(this).toggleClass('on');
			/* let _bool = $("input[name=bool]").val("0");
			console.log("_bool은 " + _bool);

			$.ajax({
				url: "",
				data: _bool,

				success: function() {
					alert("성공");
				},
				error: function() {
					alert(" 실패");
				}
			}) */
		});
	

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
	
	
	function cancelAction(seq) {
		//alert("요청 취소 seq : " + seq)
		
		if (confirm("요청을 취소 하시겠습니까?")) {

			$.ajax({
				url : 'requestCancel.do',
				type : 'POST',
				data : { seq },
				/* dataType  : "String", */
				success : function(result) {
					//alert("success : " + result );
					alert("취소 완료");
					location.href="getRequestList.do";
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
		alert("checkRow seq : " + checkRow);

		if (checkRow == '') {
			alert("삭제 할 대상을 선택하세요.");
			return false;
		}
		console.log("### checkRow => {" + checkRow + "}");

		if (confirm("선택한 항목을 삭제 하시겠습니까?")) {

			$.ajax({
				url : 'requestDelete.do',
				type : 'POST',
				data : { checkRow },
				/* dataType  : "String", */
				success : function(result) {
					//alert("success : " + result );
					alert(result + "개 삭제 완료");
					location.href="getRequestList.do";
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			});   
		}
	}


	function search(mode, page) {
		//alert("검색 버튼 클릭");
		alert("Mode : "+ mode + " Page : " + page);

		var keyWord = "";
		keyWord = $.trim($("input[name=keyWord]").val());

		alert("keyWord : " + keyWord);
		getList(mode,page);
	}


	function likech(btn){
	    console.log($(btn).children('i'));
	     if( $(btn).children('i').hasClass('unliked')==true ){
	       $(btn).children('i').removeClass('unliked');
	       $(btn).children('i').addClass('liked');
	       
	    } else if($(btn).children(':first').hasClass('liked')) {
	        $(btn).children(':first').removeClass('liked');
	        $(btn).children(':first').addClass('unliked');
	     }
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
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
