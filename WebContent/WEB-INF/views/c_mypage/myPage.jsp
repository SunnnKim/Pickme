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
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>

<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>

<style>
/*
#visual_wrap {position:relative; width:100%; height:450px; overflow:hidden;}
#visual li > p {height:480px; background-size:cover !important;background-repeat:no-repeat; background-position:1cm 100px;}
.visual-box {opacity:0; transition:all 0.3s ease-in-out 1.5s; position:absolute; bottom:20px; left:50%; margin-left:-525px; width:6000px; background:#fff; z-index:99;}
.visual-box a {display:block;}
.visual-box .tit {padding:20px;}
.visual-box .tit strong {display:block; font-size:22px;}
.visual-box .tit p {margin-top:3px; font-size:14px; color:#999; font-weight:bold;}
.visual-box .more {font-size:16px; color:#4f6eff; border-top:1px solid #ddd; line-height:50px; padding:0 20px; font-weight:bold;}
.visual-box .more i {display:inline-block; margin-left:10px;}
#visual li.active-slide .visual-box {opacity:1;}


.c_introTop .c_introSlider {float: left;width: 600px;/* height: 480px; */background: #ccc;/* background: url("https://www.venturesquare.net/wp-content/uploads/2019/07/2019-0702-wanted-751x522.png") no-repeat center / cover; *//*}
*/
.c_introInfo {text-align:center;width: 1000px;padding-bottom:100px;padding-top:100px;border-bottom:1px solid #cacaca;}
.c_introInfo .tit h3 {text-align:center;line-height: 80px;font-size: 23px;}

/* 로고 */
.c_introInfo .tit h3 img {text-align:center;width: 80px;height: 80px;margin-right : 15px;}
.c_introInfo ul {text-align:center;margin-top: 20px;}
.c_introInfo ul li {text-align:center;font-size: 18px;/* position: relative; */margin-top: 22px;/* padding-left: 120px; */}
.c_introInfo ul li span {text-align:center;display: block;/* position: absolute;top:0;left:0; */font-weight: bold;}


.followBtnWrap {margin-top: 21px;}
.followBtnWrap span {display: block;text-align: center;height: 50px;background-color: #4f6eff;color: #fff;line-height: 50px;font-size: 24px;cursor: pointer;}
.followBtnWrap span:hover {background-color:#6681ff;}
.followBtnWrap span i {margin-left: 10px;display: none;}
.followBtnWrap span input {width: 0;height: 0;display:none;}

.c_introBtm {margin-top: 100px;}
.c_introBtm h4 {font-size: 22px; margin-top:30px; margin-left:40px;}
.c_introBtm h4 > span {display:inline-block; margin-left:30px;}
.c_introBtm h4 > span > span {display:inline-block;padding:5px 15px;font-size:15px;color:#fff;background:#999;border-radius:3px;margin-right:10px;}
.c_introBtm .cont {margin-top: 20px;font-size: 18px; /* margin-left:60px; */}
         
/* 수정버튼 */
.updateBtn { font-size: 22px;padding-bottom: 8px;color: #fff;}

/* 수정 버튼 눌렀을 때 */
.updateBtn:focus { outline:none;}

.cont {background-color:#e0e0e0; /* margin-left:100px; */ padding-left:50px; padding-top: 50px; padding-right:50px; padding-bottom:50px;}




.profile-wrap .c_introWrap .recTop div.infoImg {width: 500px; float: left; max-height: 400px;}
.profile-wrap .c_introWrap .recTop div.infoImg:last-child{margin-right: 0;} 
.profile-wrap .c_introWrap .recTop div.infoCom{ height: 400px; float: right; width: 520px;}
/* =========detail image slide css============== */
.profile-wrap .c_introWrap .recTop .slider {
    max-width: 500px;
    /* margin: 0px auto 30px auto; */
    margin-top: 0;
    margin-bottom: 30px;
    position: relative;
  }

.profile-wrap .c_introWrap .recTop .slide-viewer {
    position: relative;
    overflow: hidden;
    height: 366px;
}

.profile-wrap .c_introWrap .recTop .slide-group {
    width: 100%;
    height: 100%;
    position: relative;}

.profile-wrap .c_introWrap .recTop .slide {
    width: 100%;
    height: 100%;
    display: none;
    position: absolute;
    /* margin-top: 5rem; */
}

.profile-wrap .c_introWrap .recTop .slide:first-child {
    display: block;
    }
.profile-wrap .c_introWrap .recTop .slide img {
    width: 100%;
}

    /* slide-nav */
.profile-wrap .c_introWrap .recTop .infoImg .slider .slide-nav {
    width: 100%;
    position: absolute;
    top: 50%;
    left: 3%;
}
.profile-wrap .c_introWrap .recTop .infoImg .slider .slide-nav .prev, .slide-nav .next {
    width: 40px;
    height: 100%;
    /* background-color: rgba(0, 0, 0, 0.205); */
    position: absolute;
    cursor: pointer;
    z-index: 2;
}
.profile-wrap .c_introWrap .recTop .infoImg .slider .slide-nav .prev {
    left: 0;
}
.profile-wrap .c_introWrap .recTop .infoImg .slider .slide-nav .next {
    right: 0;
}



</style>

<body>

      

<div class="c_introInfo">
                <div class="tit">
                   <h3>
                   <c:choose>
                   		<c:when test="${cMember.logoName eq null || cMember.logoName eq ''}">
                   			<img src="https://theregister.al/wp-content/themes/arkahost/assets/images/default-680x600.jpg"> <font color="#4f6eff">${cMember.name }</font>
                   		</c:when>
                   		
                   		<c:when test="${cMember.logoName ne null }">
                   			<img src="/Pickme/c_mypage/imageDownload.do?filename=${cMember.logoName }&filepath=${cMember.logoPath }" alt="logo"> <font color="#4f6eff">${cMember.name }</font>
                   		</c:when>
                   </c:choose>
                   </h3>
                
                </div>
</div>
        <div class="c_introWrap">
          <!--  <div class="c_introTop clfix">
            <div class="c_introSlider">-->
            
          
            <div class="recTop clfix">
          <div class="infoImg">
            <div class="slider">
               	<c:choose>
               		 <c:when test="${fn:length(filesList) <= 1 }">
               		 <div class="slide-viewer">
                		 <div class="slide-group">
                   	 	<div class="slide slide-1">
                   	 	<!--<img src="filedownload.do?filename=${recDto.imagename }&filepath=/upload/recruit/" alt="">-->
           					<img src="https://post-phinf.pstatic.net/MjAxOTA0MjdfMTc4/MDAxNTU2MzA5MjM5MDg4._kWMKXB8ZoSjgUcjpa_6vfVv4UBMve51Rp4MU15kKFYg.YC74wTvtK-f4G7G3s7tJgInnyMB3AQX4GdRjwelQVnwg.JPEG/0424_%EB%8C%80%EA%B8%B0_6.jpg?type=w1200">   	 	
                   	 	</div>
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
            	</div>
            
            	
            	
            	
            
   <!--   <div id="visual_wrap">
      <link rel="stylesheet" href="/Pickme/css/bxslider.css" type="text/css" />
      <script type="text/javascript" src="/Pickme/js/bxslider.js"></script>
      <ul id="visual">
      <li>
          <p style="background-image:url('http://bitly.kr/Bhuwi1tzO');"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
         <li>
        <p style="background-image:url('http://bitly.kr/X6FdifSzE');background-size:contain;"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
      <li>
           <p style="background-image:url('http://bitly.kr/urJlCXH68');background-size:contain;"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
      </ul>
   </div> 
            
            </div>  --> <!-- // c_introSlider -->
          
            
            
                
                <div>
                <div>
                	<div> <b>기업분야</b>  <span style="margin-left:50px;">${cMember.department }</span></div>
                	<div> <b>규모</b>  <span style="margin-left:50px;">${cMember.type }</span></div>
                	<div> <b>대표자 성명</b>  <span style="margin-left:50px;">${cMember.president }</span></div>
                	<div> <b>전화번호</b>  <span style="margin-left:50px;">${cMember.tel }</span></div>
                	<div> <b>주소</b>  <span style="margin-left:50px;">${cMember.address }</span></div>
                </div>
                
                
                
                
                
                
                
                
                
                
                
                <ul>
                  <!-- <li><button onclick = "location.href='slide.do'">슬라이드 테스트</button></li> -->
                
                
                  <li><span>기업분야</span><%=memberInfo.getDepartment() %></li>
                  <li><span>규모</span><%=memberInfo.getType() %></li>
                  <li><span>대표자 성명</span><%=memberInfo.getPresident() %></li>
                  <li><span>전화번호</span><%=memberInfo.getTel() %></li>
                  <li><span>이메일</span><%=memberInfo.getEmail() %></li>
                  <%-- <li><span>주소</span><%=memberInfo.getAddress() == ""? "등록된 주소가 없습니다.": memberInfo.getAddress()%> </li> --%>
                  <li><span>주소</span>
                   <% if (zipcode == null) { %>
                         등록된 주소가 없습니다.
                   <%} else { %>
                         <%=zipcode %> &nbsp; <%=basicAdd %> &nbsp; <%=detailAdd %>
                   <%} %>
                   </li>
                </ul>
                <div class="followBtnWrap">
                  <label>
                       <% if(member != null) { %>
                       <span>팔로우<i class="fas fa-check"></i> <input type="checkbox"></span>
                    <% } else if(memberInfo != null) { %>
                         <span><i class="fas fa-check"></i><button type = "button" class="updateBtn" onclick = "location.href='goUpdate.do?seq=<%=memberInfo.getSeq()%>'"> 수정 </button></span>
                    <% } %>               
                  </label>
                </div>
            </div>  <!-- // c_introInfo -->
          </div> <!-- // c_introTop -->      

          <div class="c_introBtm">
          
          <!--  ★★★★★★★★★★★★★★★★★★ DB 에서 해시태그 걸어야함 ★★★★★★★★★★★★★★★★ -->
          
            <h4>회사소개 
               <span class="hashTags">
                  
               </span>
           </h4>
            <div class="cont">
               <%=memberInfo.getIntroduce() == null ? "등록된 소개가 없습니다.": memberInfo.getIntroduce()%>
            </div>
          </div> <!-- // c_introBtm -->


        </div> <!-- // c_introWrap -->
        
        
        
        
        
        <!--***************************** 스크립트 영역 **********************************************-->
        
        
        
        <!--------------------------- 슬라이드 ------------------------------->
        <script type="text/javascript">
      $(document).ready(function(){
      $('#visual').bxSlider({
         //mode:'fade',
         pause:4500,
        pager: false,
        auto:true,
         onSliderLoad: function(currentIndex) {
           $('#visual_wrap').find('.bx-viewport').find('ul').children().eq(currentIndex).addClass('active-slide');
             $('#visual_wrap').find('.bx-viewport').find('ul').children().eq(1).addClass('active-slide').css('transition', 'all 0.1 ease-in-out');
         },
         onSlideBefore: function($slideElement){
           $('#visual_wrap').find('.bx-viewport').find('ul').children().removeClass('active-slide');
           $slideElement.addClass('active-slide');
         }
         });
      });
      </script>

      <!------------------------- 팔로우 버튼 -------------------------->
	    <script>
	          $(".followBtnWrap label span input[type='checkbox']").click(function(){
	            if($(this).is(":checked")){
	             $('.followBtnWrap span i').show();
	            }else {
	              $('.followBtnWrap span i').hide();
	            }
	
	          });
	    </script>

      <!----------------------- 해시태그 ------------------------------->

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

		   var hstr01 = "<span>#"+hashdb01+"<input type='hidden' name='hashTag' value='"+hashdb01+"'></span>"
		   var hstr02 = "<span>#"+hashdb02+"<input type='hidden' name='hashTag' value='"+hashdb02+"'></span>"
		   var hstr03 = "<span>#"+hashdb03+"<input type='hidden' name='hashTag' value='"+hashdb03+"'></span>"

		   if(hashdb01 != undefined) {
				$(".hashTags").append(hstr01);
		   }
		   if(hashdb02 != undefined) {
				$(".hashTags").append(hstr02);
		   }
		   if(hashdb03 != undefined) {
				$(".hashTags").append(hstr03);
		   } 
		   

		   /*
		   hashdb01.replace('','undefined'); 
		   hashdb02.replace('','undefined'); 
		   hashdb03.replace('','undefined'); 
		   */
		   
		})
		</script>
		
		<!-- 슬라이드 -->
		<script>
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
		</script>


</div><!-- // wrap -->



<%@include file="/include/footer.jsp"%>