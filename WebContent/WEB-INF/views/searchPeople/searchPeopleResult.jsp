<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<!-- 검색 -->
<div class="profile-wrap">
	<div class="search-box">
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
	    <div class="search-content">
	      <div>해시태그검색</div>
	      <div class="input-box">
	        <input type="text" id="hashTag">
	        <i class="fas fa-search"></i>
	      </div>
	    </div>
	  </div>
	  <div class="tag-area">
	    <span># 웹개발자</span>
	    <span># 웹개발자</span>
	    <span># 웹개발자</span>
	    <span># 웹개발자</span>
	    <span># 웹개발자</span>
	  </div>
	  <button class="search-btn" onclick="searchPeople()">검색하기</button>
	</div>
	<!--검색용 폼 -->
	<form id="searchForm" method="post" action="/Pickme/searchPeople/searchPeopleResult.do">
		<input type="hidden" name="peopleType" value="신입">
		<input type="hidden" name="job1" value="디자인">
		<input type="hidden" name="job2" value="제품디자인">
		<input type="hidden" name="hashTags" value="포토샵%일러스트%스케치업">
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
	<div class="search-contents">
	  <!-- people -->
	<div class="people-box">
	  <div class="content-wrapper">
	    <div class="img-wrapper" style="margin-left: 15px;">
	      <img src="../images/woman1.png">
	    </div>
	  </div>
	  <div class="people-info">
	    <div class="content-wrapper">
	      <div class="name">이태오</div>
	      <div class="info-wrapper">
	        <div>IT / 웹개발자</div>
	        <div>경력</div>
	      </div>
	      <div class="info-hashtag">
	        <span>#Javascript</span>
	        <span>#웹개발자</span>
	        <span>#프론트엔드</span>
	      </div>
	    </div>
	  </div>
	  <div class="people-introduce">
	    <div class="content-wrapper">
	      <div class="text-area">
	        7년차 프론트엔드 개발자 입니다.<br>
	        현재 프리랜서로 지내고 있으며 외주 및 헤드헌팅을 받고 있습니다.<br>
	        ...
	      </div>
	    </div>
	  </div>
	  <div class="people-btn">
	    <div class="content-wrapper">
	      <button class="show-btn">
	        프로필보기
	      </button>
	      <button class="show-btn">
	        열람요청
	      </button>
	    </div>
	  </div>
	</div>
	<!-- people -->
<!-- 인재프로필 -->
<!-- 더보기버튼 -->
	  <div class="more-wrapper">
	    <button id="more-btn">
	      더보기
	    </button>
	  </div>
<!-- 더보기버튼 -->
	</div>
</div>


<script>
// 검색하기 버튼 누름
function searchPeople(){
	$('#searchForm').submit();
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
.tag-area span { cursor: pointer; display: inline-block; padding: 5px 15px; border-radius: 20px; margin: 10px 3px; background: #eaeaea; color: #fff; font-size: 13px; font-weight: 300; }
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
.search-contents .people-box .img-wrapper{ border: 1px solid; width: 150px; height: 150px; overflow: hidden; border-radius: 1000px;  }
.search-contents .people-box .img-wrapper img{ width: 150px; }
/* 인재소개 */
.people-info{ text-align: center; width: 180px;}
.people-info .content-wrapper .name{ font-size: 30px; display: block;  }
.people-info .info-wrapper{ font-size: 15px; }
.people-info .content-wrapper .info-wrapper{ }
.people-info .content-wrapper .info-hashtag span{ background-color: #1e308b; color: #fff; font-weight: 300; font-size: 10px;
  display: inline-block; font-size: 13px; border: 1px solid; padding: 5px 3px;  margin: 3px 0; border-radius: 10px;}
/* 자기소개 */
.search-contents .people-box .people-introduce { padding: 0 10px; width: 500px; }
.search-contents .people-box .people-introduce .text-area{ border: 1px solid #eaeaea; padding: 10px; }
.search-contents .people-box .people-btn { width: 200px;}
.search-contents .people-box .people-btn .show-btn { background: #304edf; width: 150px; height: 50px; margin: 5px auto; line-height: 50px; color: #fff; text-align: center; } 

/* 더보기버튼 */
.more-wrapper { text-align: center;}
.more-wrapper #more-btn{ display: inline-block; background: #304edf; color:#fff; width: 200px; height: 50px; margin: 0 auto;}
</style>

<%@include file ="../../../include/footer.jsp" %>