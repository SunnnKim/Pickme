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
	      <select>
	        <option>전체보기</option>
	        <option>신입</option>
	        <option>경력</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>1차분류</div>
	      <select>
	        <option>전체보기</option>
	        <option>개발</option>
	        <option>디자인</option>
	        <option>기획/마케팅</option>
	        <option>건축</option>
	        <option>전기</option>
	      </select>
	    </div>
	    <div class="search-content">
	      <div>2차분류</div>
	      <select>
	        <option>전체보기</option>
	        <option>개발</option>
	        <option>디자인</option>
	        <option>기획/마케팅</option>
	        <option>건축</option>
	        <option>전기</option>
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
<input type="hidden" name="peopleType" value="경력">
<input type="hidden" name="job1" value="개발">
<input type="hidden" name="job2" value="웹개발자">
</form>
<!-- script -->
<script>


// 검색버튼 누름
function searchPeople(){
	$('#frm').submit();
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