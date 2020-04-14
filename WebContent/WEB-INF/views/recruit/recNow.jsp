
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../../include/header.jsp"/> 
<!-- 헤더호출 -->
 <div class="cont">
          <ul class="pmList clfix">
          <c:if test="${empty comCurrentRecList }">
					<h1>리스트없음</h1>
			</c:if>
			<c:forEach items="${comCurrentRecList }" var="dto" varStatus="rs">
				<li><a href="recDetail.do?seq=${dto.seq }">
	              <div class="img">
	               <img src="filedownload.do?filename=${dto.imagename }&filepath=/upload/recruit/" alt="엑박">
	              </div>
	              <div class="txt">
	                <h3>${dto.title }</h3>
	                <p>${dto.comName }</p>
	                <p>${dto.comJobType }</p>
	                <span>[채용]${dto.wdate } ~ ${dto.edate }</span>
	              </div>
	            </a></li>
			</c:forEach>
          </ul>
  </div><!-- cont -->
<!-- subCont 끝 -->
<c:import url="../../../include/footer.jsp"/> 
