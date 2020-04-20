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
                        <!--https://jqueryui.com/autocomplete/ 
                            https://hellogk.tistory.com/74
                            참고하면 될듯해요-->
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

	$("#recruitDetailButton2").on("click", function(){
		 $(".messenger-wrap").show();
		
	});

	//닫기 버튼 클릭
	function hideThis(){
	    $("#content").val("");
	    $(".messenger-wrap").hide();
	    
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
				success:function(result){
					if(result == 1){
						Swal.fire({
							  position: 'center',
							  icon: 'success',
							  text: '메시지가 성공적으로 보내졌습니다',
							  showConfirmButton: false,
							  timer: 1500
							})					
						
						$("#content").val("");
						$(".messenger-wrap").hide();
						
					}	
				},
				error: function(){
					
				}	
			}); 
		}
	
	}

  
</script>  