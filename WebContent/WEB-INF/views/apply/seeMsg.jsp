<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/include/header.jsp"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


 		<div class="comeMsg" > 
          <div class="title">
              <h4>제목 불러오기</h4>
              <span>2020-04-01</span><!-- 메시지 보낸 날짜 불러오기-->
          </div><!-- // title-->
          <div class="from">            
              <p>보낸이 불러오기</p>
          </div>
          <div class="msg-content" >
            <p>
              내용 불러오기
              
            </p>

          </div><!--// msg-content -->
          <div class="messageBtn" id="msgBtn">
              <button onclick="delcheck()">삭제하기</button>  
              <button onclick="reply()">답장하기</button>    
              <button onclick="toList()">목록으로</button>
          </div><!-- // messageBtn-->
        </div><!--// comeMsg-->
        
        
        <form id="frm" action="" method="post">
        <div class="messageBox" id="app"> 
            <div class="messageCont">
                <div class="messageTo">
                    <input id="recipient" type="text"  value="보낸이 불러서 넣기">
                    <!--수신자수정도 가능하게 할까요? 아님 그냥 무조건 보낸사람한테만 보낼 수 있게 할까요?-->
                </div><!-- messageTo-->
                <div class="messageTit">
                    <input type="text" id="repl-title" placeholder="Title">
                </div><!-- // messageTit-->
                <div class="messageText">
                    <textarea id="repl-cont" placeholder=""></textarea>
                </div><!-- // mesageText-->
               <div class="messageBtn">
                    <button onclick="send()">보내기</button>
                    <button onclick="hideThis()">닫기</button>
                </div><!--//  messageBtn -->
            </div><!-- // messageCont-->
      </div><!-- // messageBox -->
    </form>
    
   <!--  <div class="delete-wrap">
	    <div class="delcheck">
	    	<h4>정말로 삭제하시겠습니까?</h4>
	    	<div class="delBtn">
		    	<button onclick="del(seq)">삭제</button>		
		    	<button onclick="cancel()">취소</button>
	    	</div>		    
		</div>
	</div> -->
<%@include file="/include/footer.jsp"%>
<script>

 $(".messageBox").hide();
   
// 답장하기 버튼 누른 경우

function reply(){
	
    $(".messageBox").show();
    $(".messageBox input").focus(function(){ $(".messageBox").css('box-shadow', '0px 0px 5px  rgba(0,0,0,0.2)');});
    $("#repl-cont").focus(function(){ $(".messageBox").css('box-shadow', '0px 0px 5px  rgba(0,0,0,0.2)');});
    $(".messageBox input").blur(function(){ $(".messageBox").css('box-shadow', '');});  
    $("#repl-cont").blur(function(){ $(".messageBox").css('box-shadow', '');});
   
    var offset = $('.messageBox').offset(); //선택한 태그의 위치를 반환

          //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

    $('html').animate({scrollTop : offset.top}, 400);  
    $("#msgBtn").hide();
    
}

// 답장 닫기
function hideThis(){
    $("#recipient").val("보낸이 불러서 넣기") // 수신자 수정 가능하게 했을경우 
    $("#repl-title").val("");
    $("#repl-cont").val("");
    $(".messageBox").hide();
  
}

function delcheck(){
	Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'취소',
		  confirmButtonText: '삭제'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
		})

	
	
} 

function del(seq){
	
}

</script>
