
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../../include/header.jsp"/> 
<!-- 헤더호출 -->
 <div class="cont">
          <c:choose>
	          <c:when test="${empty comCurrentRecList }">
					<div style="text-align:center; position:relative; margin-top:4wndl0px;">
	          			<p style="position:absolute; top:0; left:0; width:100%; font-size:30px;">등록된 공고가 없습니다.</p>
						<img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width:60%;">
					</div>
				</c:when>
				<c:when test="${not empty comCurrentRecList }">
				 <ul class="pmList clfix">
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
					 <!-- 페이징 -->
						<div class="paging">
							<button type="button" class="btn-first" onclick="getList('allList', 1)">
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
							<button type="button" class="btn-last"
								onclick="getList('allList', 10)">
								<span>마지막</span>
							</button>
						</div>   
				</c:when>
          </c:choose>
  		</div><!-- cont -->
<!-- subCont 끝 -->
<script>

 //페이징
 function getList(mode, page) {
		var $area;
		var url = "";
		if (mode == "" || page == "") {return false;}
		
		if (mode == "notice") {
			url = "/pc/cs/noticeListData.json";
			$area = $("div#notice");
		} else if (mode == "winner") {
			url = "/pc/cs/winnerListData.json";
			$area = $("div#winner");
		} else {
			url = "/pc/cs/allListData.json";
			$area = $("div#allList");
		}
		
		// 전송
		$.ajax({
			async		: true,
			url			: url,
			dataType	: 'json',
			type		: 'POST',
			data		: { mode : mode , page : page , keyWord : keyWord},
			success		: function(data, textStatus, jqXHR){
				// 실패 메세지 처리			
				if(!crew.ajaxValidate(data)){ return; }
				
				//if (data.page <= 1) { $area.find("ul").empty(); }
				$area.empty();
				
				setAddArea(data);
				$area.append(data.html);
			},
			error		: function(jqXHR, textStatus, errorThrown){
			  //console.log(jqXHR.status);
			}
		});
	}
 
</script>
<c:import url="../../../include/footer.jsp"/> 
