
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          	<c:if test="${empty recList }">
					<h1>리스트없음</h1>
			</c:if>
			<c:forEach items="${recList }" var="dto" varStatus="rs">
				<li><a href="recDetail.do?seq=${dto.seq }">
	              <div class="img">
	               <img src="filedownload.do?filename=1586828236375__rec-detail-testimg2.jpg&filepath=/upload/recruit/" alt="엑박">
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