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
		<!-- <li class="active"><a href="#allList" onclick="getList('allList', 1)">요청 목록</a></li> -->
		<li><a href="interestCom.do">관심기업</a></li>
		<li><a href="interestComRecruit.do">관심기업채용</a></li>
		<li class="active"><a href="likeRecruit.do">내가찜한채용공고</a></li>
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
		<div class="bbs-lt"> 
			<!-- 총 글의 갯수 -->
			<div class="apply-totalCount">총 <span>${totalRecordCount }</span>개 </div>	
			
			<!--  정렬 카테고리 -->
			<select id="applyFilter" class="apply-filter">
				<option value="선택">선택</option>
				<c:if test="${filter eq '채용마감일'}">
				<option value="채용마감일" selected="selected">채용마감일 </option>
				<option value="공고등록일">공고등록일</option>	
				</c:if>
				<c:if test="${filter eq '공고등록일'}">
				<option value="채용마감일">채용마감일 </option>
				<option value="공고등록일" selected="selected">공고등록일</option>	
				</c:if>
			</select>
			<!-- 정렬 방향 -->
			<div class="arrow-sort-wrap">
			<c:if test="${sort eq 0}">
				<i onclick="sorting(1)" id="sort-up" class="fas fa-arrow-up" title="오름차순"></i>
				<i onclick="sorting(0)" id="sort-down" class="fas fa-arrow-down active" title="내림차순"></i>
			</c:if>
			<c:if test="${sort eq 1}">
				<i onclick="sorting(1)" id="sort-up" class="fas fa-arrow-up active" title="오름차순"></i>
				<i onclick="sorting(0)" id="sort-down" class="fas fa-arrow-down" title="내림차순"></i>
			</c:if>
			</div>
		</div>
		<div class="bbs-rt"></div>
	</div>
	<!-- 리스트 -->
	<div class="table-col table-bbs cur mt10">
		<table >
			<caption>전체</caption>
			<colgroup>
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 30%">
				<col style="width: 10%">
				<col style="width: 25%">
				<col style="width: 20%">
			</colgroup>
			<thead>
				<tr>
					<th>관심</th>
					<th>기업명</th>
					<th>제목</th>
					<th>직무</th>
					<th>채용마감일</th>
					<th>지원여부</th>
				</tr>
			</thead>
			<tbody>
			<!-- 검색결과 없는 경우 -->
			<c:if test="${empty likeRecruitList }">
				<tr>	
				<c:if test="${!sKeyword eq null || (not empty sKeyword)}">
					<td colspan="6">검색결과가 없습니다</td>
				</c:if>
				<c:if test="${(sKeyword eq null) || (empty sKeyword)}">
					<td colspan="6">관심 등록한 채용공고가 없습니다</td>
				</c:if>
				</tr>
			</c:if>
			
			<c:forEach items="${likeRecruitList }" var="likeRecruit" varStatus="vs">
				<tr>
					<td class="like-td">
								<button type="button" onclick="likech(${likeRecruit.likepickseq })">
									<i class="fas fa-heart liked"></i>
								</button>
					</td>
					<td><a href="/Pickme/c_mypage/goCMypage.do?sentSeq=${likeRecruit.comseq}" class="interest-com" title="기업상세페이지" >${likeRecruit.comName }</a></td>
					<td><a href="/Pickme/searchJob/recDetail.do?seq=${likeRecruit.likepickseq }" class="interest-com" title="채용상세페이지">${likeRecruit.title }</a></td>
					<td>${likeRecruit.comjob1 }</td>
					<td>${likeRecruit.edate }</td>
					<c:if test="${likeRecruit.apply == 0 }">
					<td>
						<button class="goApplyBtn" onclick="apply(${likeRecruit.likepickseq })">지원하러가기</button>
					</td>
					</c:if>
					<c:if test="${likeRecruit.apply == 1 }">
					<td>
						<span class="applyCompleteBtn">지원완료</span>
					</td>
					</c:if>
					
				</tr>
			</c:forEach>	
			</tbody>
		</table>
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

</div> <!-- // allList -->

<script>
	// 관심기업 삭제 	 
	function likech(likepickseq){
		
		//alert(likepickseq);
		var pn = '<c:out value="${pageNumber }"/>'
		$.ajax({
			 url: "removefav.do", 
			 data: {"likepickseq" : likepickseq,
				   "auth" : 3},
			 type: "post", 
			 dataType: "json",
			 success: function(data){
				if(data >0){
					//alert("관심기업 삭제");
					location.href="likeRecruit.do?pageNum=" + pn;
	
					}
			 },
			 error: function(){
					alert("error");
	
		    }
	    })
	}

	function apply(seq){

		location.href="/Pickme/searchJob/recDetail.do?seq=" + seq;

		 }
		
	 function apply(seq){

			location.href="/Pickme/searchJob/recDetail.do?seq=" + seq;

	 }

	

	function searchAction() {
		//alert("검색 버튼 클릭");
		
		var sKeyword =($("#_keyword").val()).trim();		
		// alert("sKeyword: " + sKeyword );
		
		if(sKeyword == null || sKeyword == ""){
			Swal.fire({
				  icon : 'warning',
				  text : '검색어를 입력해 주세요'
				})
		}else{
		 location.href="likeRecruit.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}
	}
	// 엔터키로 검색 
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });	

	

	/* 페이지 이동 */
	function goPage(pn){
		  var sKeyword = '<c:out value="${sKeyword}"/>';
		  var filter = '<c:out value="${filter}"/>';
	
		  	location.href="likeRecruit.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
	
	}	

	/*정렬 카테고리 변경시 이벤트*/	
	$("#applyFilter").change(function(){
		var filterAfter = $("#applyFilter option:selected").val();
		// alert(filterAfter);
		// 검색된 페이지인 경우 검색어 불러오기
		if(filterAfter == '선택'){
	
			
        }else{
		
 			var sKeyword = '<c:out value="${sKeyword}"/>';
			location.href="likeRecruit.do?sKeyword=" + sKeyword + "&pageNumber=0&sort=" + sort + "&filter=" + filterAfter;
        }
	});

    /* 정렬 */		
    function sorting(sort){
    	// 검색된 페이지인 경우 검색어 불러오기
 		var sKeyword = '<c:out value="${sKeyword}"/>';
 		// 필터 select box 텍스트 가져오기
 		var filterAfter = $("#applyFilter option:selected").val();
    	// alert("필터: " + filterAfter + " 정렬: " + sort);

    	if(filterAfter == '선택'){
    		Swal.fire({
  			  title: '카테고리를 선택해주세요',
  			  text: "",
  			  icon: 'warning',
  			  showCancelButton: false,
  			  timer: 1500
  		});	
			
        }else{
 
    		location.href="likeRecruit.do?sKeyword=" + sKeyword + "&pageNumber=0&sort=" + sort + "&filter=" + filterAfter;
        }
     }   
				
</script>

<!-- subCont 끝 -->

<%@include file="/include/footer.jsp"%>



















