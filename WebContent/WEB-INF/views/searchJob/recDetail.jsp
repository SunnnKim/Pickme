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
            <table class="summary-table">
              <tbody>
                <tr>
                  <td class="t-icon"><i class="fas fa-file-signature"></i></td>
                  <td class="t-label">직무</td>
                  <td class="t-content">${recDto.comJob1 },${recDto.comJob2 }</td>
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
                <tr>
                  <td class="t-icon"><i class="fas fa-dollar-sign"></i></td>
                  <td class="t-label">연봉</td>
                  <td class="t-content">${recDto.salary }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-tags"></i></td>
                  <td class="t-label" colspan="2">
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
            <div class="companyInfo">
            	<button type="button" class="btnleft">
            		<div class="logo" style="background-image: url(&quot;/Pickme/c_mypage/imageDownload.do?filename=${cmem.logoName }&filepath=${cmem.logoPath }&quot;);"></div>
            		<div class="companyName">
            			<p class="comP">${recDto.comName }</p>
            			<p class="comT">${cmem.department }</p>
            		</div>
            	</button>
            	 <span class="likes">
            		<button type="button" class="followButton">기업정보</button>
            		
            	</span>
            </div>
          <button type="button" class="likebtn" onclick="likech(this)"><i class="fas fa-heart unliked"></i><span>${likeTotal }</span></button>
             
            
          </div><!-- div.infoCom -->
        </div><!-- div.recTop -->
        
        <div class="rec-content clfix">
        	<div class="content">
        		<div class="impt">
	        		<span class="header">요구조건</span>
	        		<span class="body">${recDto.requirements }</span><br>
	        		<span class="header">주요업무</span>
	        		<span class="body">${recDto.mainTask }</span>
        		</div>
	  			${recDto.content }
        	</div>
        </div><!--div.infoContent-->

        <div class="rec-location" id="rec-location" style="border-top:1px solid #ccc">
        	<span class="header">채용기간</span>
        	<span class="body"><i class="fas fa-calendar-alt"></i>&nbsp;&nbsp;&nbsp;${recDto.wdate }부터 ${recDto.edate } 까지</span>
        	<br>
        	<span class="header">근무지역</span>
        	<span class="body"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;&nbsp;${cmem.address }</span>
			 <div id="map" style="width:100%;height:400px; margin-top:10px;"></div>
        </div><!-- rec-location -->
       
<!-- Kakao Map Api -->
<%@include file="../../../../api/kakaoMap.jsp" %>
<!-- 메시지보내기 -->
<%@include file="../../../include/sendMsg.jsp" %>
<script>
//좋아요 하트 클래스 add+remove
 var chk = "${chk}";
if ( chk != null || chk != ""){
	if(chk == 1){
		 $(".likebtn").children('i').removeClass('unliked');
	     $(".likebtn").children('i').addClass('liked');
	} else if(chk == 0){
	    $(".likebtn").children('i').removeClass('liked');
		$(".likebtn").children('i').addClass('unliked');
	}
} 
 
/* 	$("#recruitDetailButton2").on("click", function(){
		alert("메시지보내기 클릭");
	});
 */
	$(".btnleft").on("click", function(){
		//alert("기업정보 바로가기 클릭");
		location.href="/Pickme/c_mypage/goCMypage.do?sentSeq=${recDto.comSeq }";
	});

	$(".followButton").on("click", function(){
		//alert("기업정보 바로가기 클릭");
		location.href="/Pickme/c_mypage/goCMypage.do?sentSeq=${recDto.comSeq }";
	});
	
	//회사이름, 제목 
	$(".recTit").text("${recDto.title }");
	$(".recSubTit").text("${recDto.comName }");
    //좋아요 
    var total = "${likeTotal }";
    function likech(btn){
    	$.ajax({
			url:"recLike.do",
			type:"post",
			datatype:"json",
			data:{"likePickSeq":$("input[name=seq]").val()},
			success:function(data){
				//alert("success " + data);
				 if(data == 'fail') {
					 Swal.fire({
						  icon: 'error',
						  text: '로그인이 필요한 서비스입니다.',
					}).then( (result) =>{
						location.href = "/Pickme/login/memLogin.do"
					})
			
				} else if (data == 'plus') {
					  total++;
					  $(btn).children('span').text(total);
					  //console.log($(btn).children('span').text() );
					  $(btn).children('i').removeClass('unliked');
				      $(btn).children('i').addClass('liked');
				} else if (data == 'del') {
					  total--;
					  $(btn).children('span').text(total);
					  $(btn).children(':first').removeClass('liked');
				      $(btn).children(':first').addClass('unliked');
				}
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

        });
 
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

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${cmem.address }', function(result, status) {
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
<%@include file="../../../include/applyModal.jsp"%> 