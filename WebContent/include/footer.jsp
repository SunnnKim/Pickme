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
	   $(document).ready(function (){
		   connectWs();
	   });
	   //웹소켓 연결 	 
	   function connectWs(){
			console.log("Info: connecting...");
			// 웹소켓 객체생성
			var ws = new WebSocket("ws://localhost:8080/Pickme/echo.do");

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
					 $.ajax({
						    url:"../totalMsgCount.do",
						    dataType:"text",
						    success: function(data){
								if(socket) {
									console.log("메시지총갯수" + data);									
									// websocket에 메시지 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 메시지 갯수))
								    socket.send("null,unread,null,null,null," + data);
								}	
							}, 
						    error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}						
					 });

				} 
				
				// 기업회원 로그인 했을때 메시지 갯수 가져오기 
			  	if(company){
			  		console.log("loginCompany들어옴");
			  		/*
					 $.ajax({
						    url:"../여기에 기업 메시지갯수 가져오는 주소 넣기",
						    dataType:"text",
						    success: function(data){
								if(socket) {
									console.log("메시지총갯수" + data);
									// websocket에 보내기  (distinguish, cmd, 발신인이름 , 수신인이메일 , 메시지seq, 로그인 seq, 메시지 갯수))
								    let socketMsg = socket.send("null,unread,null,null,null,null,"+ data);
								 	console.debug("sssmsg >> ", socketMsg)
								 	socket.send(socketMsg)
								}	
							}, 
						    error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}		
					 });
					 */
				 }
			}

			// 서버에서 메시지 도착한 경우
		    ws.onmessage = function(event){

				if((event.data).includes("메시지")){//메시지 도착시 alert 
					console.log("ReceiveMessage:", event.data + '\n');
					
		            let $socketAlert = $('div#socketAlert');
		             $socketAlert.html(event.data); 
		            // $socketAlert.css('display', 'block');
					 $socketAlert.slideDown();
					 
		            setTimeout( function(){
		            	 $socketAlert.slideUp();
		            	 
		            },6000);
		            
				}else{ // 안읽은 메시지 갯수 표시
					
					if(event.data > 0){
						console.log("event.data: " + event.data);
						$(".alert-number").css('display', 'block');
						$(".alert-number").text(event.data);
						
					}else{
						console.log("메시지 없음")
						$(".alert-number").css('display', 'none');

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
	 </script>
</body>
</html>