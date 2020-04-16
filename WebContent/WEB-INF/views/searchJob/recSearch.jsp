
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더호출 -->
<c:import url="../../../include/header.jsp"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
	<div class="jobSubMenu">
<!-- 		<div class="jobsub" id="job_sub">
			<label name="occ_title"></label>
		</div> -->
	</div>
    <div class="filter_wrap">
          <ul class="filter_ul clfix">
            <li><span><strong>최신순</strong></span></li>
            <li>
              <select class="" name="career">
                <option value="">경력</option>
                <option value="전체">전체</option>
                <option value="신입">신입</option>
                <option value="경력">경력</option>
              </select>
             </li>
          </ul>
        </div><!-- div.filter_wrap -->
        <div class="cont">
 <ul class="pmList clfix">
          	<c:choose>
          		<c:when test="${empty recList }">
					<div style="text-align:center; position:relative; margin-top:4wndl0px;">
          			<p style="position:absolute; top:0; left:0; width:100%; font-size:30px;">등록된 공고가 없습니다.</p>
					<img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width:60%;">
				</div>
				</c:when>
				<c:when test="${not empty recList }">
					   <ul class="pmList clfix">
						<c:forEach items="${recList }" var="dto" varStatus="rs">
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
<script>
/* 페이지 이동 */
function goPage(pn){	
  location.href="recSearch.do?pageNumber=" + pn;
	
}
 // 직군 카테고리
 var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
	var duty; //직무
  
    var json;
    var jsonArr = [];
    $.getJSON(json_url, function(data){
        for( var i in data){
          json = JSON.stringify(data[i])
          json = JSON.parse(json);
          jsonArr.push(json)
          for( key in json ){
           // console.log(key);
            $("#joblist").append("<li><span><a href='#none'>"+key+"</a></span></li>");
           /*  var jobdiv = document.createElement("div");
            jobdiv.attr("class","jobsub");
            var joblabel = document.createElement("label");
            joblabel.attr("class","occ_title");
            var jobtext = document.createTextNode(key);

            $(".jobSubMenu").appendChild(jobdiv);
            $(".jobsub").appendChild(joblabel);
            $(".occ_title").appendChild(jobtext); */
        
   /*          $("#job_sub").append(key+"<ul><li>"+json[key]+"</li></ul>");
            $(".jobSubMenu").hide();
 */
         
            // console.log("key:"+key+", value:"+json[key]);
            keyArr.push(key);
            valArr.push(json[key]);
            // map.put(key, json[key]);
          }
        }
            // console.log(jsonArr)
    });


  
  

</script>
<c:import url="../../../include/footer.jsp"/> 