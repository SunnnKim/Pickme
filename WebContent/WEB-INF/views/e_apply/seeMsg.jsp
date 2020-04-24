<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
	

<!-- 헤더 호출  -->
<%@include file="/include/header.jsp"%>

<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li id="inMsg"><a href="inMsg.do" >받은 메시지</a></li>
	<li id="outMsg"><a href="outMsg.do" >보낸 메시지</a></li>
	<li id="impoMsg"><a href="impoMsg.do" >중요 메시지</a></li>
</ul>

<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>


 		<div class="comeMsg" > 
         <div class="title">
              <span>${ msgDetail.sdate}</span><!-- 메시지 보낸 날짜 불러오기-->
          </div><!-- // title-->
          <div class="from">             
             <a href="클릭시 기업정보페이지가기"><span class=msgFrom>보낸이: <strong>${msgDetail.name }</strong> </span></a>
          </div>
          <div class="msg-content" >
            <pre><c:out value="${msgDetail.content }" /></pre>

          </div><!--// msg-content -->
          <div class="messageBtn" id="msgBtn">
              <button onclick="delcheck()">삭제하기</button>  
              <button id="_reply" onclick="reply()">답장하기</button> 
           
              
          <c:if test="${page eq 'inMsg'}">
          	  <c:if test="${unread == 0 }">
          		  <a href="inMsg.do?pageNumber=${pageNumber }"><button>목록으로</button></a>
          	  </c:if> 
         	  <c:if test="${unread == 1 }">
              	<a href="unread.do?page=inMsg&pageNumber=${pageNumber }"><button>목록으로</button></a>
         	</c:if>
          </c:if>
		 <c:if test="${page eq 'impoMsg'}">
		 	<c:if test="${unread == 0 }">
		 		 <a href="impoMsg.do?pageNumber=${pageNumber }"><button>목록으로</button></a>
		 	</c:if>
		 	<c:if test="${unread == 1 }">
		 		 <a href="unread.do?page=impoMsg&pageNumber=${pageNumber }"><button>목록으로</button></a>
		 	</c:if>
        </c:if>
        <c:if test="${page eq 'outMsg' }" >  
         		 <a href="outMsg.do?pageNumber=${pageNumber }"><button>목록으로</button></a> 
         </c:if>
          </div><!-- // messageBtn-->
        </div><!--// comeMsg-->
        
        <!-- 메시지 답장보내기 -->
        <form id="frm" action="" method="post">
        <div class="messageBox" id="app"> 
            <div class="messageCont">
                <div class="messageTo">
                    <img alt="" src="<%=request.getContextPath()%>/images/main/reply.png" >
                    <span id="recipient">${msgDetail.name }</span> 
                    <input id="to_seq" type="hidden" name="to" value="${msgDetail.from }">
                </div><!-- messageTo-->

                <div class="messageText">
                    <textarea id="repl-cont" name="content" placeholder=""></textarea>
                </div><!-- // mesageText-->
               <div class="messageBtn">
                    <button type="button" onclick="send()">보내기</button>
                    <button type="button" onclick="hideThis()">닫기</button>
                </div><!--//  messageBtn -->
            </div><!-- // messageCont-->
      </div><!-- // messageBox -->
    </form>
    
    
 </div> <!-- // all list -->   
<%@include file="/include/footer.jsp"%>

