<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	 		</div><!-- // subCont -->
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
	
	
<!-- for 웹소켓 기업 / 개인회원구분 -->
<input type="hidden" id="loginuser" value="${loginuser }">
<input type="hidden" id="logincompany" value="${logincompany }">

<!-- 웹소켓 -->
<script>

	// 소켓 전역변수 
	  var socket = null;
	  var member = $("#loginuser").val();
	  var company = $("#logincompany").val();	
	  
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
				
			    
				// 일반회원 로그인 했을때 메시지 갯수 가져오기 	
				if(member){	
						if(socket){
						console.log("loginuser들어옴");
						console.log("loginuser: " + member);
						 $.ajax({
							    url:"../totalMsgCount.do",
							    dataType:"text",
							    success: function(data){
										console.log("메시지총갯수" + data);									
										// websocket에 메시지 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 메시지 갯수))
									    socket.send("null,unread,null,null,null," + data + ",null");
								
								}, 
							    error:function(request,status,error){
								    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}						
						 });
					
						$.ajax({
								url:"../recentLikeRecruit.do",
							    dataType:"text",
						    	success: function(data){
							    	console.log("recruit: " + data);
							    	if(data != null){
								    	console.log("data != null");
										socket.send("null,recruit,null,null,null,null," + data);
							    	}
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
						    url			: "/Pickme/c_apply/totalMsgCount.do",
						    dataType	: "text",
						    method		: "post",
						    success		: function(data){
								if(socket) {
									console.log("메시지총갯수" + data);
									// websocket에 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 로그인 seq, 메시지 갯수))
								    let socketMsg = socket.send("null,unread,null,null,null,"+ data + ",null");
								 	console.debug("sssmsg >> ", socketMsg)
								 	socket.send(socketMsg)
								}	
							}, 
						    error		: function(request,status,error){
						    	alert("footer.jsp socket error");
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
					// $('.alert-recruitList').hide();
				 	// alert(event.data);
					


				}else{ // 안읽은 메시지 갯수 표시
					if(event.data > 0){
					
						console.log("event.data?: " + event.data);
						/* $('li.alert-wrap').html('<a class="msgCountAlert" href="/Pickme/c_apply/cRcvMsg.do"><img class="msgCountAlert" alt="" src="../images/main/message.png" width="20px" height="20px"></a>');
						$('li.alert-wrap').html('<span class="alert-number">'+ event.data + '</span>');  */
						//$(".alert-number").css('display', 'block');
						//$(".alert-number").text(event.data); 
						$('.alert-wrap.msg').append('<span class="alert-number">'+event.data+'</span>');

						
					}else if(event.data == 0){
						console.log("메시지 없음?");
						$('.alert-wrap.msg').find('span').remove();				
						
						
				   }
			  }	
		 }
			 		
	 	// 소켓 닫힌경우
	    ws.onclose = function() {
	      	console.log('connect close');
	  
	    };

	    // 에러발생시
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
</html>