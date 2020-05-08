<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<%@include file="../../../../api/kakaoMap.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 	
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<style>
/* 타이틀영역 */
.c_introInfo {width: 1050px;padding-bottom:40px;padding-top:50px;border-bottom:1px solid #a2a2a2;}
.c_introInfo .tit {font-size:60px;margin-bottom:51px;}

.logoArea{text-align:center;}

/* 로고 */
.c_introInfo .logoArea img {text-align:center;width: 120px;height: 120px;margin-right:30px;border:1px solid #000;display:inline-block;}

/* 기업명 */
.c_introInfo .logoArea h3 {font-size:68px;display:inline-block;line-height:60px;}
.c_introInfo .logoArea h5 {display:inline-block;line-height:60px;}

/* 슬라이드 이미지 */
.swiper-container{max-height:500px;}
.swiper-slide img{width:100%;height:500px;}

/* 정보 영역 */
.companyInfo {padding-left:350px;margin-top:100px;margin-bottom:90px;}
.number {font-size:66px;font-weight:bold;color:#4f6eff;padding-right:30px;}
.number .field{font-size:31px;padding-left:51px;font-weight:normal;color:#000;}
.companyInfo .content1{padding-left: 140px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content2{padding-left: 141px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content3{padding-left: 141px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content4{padding-left: 141px;font-size:20px; font-weight:normal; color:"#000";}
.companyInfo .content5{padding-left: 141px;font-size:20px; font-weight:normal; color:"#000";}

.followBtnWrap {margin-top: 21px;}
.followBtnWrap span {text-align: center;height: 93px;background-color: #4f6eff;color: #fff;line-height: 12px;font-size: 38px;cursor: pointer;padding-left: 100px;padding-right: 100px;margin-left: 121px;}
.followBtnWrap span:hover {background-color:#6681ff;}
.followBtnWrap span i {margin-left: 10px;display: none;}
.followBtnWrap span input {width: 0;height: 0;display:none;}

.c_introInfo .tit label span.updateSpan {background-color:#4f6eff;float:right;margin-top:58px;margin-right:200px;}
.c_introInfo .tit label span.a {font-size: 24px;margin-right: 200px;margin-top: 43px;float: right;background-color: 4f6eff;padding-left: 47px;padding-top: 6px;padding-bottom: 8px;padding-right: 48px;height: 50px;color: #fff;}
.c_introInfo .tit label span i {margin-left:10px; display:none;}
.c_introInfo .tit label span input{display:none;}
/* 수정버튼 */
.c_introInfo .tit label span.updateSpan button {width:146px;}

/* 수정버튼 hover */
/* .updateBtn:hover{background-color:#0d79fc;} */

.btnClass{text-align:right;margin-right:123px;}
/* 수정버튼 */
.updateBtn {font-size:22px;width:100px;height:50px;background-color:#4f6eff;color:#fff;text-align:center;}

/* 수정 버튼 눌렀을 때 */
.updateBtn:focus { outline:none;}

/* 해시태그 */
.c_introInfo .hashArea .hashTags {}
.hash{width:1050px;text-align:center;padding-left:300px;}
.hash .hashTags span{margin-left: 20px;margin-top: 20px;color: #6E6E6E;font-size:23px;}

/* 기업 소개 */
h4.h4_introduce{margin-top:100px; margin-left:50px;margin-bottom:15px;font-size:31px;}
.introduce{background-color:#e0e0e0; font-size:20px;/* margin-left:100px; */ padding-left:50px; padding-top: 50px; padding-right:50px; padding-bottom:50px;}

/* 지도 */
.rec-location{height:500px;}

</style>




<script>
</script>

</head>



<body>



<!------------------------------------ 슬라이드 영역 ---------------------------------------------->

<div class="swiper-container">
    <div class="swiper-wrapper">
    	<c:choose>
	    	 	<c:when test="${not empty fileslist }">
         		 <c:forEach var="dto" items="${fileslist }" varStatus="rs">
	    			<div class="swiper-slide">
	    				<img src = "imageDownload.do?filename=${dto.newname }&filepath=/upload/c_mypage/">
      			</div>
    				</c:forEach>
	    		
      <!-- If we need pagination -->
   <!-- <div class="swiper-pagination"></div>

   If we need navigation buttons
   <div class="swiper-button-prev"></div>
   <div class="swiper-button-next"></div> -->
   
   <div class="swiper-scrollbar"></div>
   
	    	   </c:when>
	    	   <c:otherwise>
	    	   		<div class="swiper-slide">
	    				<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FCvY2h%2FbtqDY08TOZf%2F1fh9lrAA0aKAw6ND5VhED1%2Fimg.jpg">
      			</div>
      			<div class="swiper-slide">
	    				<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FCvY2h%2FbtqDY08TOZf%2F1fh9lrAA0aKAw6ND5VhED1%2Fimg.jpg">
      			</div>
      			<div class="swiper-slide">
	    				<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FCvY2h%2FbtqDY08TOZf%2F1fh9lrAA0aKAw6ND5VhED1%2Fimg.jpg">
      			</div>
      			
      			<!-- If we need pagination -->
   				<!-- <div class="swiper-pagination"></div> -->
   				<div class="swiper-scrollbar"></div>
   				
	    	   </c:otherwise>
	    	</c:choose>
    </div>
</div> 


<!---------------------------------- 로고, 회사명, 팔로우, 수정버튼 영역 --------------------------------------------->

<div class="row">
   <div class="col-3"> 
	  <c:choose>
	  	 <c:when test="${cMember.logoName eq null || cMember.logoName eq ''}">
	  	 	 <img style="margin-left: 250px;border: 1px solid #cecece;width: 150px;height: 150px;margin-top: 34px;" src="https://theregister.al/wp-content/themes/arkahost/assets/images/default-680x600.jpg">
	  	 </c:when>
	  	 
	  	 <c:when test="${cMember.logoName ne null }">
	  	 	 <img style="margin-left: 250px;border: 1px solid #cecece;width: 150px;height: 150px;margin-top: 34px;" src="/Pickme/c_mypage/imageDownload.do?filename=${cMember.logoName }&filepath=${cMember.logoPath }" alt="logo">
	  	 </c:when>
	  </c:choose>   
   </div>
   <div class="col-6">
         <div class="row" style="width:1000px;"> 
         	<div class= "col-12"> 
         		<h3 style="margin-left: 162px;margin-top:50px;font-size:66px;">${cMember.name }</h3>
         	</div>
         </div>
         
         <div class="row" style="width:1000px;"> 
         	<div class="col-12" style="font-size:24px;margin-left:165px;">
         		<h5 style="margin-top:10px;" class="hashTags"></h5>
         	</div>
         </div>
   </div>
   
</div>





<div class="c_introInfo">

  
  
  <div class="btnClass"> 
	<label style="line-height: 48px;font-size: 22px;width: 150px;height: 50px;color: #fff;text-align: center;background-color: #4e6fff;">			
	  <% if(member != null) { %>
	     <span class="a">팔로우<i class="fas fa-check" style="margin-left:5px;"></i> <input type="checkbox" style="display:none;"></span>
	  <% } else if(memberInfo != null) { %>
	       <span class="updateSpan"><button type = "button" class="updateBtn" onclick = "location.href='goUpdate.do?seq=<%=memberInfo.getSeq()%>'"> 수정 </button></span>
	  <% } %>               
    </label>
  </div> 
     
</div>




  <script>
  $(".c_introInfo .btnClass label span input[type='checkbox']").click(function(){
    if($(this).is(":checked")){
     $('.c_introInfo .btnClass label span i').show();
    }else {
      $('.c_introInfo .btnClass label span i').hide();
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
	<div class="content5">
		<c:choose>
			<c:when test="${cMember.address eq null || cMember.address eq ''}">
				등록된 주소가 없습니다.
			</c:when>
			
			<c:when test="${cMember.address ne null || cMember.address ne ''}">
				${cMember.address }
			</c:when>
		</c:choose>
	</div>
</div>

<div class="rec-location">
	<div id="map" style="width:1050px;height:500px;"></div>
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
	console.log("result = " + result);
 	console.log("result[0].x = " + result[0].x);
 	console.log("result[0].y = " + result[0].y);
	  // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
         	console.log("result = " + result);
         	console.log("result[0].x = " + result[0].x);
         	console.log("result[0].y = " + result[0].y);
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
   var notHash = "등록된 해시태그가 없습니다.";
	 
	  if(hashdb01 == '' && hashdb02 == undefined && hashdb03 == undefined) {
	 	$(".hashTags").append(notHash);
	  }
	  
   if(hashdb01 != undefined && hashdb01 != '') {
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







