<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
 
<!-- 메시지작성 팝업 -->
 <div class="messenger-wrap">
     <form id="frm" action="" method="post">
         <div class="msgBox">
                <div class="msg-bar">
                    <h4>메세지 보내기</h4>
                </div><!-- // message-bar-->
                <div class="msgCont">
                    <div class="msgTo"><!--검색기능 jquery-ui, ajax사용-->
                        <input type="text" readonly="readonly" value="${recDto.comName }"  >
                        <input type="hidden" name="to" value="${recDto.comSeq}" > 
                    </div><!-- // messageTo-->

                    <div class="msgText">
                        <textarea id="content" name="content" placeholder=""></textarea>
                    </div><!-- // messageText-->
                    <div class="msgBtn">
                        <button type="button" onclick="send()">보내기</button>
                        <button type="button" onclick="hideThis()">닫기</button>
                    </div><!-- // messageBtn-->
                </div><!-- // messageCont-->
          </div><!-- // messageBox-->
 	 </form>
</div><!-- //messenger-wrap -->
      
<script type="text/javascript">

 	$(".messenger-wrap").hide();

 	// 쪽지보내기 버튼 클릭 
	$("#recruitDetailButton2").on("click", function(){
		 var member = $("#loginuser").val();
			console.log("member: " + member);
		// 로그인 세션체크 
		 if(member == null || member == 'undefined' || member == ""){
			  Swal.fire({
					  position: 'center',
					  icon: 'warning',
					  title: '로그인이 필요한 서비스입니다.',
					  showConfirmButton: true,
				}).then((result) => {

					location.href="/Pickme/login/memLogin.do";
				}) 	

	     }else{ 

		 	$(".messenger-wrap").show();
		 	$('body').css("overflow", "hidden");

	     }
	});

	//닫기 버튼 클릭
	function hideThis(){
	    $("#content").val("");
	    $(".messenger-wrap").hide();
	    $('body').css("overflow", "scroll");
	    
	}
	 //보내기버튼 클릭
	function send(){
		
		var formData = $("#frm").serialize();

		//메시지내용 있는지 여부 확인
		if (($("#content").val()).trim()  == null || ($("#content").val()).trim() == ""){
			Swal.fire({
				  position: 'center',
				  icon: 'warning',
				  title: '메시지를 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
			}) 		 
		}else{
		  $.ajax({
				url   :"../e_apply/sendMsg.do",
				type  :"post",
				data  :formData,
				dataType: "json",
				success:function(data){
					if(data != null){
						console.log(data.receiverEmail);
						console.log(data.msgSeq);
						console.log(data.senderName);
						console.debug("reply.js:: socket>>", socket)
						if(socket) {
							// websocket에 보내기  (distinguish, cmd, 메시지 보내는자이름, 메시지받는자이메일 , 메시지seq, 안읽은메시지갯수)
						   socket.send("com,alert," +  data.senderName + "," + data.receiverEmail 
								                       + "," + data.msgSeq + ",null,null");

						}  
						 
						 Swal.fire({
							  position: 'center',
							  icon: 'success',
							  text: '메시지가 성공적으로 보내졌습니다',
							  showConfirmButton: false,
							  timer: 1500
							})					
						
						$("#content").val("");
						$(".messenger-wrap").hide();
						$('body').css("overflow", "scroll");
						
					}	
				},
				error: function(){
					
				}	
			}); 
		}
	
	}
	// esc키로 모달창 닫기 
	window.onkeyup = function(e) {
		var key = e.keyCode ? e.keyCode : e.which;

		if(key == 27) {
			$(".messenger-wrap").fadeOut(90);
			$("body").css('overflow-y', 'scroll');
		}
	}
	 
	  
</script>  