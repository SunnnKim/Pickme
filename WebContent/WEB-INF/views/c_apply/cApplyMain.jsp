<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>


<style>
.pmList li button.cApply_btn { 
width : 165px; 
height : 32px; 
font-size: 15px; 
position: unset; 
border: 1px solid #4f6eff; 
background-color: #ffffff ;
color: #4f6eff;
}

.pmList li button.cApply_btn:hover {
    background-color: #4f6eff;
    color: #ffffff;
    transition: all 0.2s ease-in-out;
}

.pmList li .txt .cApply_title {
	position: absolute;
    overflow: hidden;
    white-space: nowrap;
    width: 150px;
    text-overflow: ellipsis;
}

.pmList li .txt {
    padding-top: 20px;
    padding-bottom: 20px;
}


</style>













<!-- subCont 시작 -->

<!-- 메뉴 -->
<!-- 
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="cApplyList.do">현재공고</a></li>
	<li><a href="">지난공고</a></li>
</ul>
 -->

<!-- allList -->

<div class="cont">

	<c:choose>
		<c:when test="${empty comCurrentRecList }">
			<div style="text-align: center; position: relative; margin-top: 4wndl0px;">
				<p style="position: absolute; top: 0; left: 0; width: 100%; font-size: 30px;">등록된 공고가 없습니다.</p>
				<img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width: 60%;">
			</div>
		</c:when>
		<c:when test="${not empty comCurrentRecList }">
			<ul class="pmList capplyList clfix">
				<c:forEach items="${comCurrentRecList }" var="dto" varStatus="rs">
					<li style="border: 1px solid #ddd; border-radius: 5px;">
						<div class="img" style="border: 0;">
							<a href="/Pickme/c_apply/cApply_myRecDetail.do?seq=${dto.seq }"> 
								<img src="filedownload.do?filename=${dto.imagename }&filepath=/upload/recruit/"	alt="엑박">
							</a>
						</div>
						<div class="txt">
							<h3 class="cApply_title">${dto.title }</h3>
							<c:if test="${dto.del == 0 }"><H4 style="text-align: right; color: #4f6eff">[모집]</H4> </c:if>							
							<c:if test="${dto.del == 2 }"><H4 style="text-align: right; color: #ff7373">[마감]</H4> </c:if>		
							<%-- <p>${dto.comName }</p> --%>
							<%-- <p>${dto.comJobType }</p> --%>
							<span style="text-align: right;">[기간] : ${dto.wdate } ~ ${dto.edate }</span>
												
							<div style="text-align: -webkit-center; margin-top: 20px">
								<button type="button" class="cApply_btn" onclick="cApply_list(${dto.seq})">지원자 : ${dto.applyCount }명	</button>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- 페이징 -->
			<div id="paging_wrap" style="margin-top: 60px">
				<jsp:include page="/WEB-INF/views/c_apply/paging.jsp" flush="false">
					<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
					<jsp:param name="pageNumber" value="${pageNumber }" />
					<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
					<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
				</jsp:include>
			</div>
			<!-- // paging_wrap -->
		</c:when>
	</c:choose>
</div>
<!-- cont -->
<!-- subCont 끝 -->
<script>
/* 페이지 이동 */
 
//var seq = '${sessionScope.logincompany.seq}';
function goPage(pn){	

	 location.href="cApplyMain.do?&pageNumber=" + pn;
	
}

function cApply_list(seq) {
	//alert("jobSeq : " + seq);
	location.href="cApplyList.do?jobSeq=" + seq;
}


</script>
<!-- // allList -->

<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
