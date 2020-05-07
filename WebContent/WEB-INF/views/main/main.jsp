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
<title>Pick me</title>
<link rel="icon" href="/Pickme/images/main/pickme.ico" sizes="32x32">
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
			 // 일반 로그인일 떄 
		 	 if( member != null ){
		 		 %>
		 		 <nav class="gnb">
					<a href="/Pickme/searchJob/recSearch.do">채용탐색</a> <!-- 일반회원 채용탐색  -->
					<a href="/Pickme/resume/resume.do">이력서</a><!-- 일반회원 이력서관리  -->
					<a href="/Pickme/e_apply/curCvReq.do">지원현황</a><!-- 일반회원 지원현황  -->
					<a href="/Pickme/customer/noticeList.do">고객센터</a>
				</nav>
				<!-- // gnb -->
				<ul class="header_infoBtn clfix">
					<li><button type="button" id="searchBtn"></button></li>
					<li class="alert-wrap bell">
					   <span class="alert-bell"><img alt="" src="../images/main/alarm-bell.png"></span>
					   <div id='alert-NoContent' class="alertContWrap">현재 관심등록한 기업의 채용공고가 없습니다.</div>	
					 </li>	
					<li class="alert-wrap msg">	
					   	<a href="/Pickme/e_apply/inMsg.do"><img alt="" src="../images/main/message.png" width="20px" height="20px"></a> 
					</li>
					<li>
						<a href="/Pickme/a_mypage/profile.do"><%=userName %> 님 </a><!-- 일반회원 마이페이지 -->
					</li>
					<li><a href="/Pickme/login/logout.do">로그아웃</a></li>
				</ul>
		 		 <%
		 		 // 기업회원 로그인일때
		 	 } else if( company != null ){
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
		<!-- 현재공고/지난공고 볼때  로그인한 기업 seq 넘기기 -->
		function goPage(str) {
		    var f = document.seqFrm;
	
		    if(str==="now"){
			    f.action = "/Pickme/recruit/recNow.do"
		    } else if(str==="past"){
		    	f.action = "/Pickme/recruit/recPast.do"
		    } else if(str==="insert"){
				f.action = "/Pickme/recruit/recInsert.do"
		    }
		    // 전송 방식 : post
		    f.method = "post"
		    f.submit();
		  };

			
	
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
	          <h2>요즘 뜨는 기업 <a href="#none"><i class="fas fa-cog"></i></a></h2>
	          <!-- <a href="#none">more +</a> -->
	        </div>
	        <div class="cont">
	          <ul class="pmList clfix">
	          	<c:forEach items="${companyList }" var="dto" varStatus="index">
	            <li><a href="/Pickme/c_mypage/goCMypage.do?sentSeq=${dto.seq }">
	              <div class="img">
			          <img src="/Pickme/searchJob/filedownload.do?filename=${dto.logoName }&filepath=${dto.logoPath }" alt="엑박" onerror="this.src='/Pickme/images/sub/no-img.png'"/>
	              	<img src="/Pickme/searchJob/filedownload.do?filename=${dto.logoName }&filepath=${dto.logoPath }" alt="엑박">
	              </div>
	              <div class="txt">
	                <h3>${dto.name }</h3>
	                <p>${dto.department }</p>
	              </div>
	            </a></li>
	          	</c:forEach>
	          </ul>
	        </div>
	      </div><!-- // inner -->
	    </div><!-- // section01 -->
	    <div id="section02">
	      <div class="inner">
	        <div class="m-tit">
	          <h2>금주의 채용</h2>
	          <a href="/Pickme/searchJob/recSearch.do">more +</a>
	        </div>
	        <div class="cont">
	        	<c:choose>
	          		<c:when test="${empty recTopList }">
						<div style="text-align:center; position:relative; margin-top:4wndl0px;">
	          			<p style="position:absolute; top:0; left:0; width:100%; font-size:30px;">등록된 공고가 없습니다.</p>
						<%-- <img src="${pageContext.request.contextPath }/images/sub/notfound.jpg" style="width:60%;"> --%>
						</div>
					</c:when>
					<c:when test="${not empty recTopList }">
						   <ul class="pmList clfix">
						  
							<c:forEach items="${recTopList }" var="dto" varStatus="rs">
								<li><a href="/Pickme/searchJob/recDetail.do?seq=${dto.seq }">
					              <div class="img">
					               <img src="/Pickme/searchJob/filedownload.do?filename=${dto.imagename }&filepath=/upload/recruit/"  onerror="this.src='/Pickme/images/sub/no-img.png'" alt="엑박">
					              </div>
					              <div class="txt">
					                <h3>${dto.title }</h3>
					                <p>${dto.comName }</p>
					                <p>${dto.comJobType }</p>
					                <span>[채용]${dto.wdate } ~ ${dto.edate }</span>
					              </div>
					            </a></li>
							</c:forEach>
			         	 </ul>
			     	</c:when>
          		</c:choose>
		    </div><!-- cont -->
	      </div><!-- // inner -->
	    </div><!-- // section02 -->
	    <div id="section03">
	      <div class="inner">
	        <div class="m-tit">
	          <h2>공지사항</h2>
	          
	          <a href="/Pickme/customer/noticeList.do">more +</a>
	          <div class="notice-wrap">
			<c:forEach items="${mainNoticeList }" var="dto" varStatus="rs">
              <div class="content" onclick="goNotice('${dto.seq}')">
                <div class="notice-info">
                  <div class="title">${dto.title }
                  </div>
                  <div class="type">[${dto.type }]</div>
                  <div class="date">${dto.wdate }</div>
                </div>
              </div>
			</c:forEach>
            </div>
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
			var ws = new WebSocket("ws://192.168.2.31:8090/Pickme/echo.do");

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
		 


		// 공지사항클릭시 페이지로 가기
		goNotice = (seq) => {
			location.href="/Pickme/customer/noticeDetail.do?seq=" + seq;
		}
		
	   
	 </script>

</body>
</html>
<style>
.notice-wrap{ height: 300px; cursor: pointer; display: flex; flex-flow: row nowrap; justify-content:space-between; }
.notice-wrap .content{ width:240px; height: 180px; margin-top: 80px;border: 1px solid #eaeaea; overflow: hidden; cursor: pointe;}
.notice-wrap .content:hover{ }
.notice-wrap .notice-info{transition: all 0.5s ease-in-out; width: 100%; height: 100%; }
.notice-wrap .notice-info:hover{transform: scale(1.1); font-weight: 600;}
.notice-wrap .notice-info > div { margin: 0 10px;}
.notice-wrap .notice-info .type{ margin: 0 10px; float: left; color: #333; font-weight: 200;}
.notice-wrap .notice-info .title{ font-size: 18px; font-weight: 400;
    margin: 0 10px; margin-top: 50px; height: 50px;line-height: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis}
.notice-wrap .notice-info > .date { float: right; margin: 0 20px; color: #333; font-weight: 200;}
</style>