<%@page import="model.CMemberDto"%>
<%@page import="model.AMemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session
	AMemberDto member = (AMemberDto) session.getAttribute("loginuser");
	CMemberDto company = (CMemberDto) session.getAttribute("logincompany");
	String userName = "";
	// 인증 페이지

	if( member != null ){
		if(member.getDel() == -1 ){
			response.sendRedirect("/Pickme/login/validate.do");
			return;
		}
		userName = member.getName();
	}
	else if( company != null ){
		if(company.getDel() == -1 ){
			response.sendRedirect("/Pickme/login/validate.do");
			return;
		}else if(company.getDel() == -2 ){
			response.sendRedirect("/Pickme/login/upapproval.do");
			return;
		}
		userName = company.getName();
	}
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= 1050px, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="refresh" content="3600">
<title>index</title>
<!----- [ 디자인 CSS 영역 ] ----->
<!-- 리셋 CSS -->
<link rel="stylesheet" href="/Pickme/css/reset.css" type="text/css">
<!-- 디자인 CSS -->
<link rel="stylesheet" href="/Pickme/css/style.css" type="text/css">

<!--  [ Javasrcipt 영역 ]  -->
<!-- font-awesome -->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="/Pickme/js/jquery/jquery-3.4.1.min.js"></script>
<!-- sweetAlert2 -->
<script src="/Pickme/js/sweetalert2/sweetalert2.all.js"></script>
<link rel="stylesheet" href="/Pickme/js/sweetalert2/sweetalert2.css" type="text/css"/>

<!-- 구글폰트 적용 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

</head>
<body>
	<!-- message alert  -->
	<div id="socketAlert">
		<div class="inner">
		</div>
	</div>

	<div id="wrap">
		<header>
			<div class="inner clfix">
				<strong class="logo"><a href="/Pickme/login/main.do">PICK ME</a></strong>
				<%
			  		if( company != null ){
				%>
				 <nav class="gnb">
					<a href="/Pickme/searchPeople/searchPeopleIntro.do">인재탐색</a> <!-- 기업회원 인재탐색  -->
					<a href="/Pickme/c_apply/cApplyMain.do">지원현황</a><!-- 기업회원 지원현황  -->
					<a href="javascript:goPage('now');">채용관리</a><!-- 기업회원 채용현황  -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
				</nav>
				 <form name="seqFrm">
				 	<input type="hidden" name="comSeq" value="${sessionScope.logincompany.seq}"> 
				 </form>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li class="alert-wrap msg">
					   		<a href="/Pickme/c_apply/cRcvMsg.do"><img alt="" src="../images/main/message.png" width="20px" height="20px"></a> 
				
					</li>
					<li>
						<!-- 기업회원 마이페이지 -->
						<a href="/Pickme/c_mypage/goCMypage.do">[기업] <%=userName %> </a>
					</li>
					<li><a href="/Pickme/login/company/logout.do">로그아웃</a></li>
				</ul>
				 <%
			
			// 비로그인 시
			 } else {
				 %>
				 <nav class="gnb">
					<a href="/Pickme/searchJob/recSearch.do">채용탐색</a> <!-- 비로그인 채용탐색  -->
					<a href="/Pickme/login/memLogin.do">이력서</a><!-- 일반회원 이력서관리  -->
					<a href="/Pickme/login/memLogin.do">지원현황</a><!-- 비로그인 -> 로그인 페이지로 -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li>
						<a href="/Pickme/login/memLogin.do">로그인</a>
							 			/
					 	<a href="/Pickme/login/memJoin.do">회원가입</a>
					</li>
					<li><a href="/Pickme/login/company/comLogin.do">기업서비스</a></li>
				</ul>
				 <%
			 }
			%>
			</div>
			<!-- // inner -->
		</header>
		<!-- // header -->

		<div id="visual_wrap" class="animation">
			<div class="title-content">
				<b>기업</b> 서비스를 통해  <br>
				원하는 인재를 <b>Pick</b> 하세요
			</div>
			<div class="btns">
				<a href="/Pickme/customer/paidService.do">서비스 이용하기</a>
				<a href="/Pickme/c_mypage/goPayment.do">서비스 이용내역</a>
			</div>
		</div><!-- //visual_wrap -->

	  <div id="container" class="animation2">
		  <div id="section01">
			<div class="com-cover"></div>
	      	<div class="inner">
				<div class="left-txt">
					Pick Me를<br>
					이용하는 이유 
				</div>
				<div class="right-txt">
					국내 다수 기업 및 구직자 이용<br>
					기존 채널 대비 40% 채용 비용 절감<br>
					구직자-기업 간 빠른 매칭 서비스<br>
					채용 후 6개월 내 채용 유지율 95%<br>
					효율적인 헤드헌팅 서비스<br>
				</div>
			</div><!-- // inner -->
	    </div><!-- // section01 -->
	    <div id="section02" class="animation2">
			<div class="inner">
				<div class="left-txt">
					기업서비스
				</div>
				<div class="right-txt">
					<div>
						<span class="red">인재탐색</span><br>
							경력, 직무에 적합한 인재를 찾아보세요 
					</div>
					<div>
						<span class="blue">열람요청</span><br>
						엄선된 경력자들 중에 맘에 드는 후보자에게 직접 면접을 제안하세요
					</div>
					<div>
						<span class="green">채용광고</span><br>
						빠르고 쉽게 채용공고를 등록하고 효율적으로 지원자를 관리해보세요
					</div>
				</div>
	      </div><!-- // inner -->
	    </div><!-- // section02 -->
	    <div id="section03" class="animation2">
	      <div class="inner">
			<div class="left-txt">
				Pick Me 기업서비스를 통해 <br>최적의 인재를 만나보세요 
			</div>
			<div class="right-txt">
				<a href="/Pickme/c_mypage/goCMypage.do">기업프로필 작성하기</a>
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
	
