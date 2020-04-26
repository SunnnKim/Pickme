<%@page import="model.SearchPeopleParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 
	List<AMemberDto> searchList = (List<AMemberDto>)request.getAttribute("searchList");
	int dataNumber = (int) request.getAttribute("dataNumber");
	SearchPeopleParam searchParam = (SearchPeopleParam) request.getAttribute("searchParam");
%>
<!-- 검색 -->
<div class="profile-wrap">
	<div class="search-box">
	  <div class="justify">
	    <div class="search-content">
	      <div>경력구분</div>
	      <select id="career">
	        <option value="">전체보기</option>
	        <option value="신입">신입</option>
	        <option value="년">경력</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>1차분류</div>
	      <select id="job1" onchange="getJob2()">
	        <option value="">전체보기</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>2차분류</div>
	      <select id="job2">
	        <option value="">전체보기</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>해시태그검색</div>
	      <div class="input-box">
	        <input type="text" id="hashTag">
	        <i class="fas fa-search" onclick="putHashtag()"></i>
	      </div>
	    </div>
	  </div>
	  <div class="tag-area">
	  </div>
	  <button class="search-btn" onclick="searchPeople()">검색하기</button>
	</div>
	<!--검색용 폼 -->
	<form id="searchForm" method="post" action="/Pickme/searchPeople/searchPeopleResult.do">
		<input type="hidden" name="career" value="">
		<input type="hidden" name="job1" value="">
		<input type="hidden" name="job2" value="">
		<input type="hidden" name="hashTags" value="">
	</form>
<!-- 검색 -->
<!-- 필터 -->
	<div class="filter-wrapper">
	  <div class="filter">
	    <a href="#">최신순</a>
	    <a href="#">경력순</a>
	  </div>
	</div>
<!-- 필터 -->	
<!-- 인재프로필 -->	
	<div class="search-contents" id="appendPeople">
<% for(int i = 0; i < searchList.size(); i++ ){
		AMemberDto dto = searchList.get(i);
%>
	  <!-- people -->
	<div class="people-box">
	  <div class="content-wrapper">
	    <div class="img-wrapper" style="margin-left: 15px;">
	    <% if( dto.getProfileName() != null ){ %>
	      <img src="/Pickme/a_mypage/imageDownload.do?filename=<%=dto.getProfileName() %>&filepath=<%=dto.getProfilePath()%>">
        <%} else {%>
        <label for="inputFile"></label>
	     <!--  <img src="../images/woman1.png"> -->
        <%} %>
	    </div>
	  </div>
	  <div class="people-info">
	    <div class="content-wrapper">
	      <div class="name"><%=dto.getName() %></div>
	      <div class="info-wrapper">
	        <div><%= dto.getJob().split(",")[0] %> / <%= dto.getJob().split(",")[1] %></div>
	        <div><%=dto.getCareer().equals("신입") ? "신입":"경력 " + dto.getCareer() %></div>
	      </div>
	      <div class="info-hashtag">
	      	<% String [] hashTag = dto.getHashtag().split(",");
	      		for(int j = 0; j < hashTag.length; j++ ){ %>
	        	<span>#<%=hashTag[j] %></span>
        	<%  } %>
	      </div>
	    </div>
	  </div>
	  <div class="people-introduce">
	    <div class="content-wrapper">
	      <div class="text-area">
	        <%=dto.getIntroduce().replaceAll("\n", "<br>") %>
	      </div>
	    </div>
	  </div>
	  <div class="people-btn">
	    <div class="content-wrapper">
	      <button class="show-btn" seq="<%=dto.getSeq()%>">
	        프로필보기
	      </button>
	      <button class="show-btn" seq="<%=dto.getSeq()%>">
	        열람요청
	      </button>
	    </div>
	  </div>
	</div>
<%}%>
	<!-- people -->
<!-- 인재프로필 -->
<!-- 더보기버튼 -->
<% if( dataNumber > 5 ) { %>
	  <div class="more-wrapper">
	    <button id="more-btn">
	      더보기
	    </button>
	  </div>
<% } %>
<!-- 더보기버튼 -->
	</div>
</div>
<script>
// 검색 
// 변수 
var tagList = [];

// 해쉬태그 입력하기 
function putHashtag(){
	// 중복태그 방지
	for( i in tagList){
		if( tagList[i] == $('#hashTag').val()){
			$('#hashTag').val("")
			return false;
		}
	}
	var tag = '<span class="tags">#' + $('#hashTag').val() + '</span>';
	$('.tag-area').append(tag)		// html 추가 
	// 입력한 태그를 리스트에 저장 
	tagList.push('%'+ $('#hashTag').val() + '%')	// 배열에 태그 넣기 
	console.log(tagList)		// 출력 
	$('#hashTag').val("")		// 인풋 초기화 
}

