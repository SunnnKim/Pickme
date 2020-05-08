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
		<li  class="active"><a href="interestComRecruit.do">관심기업채용</a></li>
		<li><a href="likeRecruit.do">내가찜한채용공고</a></li>
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
				<col style="width: 15%">
				<col style="width: 30%">
				<col style="width: 15%">
				<col style="width: 20%">
				<col style="width: 20%">
			</colgroup>
			<thead>
				<tr>
					<th>기업명</th>
					<th>제목</th>
					<th>직무</th>
					<th>채용마감일</th>
					<th>지원여부</th>
				</tr>
			</thead>
			<tbody>
			<!-- 검색결과 없는 경우 -->
			<c:if test="${empty interComRecruitList }">
				<tr>	
				<c:if test="${!sKeyword eq null || (not empty sKeyword)}">
					<td colspan="5">검색결과가 없습니다</td>
				</c:if>
				<c:if test="${(sKeyword eq null) || (empty sKeyword)}">
					<td colspan="5">현재 등록된 공고가 없습니다</td>
				</c:if>
				</tr>
			</c:if>
			
			<c:forEach items="${interComRecruitList }" var="interComRecruit" varStatus="vs">
				<tr>
					<td><a href="/Pickme/c_mypage/goCMypage.do?sentSeq=${interComRecruit.likepickseq }" class="interest-com" title="기업상세페이지" >${interComRecruit.comName }</a></td>
					<td><a href="/Pickme/searchJob/recDetail.do?seq=${interComRecruit.seq }" class="interest-com" title="채용상세페이지">${interComRecruit.title }</a></td>
					<td>${interComRecruit.comjob1 }</td>
					<td>${interComRecruit.edate }</td>
					<c:if test="${interComRecruit.apply == 0 }">
					<td>
						<button class="goApplyBtn" onclick="apply(${interComRecruit.seq})">지원하러가기</button>
					</td>
					</c:if>
					<c:if test="${interComRecruit.apply == 1 }">
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
	// 정렬 
	var sort = '<c:out value="${sort}"/>';
	// 필터
	var filter = '<c:out value="${filter}"/>';

	// 지원취소 
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

 function apply(seq){

	location.href="/Pickme/searchJob/recDetail.do?seq=" + seq;

	 }


	
		/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
	  var filter = '<c:out value="${filter}"/>';
		
	  location.href="interestComRecruit.do?sKeyword=" + sKeyword +"&pageNumber=" + pn + "&sort=" + sort + "&filter=" + filter;
		
	}
	
	/* 검색 */
	function searchAction() {
		var sKeyword =($("#_keyword").val()).trim();
		
		//	alert("sKeyword: " + sKeyword );
			if(sKeyword == null || sKeyword == ""){
				alert("검색어를 입력해주세요.");
			}else{
			 location.href="interestComRecruit.do?sKeyword=" + sKeyword +"&pageNumber=0" + "&sort=" + 0 + "&filter=채용마감일";
			}	
		}
		
		$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

	/*정렬 카테고리 변경시 이벤트*/	
	$("#applyFilter").change(function(){
		var filterAfter = $("#applyFilter option:selected").val();
		// alert(filterAfter);
		// 검색된 페이지인 경우 검색어 불러오기
		if(filterAfter == '선택'){
	
			
        }else{
		
 			var sKeyword = '<c:out value="${sKeyword}"/>';
			location.href="interestComRecruit.do?sKeyword=" + sKeyword + "&pageNumber=0&sort=" + sort + "&filter=" + filterAfter;
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
 
    		location.href="interestComRecruit.do?sKeyword=" + sKeyword + "&pageNumber=0&sort=" + sort + "&filter=" + filterAfter;
        }
     }   
			
</script>

<!-- subCont 끝 -->

<%@include file="/include/footer.jsp"%>



