<!-- for 웹소켓 기업 / 개인회원구분 -->
<input type="hidden" id="loginuser" value="${loginuser }">
<input type="hidden" id="logincompany" value="${logincompany }">

<!-- 웹소켓 -->
<script>
	// 소켓 전역변수 
	  var socket = null;
	   $(document).ready(function (){
		   connectWs();
	   });
	   //웹소켓 연결 	 
	   function connectWs(){
			console.log("Info: connecting...");
			// 웹소켓 객체생성
			var ws = new WebSocket("ws://localhost:8090/Pickme/echo.do");

			// 다른곳에서 사용할 수 있게 전역변수에 넣기 
			socket = ws;

			//웹소켓이 open됐을때 사용할 함수 
			ws.onopen = function(){
				console.log('Info: connection opened');
			 	// 기업 / 일반 메시지 갯수 가져올 ajax 구분
				var member = $("#loginuser").val();
			    var company = $("#logincompany").val();
			    
				// 일반회원 로그인 했을때 메시지 갯수 가져오기 	
				if(member){	
					console.log("loginuser들어옴");
					console.log("loginuser: " + member);
					if(socket){
						 $.ajax({
							    url:"../totalMsgCount.do",
							    dataType:"text",
							    success: function(data){
									if(socket) {
										console.log("메시지총갯수" + data);									
										// websocket에 메시지 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 메시지 갯수))
									    socket.send("null,unread,null,null,null,"+ data+",null");
									}	
								}, 
							    error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}						
						 });
	
							$.ajax({
								url:"../recentLikeRecruit.do",
							    dataType:"text",
						    	success: function(data){
							    	console.log(data);
									socket.send("null,recruit,null,null,null,null," + data);
								},
								error:function(request,status,error){
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}	
						});	
					}	
				} 
				
				// 기업회원 로그인 했을때 메시지 갯수 가져오기 
			  	if(company){
			  		console.log("loginCompany들어옴");
			  		console.log("loginuser: " + company);
					 $.ajax({
						    url:"/Pickme/c_apply/totalMsgCount.do",
							method:"post",
						    dataType:"text",
						    success: function(data){
								if(socket) {
									console.log("메시지총갯수" + data);
									// websocket에 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 로그인 seq, 메시지 갯수))
								    let socketMsg = socket.send("null,unread,null,null,null,"+ data + ",null");
								 	console.debug("sssmsg >> ", socketMsg)
								 	socket.send(socketMsg)
								}	
							}, 
						    error:function(request,status,error){
							    	alert("main.jsp socket error");
							        alert("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
							}		
					 });
					 
				 }
			}
			
			// 서버에서 메시지 도착한 경우
		    ws.onmessage = function(event){
				if((event.data).includes("메시지")){//메시지 도착시 alert 
					console.log("ReceiveMessage:", event.data + '\n');
		            let $socketAlert = $('div#socketAlert');
		             $socketAlert.html(event.data); 
		            // $socketAlert.css('display', 'block');
		             $socketAlert.append("<div class='inner'></div>");
					 $socketAlert.slideDown();

					 var socketOffset = $socketAlert.offset();
				        $( window ).scroll( function() {
				          if ( $( document ).scrollTop() > socketOffset.top ) {
				            $socketAlert.addClass( 'wsFixed' );
				          }
				          else{
				            $socketAlert.removeClass( 'wsFixed' );
				          }
				        });
		            setTimeout( function(){
			             $('#inner').detach();
		            	 $socketAlert.slideUp();
		            	 
		            },6000);
		            
				}else if((event.data).includes("<ul>")){
					console.log('recruit!>>>' + event.data);
					$('#alert-NoContent').detach();
					$('.alert-wrap.bell').append(event.data);
							 	
				}else{ // 안읽은 메시지 갯수 표시
					
					if(event.data > 0){
						console.log("event.data: " + event.data);
			
						$('.alert-wrap.msg').append('<span class="alert-number">'+event.data+'</span>');
						
					}else{
						console.log("메시지 없음");
						$('.alert-wrap.msg').find('span').remove();	
				   }
		 	}
	   }
	 	// 소켓 닫힌경우	 
	    ws.onclose = function() {
	      	console.log('connect close');
	  
	    };
	    ws.onerror = function (err) {console.log('Errors : ' , err);}
	   }
		   // 알람 클릭시 
		$(".alert-bell").click(function(){
			// alert("종클릭!");
			$('.alertContWrap').fadeToggle('fast');
	
		});
	 	// esc키로 알림내용 닫기 
		window.onkeyup = function(e) {
			var key = e.keyCode ? e.keyCode : e.which;

			if(key == 27){
				$('.alertContWrap').fadeOut('fast');
			}	
		}
	 </script>
