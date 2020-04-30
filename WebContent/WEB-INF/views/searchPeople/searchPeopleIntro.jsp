<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    


<div class="profile-wrap">
	<div class="people-title">
  		<div class="big-title animation">우리 회사에 적합한 인재를 찾아보세요</div>
  		<div class="small-title animation">
    		픽미 기업 유료 서비스를 이용하시면<br>
    		픽미에 등록된 다양한 인재의 프로필과 이력서를 열람할 수 있습니다
  		</div>
  		<a href="/Pickme/customer/paidService.do">>> 픽미서비스보기</a>
	</div>
	<div class="search-box animation2">
	  <div class="justify">
	    <div class="search-content">
	      <div>경력구분</div>
	      <select id="career">
	        <option value=" " selected="selected">전체보기</option>
	        <option value="신입">신입</option>
	        <option value="년">경력</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>1차분류</div>
	      <select id="job1" onchange="getJob2()">
	        <option value=" " selected="selected">전체보기</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>2차분류</div>
	      <select id="job2">
	        <option value=" " selected="selected">전체보기</option>
	      </select>
	    </div>
	  </div>
	  <button class="search-btn" onclick="searchPeople()">
	    인재 찾아보기
	  </button>
	</div>
</div>
<!-- sending data -->
<form id="frm" action="/Pickme/searchPeople/searchPeopleResult.do" method="post">
	<input type="hidden" name="career">
	<input type="hidden" name="job1">
	<input type="hidden" name="job2">
	<input type="hidden" name="hashTags" value="">
</form>
<!-- script -->
<script>
// 1차분류 직군목록 가져오기
var json_url = './../util/rec-joblist.json';
$.getJSON(json_url, function(data){
	for( var i in data){
        json = JSON.stringify(data[i])
        json = JSON.parse(json);
        for( key in json ){
          $("#job1").append("<option value='"+key+"'>"+key+"</option>");
        } 
      }
})
// 2차분류 가져오기 
function getJob2(){
	var job1 = $('#job1').val();
	var job2 = [];
	 $("#job2").html("");
	 $("#job2").append("<option value=' '>전체보기</option>");
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
			$("#job2").append("<option value='"+job2[i]+"'>"+job2[i]+"</option>");
	     }
	})
}

// 검색버튼 누름
function searchPeople(){
	$('input[name=career]').val($('#career').val());
	$('input[name=job1]').val($('#job1').val());
	$('input[name=job2]').val($('#job2').val());

	if( "${isPremier}" == "true" ){
		console.log($('input[name=career]').val())
		console.log($('input[name=job1]').val())
		console.log($('input[name=job2]').val())
		$('#frm').submit();
 	}else{
 		Swal.fire({
 			  position: 'center',
 			  icon: 'error',
 			  text: '기업서비스에 가입하세요!',
 			  showConfirmButton: true,
 			  confirmButtonText: '픽미 서비스 보러가기'
 		}).then((result) => {
 			if (result.value) {
				location.href="/Pickme/customer/paidService.do";
 			}
 	 	})
	}
}



</script>
<style>
.people-title{ text-align: center; margin-top: 80px; margin-bottom: 80px; }
.people-title .big-title{ font-size: 40px; margin-bottom: 10px; }
.people-title .small-title{ line-height: 30px; font-weight: 300; margin-bottom: 10px;}
.people-title a{ color: #eaeaea; transition: all 0.2s ease-in-out;}
.people-title a:hover { color:#304edf;}

/* search-box */
.search-box{ border: 1px solid #eaeaea; margin-bottom: 150px; height: 250px; border-radius: 10px; box-shadow: 1px 0 11px 1px #eaeaea; }
.justify{ margin: 0 auto; margin-top: 30px;height: 100px; width: 700px; display: flex; justify-content: space-around;}
select { -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ } /* IE 10, 11의 네이티브 화살표 숨기기 */ select::-ms-expand { display: none; }
select { width: 200px; /* 원하는 너비설정 */ padding: .8em .5em; /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #eaeaea; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }

.search-content{ width: 200px; float: left; }
.search-content > div { margin-bottom: 15px; text-align: center; }
.search-btn{ display: block; transition: all 0.4s ease-in-out; background: #304edf; color: #fff; width: 250px; height: 50px; border-radius: 30px; margin: 30px auto; }
.search-btn:hover{ background: #1e308b; }
/* animation */
.animation {
    animation: fadein 2s;
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
}
.animation2 {
  animation: fadeinDelay 5s;
    -moz-animation: fadeinDelay 5s; /* Firefox */
    -webkit-animation: fadeinDelay 2s; /* Safari and Chrome */
    -o-animation: fadeinDelay 5s; /* Opera */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@keyframes fadeinDelay {
    0% {
        opacity:0;
    }
    60% {
        opacity:0;
    }
    100% {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}
</style>

<%@include file ="../../../include/footer.jsp" %>