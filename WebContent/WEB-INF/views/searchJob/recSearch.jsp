
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!-- 헤더호출 -->
<c:import url="../../../include/header.jsp"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
<!-- <script>
$(document).ready(function(){
	var getOcc = '${occ}';
	//console.log("getOcc: "+getOcc);
	if(getOcc==""){
		 $(".location").children(":last").text("전체보기");
	}else if(getOcc != ""){
	    $(".pageTit").append(" / "+getOcc);
	    $(".location").children(":last").text(getOcc);
	
	}

	
});
</script> -->
	<div class="jobSubMenu">
<!-- 		<div class="jobsub" id="job_sub">
			<label name="occ_title"></label>
		</div> -->
	</div>
	<div class="recTop">
	    <div class="filter_wrap">
	          <ul class="filter_ul clfix">
	           <li>
	              <select class="sorting" name="sorting" onchange="selectSorting(this)">
	                <option value="newest" <c:if test="${sorting eq 'newest'}">selected</c:if>>최신순</option>
	                <option value="popular" <c:if test="${sorting eq 'popular'}">selected</c:if>>인기순</option>
	              </select>
	           </li>
	            <li> 
	              <select class="career" name="comJobType" onchange="selectCareer(this)">
	                <option value="defalut" <c:if test="${empty comJobType}">selected</c:if>>전체</option>
	                <option value="all" <c:if test="${comJobType eq 'all'}">selected</c:if>>경력무관</option>
	                <option value="new" <c:if test="${comJobType eq 'new'}">selected</c:if>>신입</option>
	                <option value="career" <c:if test="${comJobType eq 'career'}">selected</c:if>>경력</option>
	              </select>
	             </li>
	          </ul>
	     </div><!-- div.filter_wrap -->    
	    <!-- 검색창 -->
		<div class="searchTop">
			<div class="recSearch">
				<c:if test="${not empty sKeyword}">
				<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
					placeholder="" value="${sKeyword }">
				</c:if>
				<c:if test="${empty sKeyword}">
				<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
					placeholder="검색어를 입력해주세요." value="">
				</c:if>
				<button type="button" class="btnSearch" onclick="searchAction()">
					<span>검색</span>
				</button>
			</div>
		</div>
      </div>
  
        
        <div class="cont">

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
 // 직군 카테고리
 var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
	var duty; //직무

	var getOcc = '${occ}';
	if(getOcc==""){
		 $(".location").children(":last").text("전체보기");
	}else if(getOcc != ""){
	    $(".pageTit").append("<i class='fas fa-chevron-right' style='color: #ccc;font-size: 22pt;'></i> "+getOcc);
	    $(".location").children(":last").text(getOcc);
	
	}
	
    var json;
    var jsonArr = [];
    $.getJSON(json_url, function(data){
        for( var i in data){
          json = JSON.stringify(data[i])
          json = JSON.parse(json);
          jsonArr.push(json)
          for( key in json ){
           // console.log(key);
            $("#joblist").append("<li><a href='recSearch.do?occ="+key+"'><span>"+key+"</span></a></li>");
          } //for
        }//for
        
       if(getOcc != ""){
           $("#joblist").empty();
           //console.log("js getOcc: "+ getOcc);
           for( arr of jsonArr ){
               for(key in arr){
                   if( key.trim() == getOcc.trim() ){
                     for( i = 0; i < arr[key].length; i++ ){
                       //console.log("길이: "+arr[key].length);
	                   //console.log("arr[key]: "+arr[key][i]);
                       $("#joblist").append("<li><a href='recSearch.do?occ="+key+"&job="+arr[key][i]+"'><span>"+arr[key][i]+"</span></a></li>");

                     }//for
                    
                   }//if
               }//for
             }//for
           }//if
           
    }); //.getJSON

    //필터링 최신순
    function selectSorting(sel){
    	var sKeyword = "${sKeyword}",
    	occ = "${occ}",
    	job = "${job}",
    	comJobType = "${comJobType}";
  
    	var linkStr="recSearch.do?sorting="+sel.value;
		if(sKeyword != ""){
			linkStr+="&sKeyword="+sKeyword;
		}
		if( occ != "" ){  
    		linkStr+="&occ="+occ;
    	} 
    	if (job != "") {
    		linkStr+="&job="+job;
        }
        if (comJobType != ""){
        	linkStr+="&comJobType="+comJobType;
        } 
	        location.href=linkStr;
    }

    //필터링 경력
    function selectCareer(sel){

    	var sKeyword = "${sKeyword}",
    	occ = "${occ}",
    	job = "${job}",
    	sorting = "${sorting}";
  
    	var linkStr="recSearch.do?comJobType="+sel.value;
		if(sKeyword != ""){
			linkStr+="&sKeyword="+sKeyword;
		}
		if( occ != "" ){  
    		linkStr+="&occ="+occ;
    	} 
    	if (job != "") {
    		linkStr+="&job="+job;
        }
        if (sorting != ""){
        	linkStr+="&sorting="+sorting;
        } 
      
	    location.href=linkStr;
	
    }
    

    /* 검색 */
    function searchAction(){
        var sKeyword = $("#_keyword").val().trim(),
        occ = "${occ}",
        job = "${job}",
        comJobType = "${comJobType}",
        sorting = "${sorting}";

    	if(sKeyword == null || sKeyword == ""){
    		Swal.fire({
    			  icon: 'error',
    			  text: '검색어를 입력해주세요.'
    		})
    	} else{
    		var linkStr="recSearch.do?pageNumber=0&sKeyword=" + sKeyword;
    		if( occ != "" ){  
        		linkStr+="&occ="+occ;
        	} 
        	if (job != "") {
        		linkStr+="&job="+job;
            }
            if (comJobType != ""){
            	linkStr+="&comJobType="+comJobType;
            } 
            if (sorting != ""){
            	linkStr+="&sorting="+sorting;
            }
    		
            location.href=linkStr;
    	} 

    }	
    $("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });

    /* 페이지 이동 */
    function paging(pn){	
    	var sKeyword = "${sKeyword}",
    	occ = "${occ}",
    	job = "${job}",
    	comJobType = "${comJobType}",
    	sorting = "${sorting}";
    	
    	var linkStr="recSearch.do?pageNumber="+pn;
		if(sKeyword != ""){
			linkStr+="sKeyword="+sKeyword;
		}
		if( occ != "" ){  
    		linkStr+="&occ="+occ;
    	} 
    	if (job != "") {
    		linkStr+="&job="+job;
        }
        if (comJobType != ""){
        	linkStr+="&comJobType="+comJobType;
        } 
        if (sorting != ""){
        	linkStr+="&sorting="+sorting;
        }
	        location.href=linkStr;
    	
    	
    }
</script>
<c:import url="../../../include/footer.jsp"/> 