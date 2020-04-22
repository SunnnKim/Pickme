
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../../include/header.jsp"/> 
<!-- 헤더호출 -->
 <div class="cont">
          <c:choose>
	          <c:when test="${empty comPastRecList }">
					<div style="text-align:center; position:relative; margin-top:4wndl0px;">
	          			<p style="position:absolute; top:0; left:0; width:100%; font-size:30px;">등록된 공고가 없습니다.</p>
						<img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width:60%;">
					</div>
				</c:when>
				<c:when test="${not empty comPastRecList }">
				 <ul class="pmList clfix">
					<c:forEach items="${comPastRecList }" var="dto" varStatus="rs">
						<li><a href="myRecDetail.do?seq=${dto.seq }">
			              <div class="img">
			               <img src="filedownload.do?filename=${dto.imagename }&filepath=/upload/recruit/" alt="엑박">
			              </div>
			              <div class="txt">
			                <h3>${dto.title }</h3>
			                <p>${dto.comName }</p>
			                <p>${dto.comJobType }</p>
			                <span>[채용마감]${dto.wdate } ~ ${dto.edate }</span>
			              </div>
			            </a></li>
					</c:forEach>
					</ul>
					  <!-- 페이징 -->
						<div id="paging_wrap">
							<jsp:include page="/WEB-INF/views/searchJob/paging.jsp" flush="false">
								<jsp:param name="totalRecCount" value="${totalRecCount }" />
								<jsp:param name="pageNumber" value="${pageNumber }" />
								<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
							</jsp:include>
						</div><!-- // paging_wrap -->
				</c:when>
          </c:choose>
  		</div><!-- cont -->
<!-- subCont 끝 -->
<script>

/* 페이지 이동 */

var seq = '${sessionScope.logincompany.seq}';
function paging(pn){	
  location.href="recPast.do?comSeq="+seq+"&pageNumber=" + pn;
	
}
 
</script>
<c:import url="../../../include/footer.jsp"/> 
