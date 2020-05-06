<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f02f285c91592b3506f84c3a3ce66d20"></script>
    
<!-- 기업회원 정보 불러오기  --> 
<%
   // 컨트롤러에서 받아온 기업회원 정보 부분 
   CMemberDto memberInfo = (CMemberDto) request.getAttribute("cMember");
   AMemberDto member1 = (AMemberDto) request.getAttribute("aMember");

   // 컨트롤러에서 받아온 주소 조각
   
   String zipcode = (String)request.getAttribute("realAddress[0]");   // 우편번호
   String basicAdd = (String)request.getAttribute("realAddress[1]");   // 기본주소
   String detailAdd = (String)request.getAttribute("realAddress[2]");   // 상세주소 
   
   
%> 
    
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<style>
/* 타이틀영역 */
.c_introInfo {padding-left:277px;width: 1050px;padding-bottom:75px;padding-top:50px;border-bottom:1px solid #cacaca;}
.c_introInfo .tit {font-size:60px;margin-bottom:51px;}

/* 로고 */
.c_introInfo .tit img {text-align:center;width: 120px;height: 120px;margin-right:30px;}

/* 슬라이드 이미지 */
.swiper-container{max-height:500px;}
.swiper-slide img{width:100%;height:500px;}

/* 정보 영역 */
.companyInfo {padding-left:350px;margin-top:100px;}
.number {font-size:50px;font-weight:bold;color:#4f6eff;padding-right:30px;}
.number .field{font-size:31px;padding-left:20px;font-weight:normal;color:#000;}
.companyInfo .content1{padding-left: 93px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content2{padding-left: 93px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content3{padding-left: 93px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content4{padding-left: 93px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content5{padding-left: 93px;font-size:20px; font-weight:normal; color:"#000";}

.followBtnWrap {margin-top: 21px;}
.followBtnWrap span {text-align: center;height: 93px;background-color: #4f6eff;color: #fff;line-height: 12px;font-size: 38px;cursor: pointer;padding-left: 100px;padding-right: 100px;margin-left: 121px;}
.followBtnWrap span:hover {background-color:#6681ff;}
.followBtnWrap span i {margin-left: 10px;display: none;}
.followBtnWrap span input {width: 0;height: 0;display:none;}

/* 수정버튼 */
.updateBtn {font-size: 22px;padding-bottom: 8px;color: #fff;}

/* 수정 버튼 눌렀을 때 */
.updateBtn:focus { outline:none;}

/* 해시태그 */
.hash{width:1050px;text-align:center;padding-left:300px;}
.hash .hashTags span{margin-left: 20px;margin-top: 20px;color: #6E6E6E;font-size:23px;}

/* 기업 소개 */
h4.h4_introduce{margin-top:100px; margin-left:50px;margin-bottom:15px;font-size:31px;}
.introduce{background-color:#e0e0e0; font-size:20px;/* margin-left:100px; */ padding-left:50px; padding-top: 50px; padding-right:50px; padding-bottom:50px;}

</style>




<script>
</script>

</head>



<body>

<!------------------------------------ 슬라이드 영역 ---------------------------------------------->

<div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
          <img src = "https://gorumors.com/wp-content/uploads/2019/04/Checkout.png">
      </div>
      <div class="swiper-slide">
          <img src = "https://buffer.com/resources/wp-content/uploads/2017/02/The-Complete-Guide-to-Instagram-Ads-Featured-image@2x-1024x576.png">
      </div>
      <div class="swiper-slide">
          <img src="https://techcrunch.com/wp-content/uploads/2018/06/instagram-time-well-spent-1.png?w=730&crop=1" alt="">
      </div>
    </div>
    
      <!-- If we need pagination -->
   <div class="swiper-pagination"></div>

   <!-- If we need navigation buttons -->
   <div class="swiper-button-prev"></div>
   <div class="swiper-button-next"></div>
   
   <div class="swiper-scrollbar"></div>
</div>


<!---------------------------------- 로고, 회사명 영역 --------------------------------------------->

<div class="c_introInfo">
  <div class="tit">
     <c:choose>
		<c:when test="${cMember.logoName eq null || cMember.logoName eq ''}">
			<img src="https://theregister.al/wp-content/themes/arkahost/assets/images/default-680x600.jpg">
			<h3 style="color:#000;float:right;padding-right:305px;">${cMember.name } </h3> 
			<br> 
			<span class="hashTags" style="font-size:23px;color:#848484;float:right;padding-right:442px;">
			</span>
		</c:when>
		
		<c:when test="${cMember.logoName ne null }">
			<img src="/Pickme/c_mypage/imageDownload.do?filename=${cMember.logoName }&filepath=${cMember.logoPath }" alt="logo"> 
			<h3 style="color:#000;float:right;padding-right:305px;">${cMember.name } </h3> 
			<br> 
			<span class="hashTags" style="font-size:23px;color:#848484;float:left;padding-left:149px;margin-bottom:50px;margin-right:20px;">
			</span> 
		</c:when>
     </c:choose>
     </div>
     
<!--------------------------------- 팔로우버튼, 수정버튼 영역 ----------------------------------------->
  <div class="followBtnWrap">
	<label>
	  <% if(member != null) { %>
	     <span>팔로우<i class="fas fa-check"></i> <input type="checkbox"></span>
	  <% } else if(memberInfo != null) { %>
	       <span><i class="fas fa-check"></i><button type = "button" class="updateBtn" onclick = "location.href='goUpdate.do?seq=<%=memberInfo.getSeq()%>'"> 수정 </button></span>
	  <% } %>               
    </label>
</div>
</div>

  <script>
  $(".followBtnWrap label span input[type='checkbox']").click(function(){
    if($(this).is(":checked")){
     $('.followBtnWrap span i').show();
    }else {
      $('.followBtnWrap span i').hide();
    }

  });
  </script>

  
  <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
  
  <script>
  var mySwiper = new Swiper('.swiper-container', {
	  speed: 700,
	// 슬라이드를 버튼으로 움직일 수 있습니다.
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	    
	// 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
	  pagination: {
	    el: '.swiper-pagination',
	    type: 'bullets',
	  },

	// 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
	  scrollbar: {
	    el: '.swiper-scrollbar',
	    draggable: true,
	  },
	    
	// 3초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
	  autoplay: {
	    delay: 3000,
	  },
	});
  </script>


<!------------------------------------ 기업 정보 영역 ------------------------------------------->

<div class="companyInfo">
	<span class="number"> 01 <span class="field"> 기업분야 </span></span>
	<div class="content1">${cMember.department }</div>
	<br>
	<span class="number"> 02 <span class="field"> 규모 </span></span>
	<div class="content2">${cMember.type }</div>
	<br>
	<span class="number"> 03 <span class="field"> 대표자 성명 </span></span>
	<div class="content3">${cMember.president }</div>
	<br>
	<span class="number"> 04 <span class="field"> 전화번호 </span></span>
	<div class="content4">${cMember.tel }</div>
	<br>
	<span class="number"> 05 <span class="field"> 주소 </span></span>
	<div class="content5">${cMember.address }</div>
</div>

<div class="rec-location">
<div id="map" style="width:500px;height:400px;"></div>
</div>
<script>
var container = document.getElementById('rec-location'); // 지도와 로드뷰를 감싸고 있는 div 입니다
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

//지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
var placePosition = new kakao.maps.LatLng(33.450701, 126.570667);

// 지도 옵션입니다 
var mapOption = {
    center: placePosition, // 지도의 중심좌표 
    level: 3 // 지도의 확대 레벨
};

// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${cMember.address }', function(result, status) {
	  // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
       
        map.setCenter(coords);
    } 
});
</script>


<!-------------------------------- 기업 소개 영역 ------------------------------------------------->

<div class="company_introduce">
	<h4 class="h4_introduce"> 회사 소개 </h4>
	<div class="introduce">
		<c:if test="${cMember.introduce eq null || cMember.introduce eq ''}">
			등록된 소개가 없습니다.
		</c:if>
		<c:if test="${cMember.introduce ne null || cMember.introduce ne ''}">
			${cMember.introduce }
		</c:if>
	</div>
</div>


<script>
$(document).ready(function() {

// db에서 값 가져오기
   var hashstr = '${cMember.hashTag}';

   var hashdbArray = hashstr.split(',');
   var hashdb01 = hashdbArray[0]
   var hashdb02 = hashdbArray[1]
   var hashdb03 = hashdbArray[2]

   console.log("hashstr = " + '${cMember.hashTag}');

   console.log("해쉬태그1: " + hashdb01);
   console.log("해쉬태그2: " + hashdb02);
   console.log("해쉬태그3: " + hashdb03);

   var hstr01 = "<span style='margin-right:20px;'>#"+hashdb01+"<input type='hidden' name='hashTag' value='"+hashdb01+"'></span>"
   var hstr02 = "<span style='margin-right:20px;'>#"+hashdb02+"<input type='hidden' name='hashTag' value='"+hashdb02+"'></span>"
   var hstr03 = "<span style='margin-right:20px;'>#"+hashdb03+"<input type='hidden' name='hashTag' value='"+hashdb03+"'></span>"

   if(hashdb01 != undefined) {
		$(".hashTags").append(hstr01);
   }
   if(hashdb02 != undefined) {
		$(".hashTags").append(hstr02);
   }
   if(hashdb03 != undefined) {
		$(".hashTags").append(hstr03);
   }
   
})
</script>





</body>
</html>

<%@include file ="../../../include/footer.jsp" %>