// 입력한 태그 삭제하기
$(document).on('click', '.tags', function( e ){
	let str = e.target.innerText.replace('#','')	// 태그데이터 빼기 
	let index = tagList.indexOf(str)				// 태그데이터 인덱스찾기 
	tagList.splice( index, 1 )						// 배열에서 해당 태그 빼기 
 	console.log(tagList)							// 출력 
	e.target.remove()								// 태그삭제 
})

// 검색하기 버튼 누름
function searchPeople(){
	$('input[name=career]').val($('#career').val());
	$('input[name=job1]').val($('#job1').val());
	$('input[name=job2]').val($('#job2').val());
	$('input[name=hashTags]').val( tagList );
	console.log($('input[name=hashTags]').val())
	$('#searchForm').submit();
}
</script>


<script>
// 변수 
var clickMoreBtn = 0;	// 더보기버튼 누름
var totalData = <%=dataNumber%>;	// 총데이터 수

// 더보기 버튼으로 데이터 더 끌고오기 
$('#more-btn').click(function(){
	clickMoreBtn = clickMoreBtn + 1 ;
	$.ajax({
		url:'moreContent.do',
		data:{
			career:"${searchParam.career}",
			job1:"${searchParam.job1}",
			job2:"${searchParam.job2}",
			contentNumber: clickMoreBtn,
		},
		success: function( data ){
			console.log(data)
			totalData += data.searchList.length;	// 총 데이터 수 늘리기 
			if( <%=dataNumber %> <= totalData){		// 더보기 버튼 숨기기 
				$('.more-wrapper').hide();
			}
			var list = data.searchList;
			// 데이터 추가하기 
			for( var people of list ){
				var str = '<div class="people-box">' + 
				  			'<div class="content-wrapper">' +
				    			'<div class="img-wrapper" style="margin-left: 15px;">'
			 	if( people.profileName != "" ){
						str += '<img src="/Pickme/a_mypage/imageDownload.do?filename='+ people.profileName + '&filepath=' + people.profilePath + '">'
				}else str += '<label for="inputFile"></label>'
				str += '</div></div>'

				// 일반회원 정보 + 해쉬태그
				str += '<div class="people-info">' +
							'<div class="content-wrapper">' +
				 			'<div class="name">' + people.name + '</div>' +
				 				'<div class="info-wrapper">' + 
				 				'<div>' + people.job.split(",")[0] + '/' + people.job.split(",")[1] + '</div>' +
				 				'<div>';
	        	
	        	if( people.career != '신입') str += '경력 ';
	        	str += people.career + '</div></div>'
	        	str += '<div class="info-hashtag">';
	        	var hashTag = people.hashtag.split(',');
	        	for( var j in hashTag ){
					str += '<span>#' + hashTag[j] + '</span>'
		        }
	        	str += '</div></div></div>'
				// 자기소개 + 프로필 열람요청 
				str += '<div class="people-introduce">' + 
	    					'<div class="content-wrapper">' +
	      						'<div class="text-area">' + people.introduce.replace(/\n/gi, "<br>") + '</div>' +
	    					'</div></div>' +
			   			'<div class="people-btn">' +
	    					'<div class="content-wrapper">' + 
	      						'<button class="show-btn" seq="' + people.seq + '">프로필보기</button>' +
	      						'<button class="show-btn" seq="' + people.seq + '">열람요청</button>' +
	      						'</div></div></div>';
	  	      $('#appendPeople').append(str);
			}
			
			
		}, error: function( err ){
			alert("error")
			console.log(err)
		}
	})
})

</script>
<script>
// 초기화 작업
// 검색어 가져오기
$('#career').val("<%=searchParam.getCareer().replace("%", "")%>")
//1차분류 직군목록 가져오기
var json_url = './../util/rec-joblist.json';
$.getJSON(json_url, function(data){
	for( var i in data){
        json = JSON.stringify(data[i])
        json = JSON.parse(json);
        for( key in json ){
         console.log(key);
         if( key == "<%=searchParam.getJob1().replaceAll("%", "")%>"){
	          $("#job1").append("<option value='"+key+"' selected>"+key+"</option>");
	          getJob2();
          }else {
	          $("#job1").append("<option value='"+key+"'>"+key+"</option>");
          }
        } 
      }
})
// 2차분류 가져오기 
function getJob2(){
	var job1 = $('#job1').val();
	var job2 = [];
	 $("#job2").html("");
	 $("#job2").append("<option value=''>전체보기</option>");
	$.getJSON(json_url, function(data){
		for( var i in data){
	        json = JSON.stringify(data[i])
	        json = JSON.parse(json);
	        for( key in json ){
		        if( key == job1 ){
			         job2 = json[key]
			         break;
		        }
	        } 
	      }
	     for( var i in job2){
	    	 if( job2[i] == "<%=searchParam.getJob2().replaceAll("%", "")%>"){
				$("#job2").append("<option value='"+job2[i]+"' selected>"+job2[i]+"</option>");
	          }else {
				$("#job2").append("<option value='"+job2[i]+"'>"+job2[i]+"</option>");
	          }
	     }
	})
}
//enter 적용
function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
           //  putHashtag();	// 해쉬태그 입력하기
        }
}
const intervalCall1000 = intervalCall(1000)
/* hashtag */
$("#hashTag").keyup(function(e){ 
	 if(e.keyCode == 13){
		// 인터벌 함수 실행 
		 intervalCall1000(() => {
			 putHashtag();
		   });
	    }
 });
