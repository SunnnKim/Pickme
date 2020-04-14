
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../../include/header.jsp"/> 
<!-- 헤더호출 -->
 <div class="cont">
          <ul class="pmList clfix">
          <c:if test="${empty comCurrentRecList }">
				<div style="text-align:center; position:relative; margin-top:4wndl0px;">
          			<p style="position:absolute; top:0; left:0; width:100%; font-size:30px;">등록된 공고가 없습니다.</p>
					<img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width:60%;">
				</div>
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
