<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>


	<!-- subCont 시작 -->
	
	<!-- 메뉴 -->
	<ul class="tab-default column3 mt30" data-tab="">
		<!-- <li class="active"><a href="#allList" onclick="getList('allList', 1)">요청 목록</a></li> -->
		<li class="active"><a href="interestCom.do">관심기업</a></li>
		<li><a href="interestComRecruit.do">관심기업채용</a></li>
		<li><a href="likeRecruit.do">내가찜한채용공고</a></li>
	</ul>

	<!-- allList -->
	<div id="allList" data-tab-content="" class="active">
		<!-- 검색창 -->
		<div class="bbs-top">
			<div class="form-search">
				<input type="text" id="_keyword" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value=${sKeyword }>
				<button type="button" class="btn-search" onclick="searchAction()"><span>검색</span>	</button>
			</div>
		</div>

		<!-- 총 인원 -->
		
		<div class="bbs-infoWrap clfix mt30">
			<div class="bbs-lt">
				총 <span>${totalRecordCount }</span>개
			</div>
			<div class="bbs-rt">
				<p class=cancel-notice></p>
			</div>
		</div>
		
		<!-- 리스트 -->
		<div class="table-col table-bbs mt10" >
			<table>
				<caption>전체</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 30%">
					<col style="width: 30%">
					<col style="width: 30%">
				</colgroup>
				<thead>
					<tr>
						<th>관심</th>
						<th>기업명</th>
						<th>전화번호</th>
						<th>쪽지</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty interComList}">
					 	<tr>
						<c:if test="${!sKeyword eq null || (not empty sKeyword)}">
							<td colspan="4">검색결과가 없습니다</td>
						</c:if>		
						<c:if test="${(sKeyword eq null) || (empty sKeyword)}">
							<td colspan="4">관심기업이 없습니다</td>
						</c:if>
						</tr>
					</c:if>
					<c:forEach items="${interComList }" var="interCom" varStatus="vs">
						<tr>
							<td class="like-td">
								<button type="button" onclick="likech(${interCom.likepickseq })">
									<i class="fas fa-heart liked"></i>
								</button>
							</td>
							
							<td >	<!-- 기업 기본 정보 링크 들어가야함 -->
								<a class="interest-com" href="/Pickme/c_mypage/goCMypage.do?sentSeq=${interCom.likepickseq }">
									${interCom.name }
								</a>
							</td>
							<td  style="text-align: center;"><span class="interest-com">${interCom.tel }</span></td>
							<td>
								<button onclick="sendMsg(${interCom.likepickseq}, '${interCom.name }')" class="sendMsgBtn">쪽지보내기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 페이징 -->
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/c_apply/paging.jsp" flush="false">
				<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
				<jsp:param name="pageNumber" value="${pageNumber }" />
				<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
				<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
			</jsp:include>
		</div>
		<!-- // paging_wrap -->
		
	</div>
	 <!-- // allList -->


<!-- 메시지작성 팝업 -->
 <div class="messenger-wrap">
     <form id="frm" action="" method="post">
         <div class="msgBox">
                <div class="msg-bar">
                    <h4>메세지 보내기</h4>
                </div><!-- // message-bar-->
                <div class="msgCont">
                    <div class="msgTo"><!--검색기능 jquery-ui, ajax사용-->
                        <input type="text" id="receiver" readonly="readonly" value=""  >
                        <input type="hidden" id="_to" name="to" value="" > 
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
	function sendMsg(comSeq, comName){
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
		    $("#receiver").val(comName);
		    $("#_to").val(comSeq);
		 	$(".messenger-wrap").show();
		 	$('body').css("overflow", "hidden");

	     }
	}

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
						   let socketMsg = socket.send("com,alert," +  data.senderName + "," + data.receiverEmail 
								                       + "," + data.msgSeq + ",null");
						 	console.debug("sssmsg >> ", socketMsg)
						 	socket.send(socketMsg)
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

	window.onkeyup = function(e) {
		var key = e.keyCode ? e.keyCode : e.which;

		if(key == 27) {
			$(".messenger-wrap").fadeOut(90);
			$("body").css('overflow-y', 'scroll');
		}
	}


   // 관심기업 삭제 	 
	function likech(likepickseq){
		
		//alert(likepickseq);
		var pn = '<c:out value="${pageNumber }"/>'
		$.ajax({
			 url: "removefav.do", 
			 data: {"likepickseq" : likepickseq,
				   "auth" : 1},
			 type: "post", 
			 dataType: "json",
			 success: function(data){
				if(data >0){
					// alert("관심기업 삭제");
					
					location.href="interestCom.do?pageNum=" + pn;

					}
			 },
			 error: function(){
					alert("error");

		    }
	    })
	}


	function searchAction() {
		//alert("검색 버튼 클릭");
		
		var sKeyword =($("#_keyword").val()).trim();		
		// alert("sKeyword: " + sKeyword );
		
		if(sKeyword == null || sKeyword == ""){
			Swal.fire({
				  icon : 'warning',
				  text : '검색어를 입력해 주세요'
				})
		}else{
		 location.href="interestCom.do?sKeyword=" + sKeyword +"&pageNumber=0";
		}
	}
	// 엔터키로 검색 
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });	


	/* 페이지 이동 */
	function goPage(pn){
		  var sKeyword = '<c:out value="${sKeyword}"/>';
		  alert("sKeyword: " + sKeyword);
	
			
		  	location.href="interestCom.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
	
	}	

</script> 


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>