//enter 중복클릭 방지
// interval 시간 안에 다시 호출된 함수 콜은 무시한다
function intervalCall(interval){
  let elapsed = true
  return (fn) => {
    if(!elapsed){
      return    // 마지막 호출 후 제한된 경과시간이 지나지 않은 경우 리턴
    }
    elapsed = false
    fn()
    setTimeout(() => {elapsed = true}, interval)
  }
}
</script>
<style>
/* search-box */
.search-box{ border: 1px solid #eaeaea; margin-bottom: 0px; height: 250px; }
.justify{ margin: 0 auto; margin-top: 30px;height: 100px; width: 900px; display: flex; justify-content: space-around;}
select { width: 200px; /* 원하는 너비설정 */ padding: .8em .5em; /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #eaeaea; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
.search-content{  position: relative; }
.search-content > div { margin-bottom: 15px; text-align: center;}
.search-content .input-box{ position: relative;}
.search-content .input-box input{ display: block; height: 50px; width: 250px; padding-left: 15px; padding-right: 45px;}
.search-content .fa-search{ position: absolute; right:15px; top:12px; font-size: 25px; color: #aaa; }
.search-content .fa-search:hover{ color: #333; }
/* hashtag area */
.tag-area{ width: 900px; margin: 0 auto; text-align: center; }
.tag-area span { cursor: pointer; display: inline-block; padding: 5px 15px; border-radius: 20px; margin: 10px 3px; background: #bbb; color: #fff; font-size: 13px; font-weight: 300; }
.tag-area span:hover { background: #304edf; }
/* search-button */
.search-btn{ display: block; transition: all 0.4s ease-in-out; background: #304edf; color: #fff; width: 250px; height: 30px; border-radius: 30px; margin: 10px auto; }
.search-btn:hover{ background: #1e308b; }

/* filter-area */
.filter-wrapper{ margin: 20px 0;  }
.filter-wrapper a{ margin: 0 10px; }
.filter-wrapper a:hover{ color: #304edf; }

/* searching-area */
.search-contents{ min-height: 280px; margin-bottom: 50px; }
.search-contents .people-box{ padding: 0 10px; border: 1px solid #eaeaea; height: 200px; margin-bottom: 60px;display: flex; justify-content: space-around; }
.content-wrapper{ height: 100%; display: flex; flex-direction: column; justify-content: center; }
/* 로고이미지 */
.search-contents .people-box .img-wrapper{ border: 1px solid #eaeaea; width: 150px; height: 150px; overflow: hidden; border-radius: 1000px;  }
.search-contents .people-box .img-wrapper img{ width: 150px; height: 150px; }
/* 인재소개 */
.people-info{ text-align: center; width: 180px;}
.people-info .content-wrapper .name{ font-size: 30px; display: block;  }
.people-info .info-wrapper{ font-size: 15px; }
.people-info .content-wrapper .info-wrapper{ }
.people-info .content-wrapper .info-hashtag span{ background-color: #1e308b; color: #fff; font-weight: 300; font-size: 10px;
  display: inline-block; font-size: 13px; border: 1px solid; padding: 5px 3px;  margin: 3px 0; border-radius: 10px;}
/* 자기소개 */
.search-contents .people-box .people-introduce { padding: 0 10px; width: 500px; }
.search-contents .people-box .people-introduce .text-area{ display: inline-block; border: 1px solid #eaeaea; padding: 10px 5px; height: 100px; overflow:hidden; white-space: nowrap;text-overflow: ellipsis;
  white-space: normal; line-height: 1.5;  text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical;
 }
.search-contents .people-box .people-btn { width: 200px;}
.search-contents .people-box .people-btn .show-btn { background: #304edf; width: 150px; height: 50px; margin: 5px auto; line-height: 50px; color: #fff; text-align: center; } 

/* 더보기버튼 */
.more-wrapper { text-align: center;}
.more-wrapper #more-btn{ display: inline-block; background: #304edf; color:#fff; width: 200px; height: 50px; margin: 0 auto;}
</style>

<%@include file ="../../../include/footer.jsp" %>