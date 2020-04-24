<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    


<html>
<head>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <script type="text/javascript">
	$(document).ready(function(){
	$('#visual').bxSlider({
		//mode:'fade',
      pause:2500,
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
</head>
<style>
#visual_wrap {position:relative; width:100%; height:350px; overflow:hidden;}
#visual li > p {height:480px; background-size:cover !important;}
.visual-box {opacity:0; transition:all 0.3s ease-in-out 1.5s; position:absolute; bottom:20px; left:50%; margin-left:-525px; width:6000px; background:#fff; z-index:99;}
.visual-box a {display:block;}
.visual-box .tit {padding:20px;}
.visual-box .tit strong {display:block; font-size:22px;}
.visual-box .tit p {margin-top:3px; font-size:14px; color:#999; font-weight:bold;}
.visual-box .more {font-size:16px; color:#4f6eff; border-top:1px solid #ddd; line-height:50px; padding:0 20px; font-weight:bold;}
.visual-box .more i {display:inline-block; margin-left:10px;}
#visual li.active-slide .visual-box {opacity:1;}
</style>
<body>
  
  <div id="visual_wrap">
		<link rel="stylesheet" href="/Pickme/css/bxslider.css" type="text/css" />
		<script type="text/javascript" src="/Pickme/js/bxslider.js"></script>
		<ul id="visual">
      <li>
          <p style="background-image:url('http://bitly.kr/Bhuwi1tzO')"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
			<li>
		  <p style="background-image:url('http://bitly.kr/X6FdifSzE')"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
      <li>
      	  <p style="background-image:url('http://bitly.kr/urJlCXH68')"></p>
          <div class="visual-box"><a href="#">
          </a></div>
      </li>
		</ul>
	</div><!-- //visual_wrap -->
	
	

</body>
</html>


<%@include file ="../../../include/footer.jsp" %>