<script>
	$(document).ready(function(){	
		var page = '<c:out value="${page}"/>'
		// messageDetail 들어오기 직전 탭 지정하기
		document.getElementById(page).setAttribute('class', 'active');
		
		if(page == 'outMsg'){ // 보낸 메시지 답장기능 숨기기
			$("#_reply").hide();
		}
		// 처음에 답장창 숨기기
		$(".messageBox").hide();
	});
	
	   
	// 답장하기 버튼 누른 경우
	function reply(){
	
	    $(".messageBox").show();
	    $(".messageBox input").focus(function(){ $(".messageBox").css('box-shadow', '0px 0px 5px  rgba(0,0,0,0.2)');});
	    $("#repl-cont").focus(function(){ $(".messageBox").css('box-shadow', '0px 0px 5px  rgba(0,0,0,0.2)');});
	    $(".messageBox input").blur(function(){ $(".messageBox").css('box-shadow', '');});  
	    $("#repl-cont").blur(function(){ $(".messageBox").css('box-shadow', '');});
	   
	    var offset = $('.messageBox').offset(); //선택한 태그의 위치를 반환
	    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
	    $("html body").animate({scrollTop : offset.top}, 400);  
	    $("#msgBtn").hide();
	    
	}
	
	// 답장 닫기
	function hideThis(){
	    $("#repl-cont").val("");
	    $(".messageBox").hide();
	    $("#msgBtn").show();
	  
	}
	
	function delcheck(){
		var seq = '<c:out value="${msgDetail.seq}"/>';
		Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'취소',
			  confirmButtonText: '삭제'
			}).then((result) =>{
				 var seqArray = [];
				 seqArray.push(seq);
				
			  if (result.value) {
					$.ajax({
						url        : "deleteMsg.do",
						dataType   : "json",
						type       : "post",
					    traditional: true, // array보낼때 필요
						data       : {"seqArray" : seqArray },
						success    : function(data){
							if(data != null){
								 Swal.fire(
									      '삭제되었습니다',
									      '',
									      'success'
								    ).then((reslut)=>{
								var goPage = '<c:out value="${page}"/>'
									//alert("goPage: " + goPage);
								if(goPage == 'impoMsg'){
									location.href="impoMsg.do";
								}else if(goPage == 'inMsg'){
									location.href="inMsg.do";
								}else if(goPage == 'outMsg'){
									location.href="outMsg.do";
									
								}	
	
								});
							}	
	
						},
						error      : function(request, status, error){
							alert("error");
						}
					});
			  
			  	}
			});
		
	
	} 


	function send(){
		var formData = $("#frm").serialize();
		if (($("#repl-cont").val()).trim()  == null || ($("#repl-cont").val()).trim() == ""){
			Swal.fire({
				  position: 'center',
				  icon: 'warning',
				  title: '메시지를 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
			}) 		 
		}else{
		  $.ajax({
				url   :"sendMsg.do",
				type  :"post",
				data  :formData,
				dataType: "json",
				success:function(data){
					if(data != null){
						console.log(data.receiverEmail);
						console.log(data.loginSeq)
						console.log(data.msgSeq);
						console.log(data.senderName);
						console.debug("reply.js:: socket>>", socket)
						if(socket) { // 소켓객체가 존재하는 경우
							// websocket에 보내기  (distinguish, cmd, 메시지 보내는자이름, 메시지받는자이메일 , 메시지seq, 안읽은메시지갯수)
						   let socketMsg = socket.send("com,alert," +  data.senderName + "," + data.receiverEmail 
								                       + "," + data.msgSeq + ",null");
						 	console.debug("sssmsg >> ", socketMsg);
						 	socket.send(socketMsg)
						}
												
						Swal.fire({
							  position: 'center',
							  icon: 'success',
							  text: '메시지가 성공적으로 보내졌습니다',
							  showConfirmButton: false,
							  timer: 1500
							});						
						$("#repl-cont").val("");
						$(".messageBox").hide();
						$("#msgBtn").show();
					}	
				},
				error: function(){
					
				}	
			}); 
		}
	
	}

	function searchAction() {
		alert("검색 버튼 클릭");
		var sKeyword = ($("#_keyword").val()).trim();
		
		alert("sKeyword: " + sKeyword );
		if(sKeyword == null || sKeyword == ""){
			alert("검색어를 입력해주세요.");
		}else{
			var page = '<c:out value="${page}"/>'
			if(page == 'inMsg'){
			 	location.href="inMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
			}else if(page =='outMsg'){
				location.href="outMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";	
				
			}else if(page == 'impoMsg'){
				
				location.href="impoMsg.do?sKeyword=" + sKeyword +"&pageNumber=0";
			}
		}
	}	

	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });
</script>




















