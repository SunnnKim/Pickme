<%@page import="model.CMemberDto"%>
<%@page import="model.AMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AMemberDto member = (AMemberDto) session.getAttribute("loginuser");
	CMemberDto company = (CMemberDto) session.getAttribute("logincompany");
	String userName = "";
	if( member != null ){
		userName = member.getName();
		System.out.println("유저네임 : "+userName);
	}
	else if( company != null ){
// 		userName = company.getC_name();
		userName = company.getName();
	}
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 디자인 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">
<!-- font-awesome -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div id="wrap">
		<header>
			<div class="inner clfix">
				<strong class="logo"><a href="#none">PICK ME</a></strong>
				<nav class="gnb">
					<a href="#none">채용탐색</a> 
					<a href="#none">이력서</a> 
					<a href="#none">지원현황</a>
					<a href="#none">고객센터</a>
				</nav>
				<!-- // gnb -->
				<% if(userName.equals("")){
					%>
						<ul class="header_infoBtn clfix">
							<li><button type="button" id="searchBtn"></button></li>
							<li><a href="/Pickme/login/memLogin.do">로그인 / 회원가입</a></li>
							<li><a href="/Pickme/login/company/comLogin.do">기업서비스</a></li>
						</ul>
					<%
				}else{
					%>
						<ul class="header_infoBtn clfix">
							<li><button type="button" id="searchBtn"></button></li>
							<li><a href="mypage.do"><%=userName %>님</a></li>
							<li><a href="logout.do">로그아웃</a></li>
						</ul>
					<%
				}
					%>
			</div>
			<!-- // inner -->
		</header>
		<!-- // header -->

		<div id="visual_wrap">
		<link rel="stylesheet" href="/Pickme/css/bxslider.css" type="text/css" />
		<script type="text/javascript" src="/Pickme/js/bxslider.js"></script>
		<ul id="visual">
      <li>
          <p style="background:url(/Pickme/images/main/visual01.jpg) no-repeat 50%;"></p>
          <div class="visual-box"><a href="#">
            <div class="tit">
              <strong>'글로벌 앱' 만드는 픽소</strong>
              <p>iOS・Android 개발자, 디자이너 채용중</p>
            </div>
            <div class="more">바로가기 <i class="fas fa-angle-right"></i></div>
          </a></div>
      </li>
			<li>
          <p style="background:url(/Pickme/images/main/visual02.jpg) no-repeat 50%;"></p>
          <div class="visual-box"><a href="#">
            <div class="tit">
              <strong>'글로벌 앱' 만드는 픽소2</strong>
              <p>iOS・Android 개발자, 디자이너 채용중</p>
            </div>
            <div class="more">바로가기 <i class="fas fa-angle-right"></i></div>
          </a></div>
      </li>
      <li>
          <p style="background:url(/Pickme/images/main/visual03.jpg) no-repeat 50%;"></p>
          <div class="visual-box"><a href="#">
            <div class="tit">
              <strong>'글로벌 앱' 만드는 픽소3</strong>
              <p>iOS・Android 개발자, 디자이너 채용중</p>
            </div>
            <div class="more">바로가기 <i class="fas fa-angle-right"></i></div>
          </a></div>
      </li>
		</ul>
	</div><!-- //visual_wrap -->
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

	  <div id="container">
	    <div id="section01">
	      <div class="inner">
	        <div class="m-tit">
	          <h2>나에게 맞는 포지션 <a href="#none"><i class="fas fa-cog"></i></a></h2>
	          <a href="#none">more +</a>
	        </div>
	        <div class="cont">
	          <ul class="pmList clfix">
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	          </ul>
	        </div>
	      </div><!-- // inner -->
	    </div><!-- // section01 -->
	    <div id="section02">
	      <div class="inner">
	        <div class="m-tit">
	          <h2>금주의 채용</h2>
	          <a href="#none">more +</a>
	        </div>
	        <div class="cont">
	          <ul class="pmList clfix">
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	            <li><a href="#">
	              <div class="img">
	                <img src="/Pickme/images/main/img.jpg" alt="">
	              </div>
	              <div class="txt">
	                <h3>iOS 앱 개발자</h3>
	                <p>브이로거(Vlogr)</p>
	                <p>서울.한국</p>
	                <span>[채용] 2020-05-12 ~ 2020-05-12</span>
	              </div>
	            </a></li>
	          </ul>
	        </div>
	      </div><!-- // inner -->
	    </div><!-- // section02 -->
	    <div id="section03">
	      <div class="inner">
	        <div class="m-tit">
	          <h2>공지사항</h2>
	          <a href="#none">more +</a>
	        </div>
	      </div><!-- // inner -->
	    </div><!-- // section03 -->
	  </div><!-- // container -->
	  
	  <div class="btn_top"></div>
	  <script>
	      $( document ).ready( function() {
	        $( window ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	            $( '.btn_top' ).addClass("on");
	          } else {
	            $( '.btn_top' ).removeClass("on");
	          }
	        } );
	        $( '.btn_top' ).click( function() {
	          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	          return false;
	        } );
	      } );
	    </script>
	
	  <footer>
	    <p class="copyright">Copyright by Up All Rights Reserved.</p>
	  </footer><!-- // footer -->
	
	</div><!-- // wrap -->
	

</body>
</html>