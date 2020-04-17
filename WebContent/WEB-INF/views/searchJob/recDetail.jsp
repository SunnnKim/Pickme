<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더호출 -->
<c:import url="../../../include/header.jsp"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
  <form method="post">
  	<input type="hidden" name="seq" value="${recDto.seq }">
  	<input type="hidden" name="comSeq" value="${recDto.comSeq }">
  </form>
  <div class="recTop clfix">
          <div class="infoImg">
            <div class="slider">
               	<c:choose>
               		 <c:when test="${fn:length(filesList) <= 1 }">
               		 <div class="slide-viewer">
                		 <div class="slide-group">
                   	 	<div class="slide slide-1"><img src="filedownload.do?filename=${recDto.imagename }&filepath=/upload/recruit/" alt=""></div>
                	  	 </div>
               	  	 </div>
               	  	</c:when>
               	  	<c:otherwise>
               	  		<div class="slide-viewer">
                	  		<div class="slide-group">
	                 	  		<c:forEach var="dto" items="${filesList}" varStatus="rs">
		                  	 	 <div class="slide slide-${rs.count }"><img src="filedownload.do?filename=${dto.newname }&filepath=/upload/recruit/" alt=""></div>
	                 	  		</c:forEach>
                 	  		</div>
                	  	</div>
               	  		<div class="slide-nav">
               	  	 		<div class="prev"><i class="fas fa-caret-left"></i></div>
	                 		<div class="next"><i class="fas fa-caret-right"></i></div>
	              		</div> 
	              		<div class="slide-buttons"></div>
               	  	</c:otherwise>
               	</c:choose>
              </div><!-- div.slider -->
         	</div><!-- div.infoImg -->

          <div class="infoCom">
            <p>요약</p>
            <table class="summary-table">
              <tbody>
                <tr>
                  <td class="t-icon"><i class="fas fa-file-signature"></i></td>
                  <td class="t-label">직무</td>
                  <td class="t-content">${recDto.comJob }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-building"></i></td>
                  <td class="t-label">근무형태</td>
                  <td class="t-content">${recDto.workingForm }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-laptop-code"></i></td>
                  <td class="t-label">경력</td>
                  <td class="t-content">${recDto.comJobType }</td>
                </tr>
               <%--  <tr>
                  <td class="t-icon"><i class="fas fa-calendar-alt"></i></td>
                  <td class="t-label">기간</td>
                  <td class="t-content">${recDto.wdate }부터 ${recDto.edate } 까지</td>
                </tr> --%>
                <tr>
                  <td class="t-icon"><i class="fas fa-dollar-sign"></i></td>
                  <td class="t-label">연봉</td>
                  <td class="t-content">${recDto.salary }</td>
                </tr>
                 <%-- <tr>
                  <td class="t-icon"><i class="fas fa-map-marker-alt"></i></td>
                  <td class="t-label">위치</td>
                  <td class="t-content">${comAddr }</td>
                </tr> --%>
                <tr>
                  <td class="t-icon"><i class="fas fa-tags"></i></td>
                  <td class="t-label">태그</td>
                  <td class="t-content">
                    <div class="inhash">
                     	<c:forEach items="${hashTag }" var="str" varStatus="vs">
	                     <button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>
	                       #${str }
	                      </button>
                     	</c:forEach>
                  </div>
                  </td>
                </tr>
              </tbody>
            </table>
            <span class="likes">
              <button type="button" class="likebtn" onclick="likech(this)"><i class="fas fa-heart unliked"></i>23</button>
            </span>
          </div><!-- div.infoCom -->
        </div><!-- div.recTop -->
        
        <div class="rec-content clfix">
  			${recDto.content }
        </div><!--div.infoContent-->

        <div class="rec-location" id="rec-location">
        	<p>[근무지역]</p>
			 <div id="map" style="width:100%;height:400px;"></div>
        </div><!-- rec-location -->
       
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9659e321755104e19052e54a7fbe78a4&libraries=services"></script>
<script>
	
	$("#detailApply").on("click", function(){
		alert("지원하기 버튼");
	});

	$("#sendMsg").on("click", function(){
		alert("메시지보내기 클릭");
	});

	//회사이름, 제목 
	$(".recTit").text("${recDto.title }");
	$(".recSubTit").text("${recDto.comName }");
    //좋아요 
    function likech(btn){
    console.log($(btn).children('i'));
     if( $(btn).children('i').hasClass('unliked')==true ){
       $(btn).children('i').removeClass('unliked');
       $(btn).children('i').addClass('liked');
    //   alert( "dd");

    } else if($(btn).children(':first').hasClass('liked')) {
        $(btn).children(':first').removeClass('liked');
        $(btn).children(':first').addClass('unliked');
     }
  }


 // 이미지 슬라이드
    $('.slider').each(function(){
          var $this = $(this);
          var $group = $this.find('.slide-group');
          var $slides = $this.find('.slide');
          var buttonArray = [];
          var currentIndex = 0;
          var timeout;

          var $nav = $('.slide-nav').find('div');
      
            $nav.on('click', function (event) {
              event.preventDefault();
              console.log($(this));
              if ($(this).hasClass('next')) {
                  if (currentIndex === $slides.length -1) {
                      move(0);
                  }
                  move(currentIndex + 1);
              } else {
                  if (currentIndex === 0) {
                      move($slides.length -1);
                  }
                  move(currentIndex - 1);
              }
          });

      function move(newIndex) {
          var animateLeft, slideLeft;

          // advance();

          if ($group.is(':animated') || currentIndex === newIndex) {
              return;
          }

          buttonArray[currentIndex].removeClass('active');
          buttonArray[newIndex].addClass('active');

          if (newIndex > currentIndex) {
              slideLeft = '100%';
              animateLeft = '-100%';
          } else {
              slideLeft = '-100%';
              animateLeft = '100%';
          }

          $slides.eq(newIndex).css({
              left: slideLeft,
              display: 'block'
          });

          $group.animate({left: animateLeft}, function() {
              $slides.eq(currentIndex).css({display: 'none'});
              $slides.eq(newIndex).css({left: 0});
              $group.css({left: 0});
              currentIndex = newIndex;
          });
      }

    /*
      function advance() {
          clearTimeout(timeout);
          timeout = setTimeout(function() {                    
              if (currentIndex < ($slides.length - 1)) {
                  move(currentIndex + 1);
              } else {
                  move(0);
              }
          }, 4000);
      }/**/

      $.each($slides, function(index) {
          var $button = $('<button type="button" class="slide-btn">&bull;</button>');
          if (index === currentIndex) {
              $button.addClass('active');
          }
          $button.on('click', function(){
              move(index);
          }).appendTo('.slide-buttons');
          buttonArray.push($button);
      });

      // advance(); -- auto slide
      })
      
      
 // kakao 지도 api
	var container = document.getElementById('rec-location'); // 지도와 로드뷰를 감싸고 있는 div 입니다
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다
	
	// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
	var placePosition = new kakao.maps.LatLng(33.450701, 126.570667);
	
	// 지도 옵션입니다 
	var mapOption = {
	    center: placePosition, // 지도의 중심좌표 
	    level: 3 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 로드뷰 객체를 생성합니다 
	var roadview = new kakao.maps.Roadview(rvContainer);
		

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${comAddr }', function(result, status) {
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

<c:import url="../../../include/footer.jsp"/> 