</body>
<style>
#visual_wrap{
	height: 500px;
}
#visual_wrap .title-content{
	font-size: 50px; font-weight: 200; color: #aaa; text-align: center; margin-top: 100px;

}
#visual_wrap .title-content b { font-weight: 400; color: #333; }
#visual_wrap .btns{ width: 470px; height: 80px; margin: 0 auto; margin-top: 50px;}
#visual_wrap .btns > a{
	background-color: #304edf; color: #fff; border-radius: 5px;
	width: 200px; height: 50px; line-height: 50px; text-align: center; float: left; margin: 20px 15px;
}
/* container1 */
#container #section01{ height: 500px; 
	background-image: url("/Pickme/images/main/comMain.jpeg"); background-size:cover; background-position:center 80%; }
#container .com-cover{ z-index: 1;
	width: 100%; height: 500px; position: absolute; background-color: rgba(0,0, 0, 0.7);
}
#container #section01 .inner{
	position:relative; z-index:2; color: #fff;
}
#container #section01 .inner .left-txt{ text-align: left; padding-top: 200px; padding-left: 120px;
	font-size: 40px; font-weight: 500; height: 500px; width: 450px; float: left;
}
#container #section01 .inner .right-txt{ padding-left: 50px; font-size: 20px; font-weight: 400; line-height: 40px;
	width: 450px;height: 500px;float: left;padding-top: 170px;} 
/* service-info */
#section02{  height: 500px;}
#section02 .inner{}
#container #section02 .inner .left-txt{ text-align: left; padding-left: 120px; padding-top: 120px; font-size: 40px; font-weight: 500; height: 500px; width: 450px; float: left;}
#container #section02 .inner .right-txt{ padding-left: 0px; font-size: 20px; font-weight: 400; line-height: 40px;width: 600px;height: 500px;float: left;padding-top: 110px;} 
#container #section02 .inner .right-txt > div{ margin: 20px 0;}
.red{color:tomato; font-weight: 600;}
.blue{color:blueviolet; font-weight: 600;}
.green{color:green; font-weight: 600;}
/* section03 */
#container #section03 .inner .left-txt{ text-align: left;  padding-top: 70px;font-size: 40px; font-weight: 500; width: 600px; float: left; font-weight: 200;}
#container #section03 .inner .right-txt{ font-size: 20px; font-weight: 400; line-height: 40px; width: 400px; float: left;padding-top: 80px;} 
#container #section03 .inner .right-txt > a {
background-color: #304edf; display: block; width: 300px; height: 50px; text-align: center; color: #fff;
line-height: 50px; margin-top: 30px; float: right; font-weight: 300; border-radius: 10px;}

/* animation */
.animation {
    animation: fadein 1s;
    -moz-animation: fadein 1s; /* Firefox */
    -webkit-animation: fadein 1s; /* Safari and Chrome */
    -o-animation: fadein 1s; /* Opera */
}
.animation2 {
  animation: fadeinDelay 2s;
    -moz-animation: fadeinDelay 2s; /* Firefox */
    -webkit-animation: fadeinDelay 2s; /* Safari and Chrome */
    -o-animation: fadeinDelay 2s; /* Opera */
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
</html>