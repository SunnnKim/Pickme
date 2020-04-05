<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">
<!-- 디자인 CSS -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- font-awesome -->
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
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li><a href="../login/memLogin.do">로그인 / 회원가입</a></li>
					<li><a href="comLogin.do">기업서비스</a></li>
				</ul>
			</div>
			<!-- // inner -->
		</header>
		<!-- // header -->

		<div id="sub-container">
			<div class="inner">
			
			
		
			<!-- main content -->


	    </div><!-- // inner -->
	  </div><!-- // sub-container -->
	  
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