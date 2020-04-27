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
				<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해 주세요." value=${sKeyword }>
				<button type="button" class="btn-search" onclick="searchAction()"><span>검색</span>	</button>
			</div>
		</div>

		<!-- 총 인원 -->
		
		<div class="bbs-infoWrap clfix mt30">
			<div class="bbs-lt" > 총 <span>${totalRecordCount }</span>개</div>
		</div>
 		


		<!-- 리스트 -->
		<div class="table-col table-bbs">
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
							<td colspan="4">관심기업이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach items="${interComList }" var="interCom" varStatus="vs">
						<tr>
							<td class="like-td">
								<button type="button" onclick="likech(${interCom.likepickseq }')">
									<i class="fas fa-heart liked"></i>
								</button>
							</td>
							
							<td>	<!-- 기업 기본 정보 링크 들어가야함 -->
								<a href="#none" style="text-align: center;" onclick="a_detail(${interCom.likepickseq })">
									${interCom.name }
								</a>
							</td>
							<td>${interCom.tel }</td>
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
	 
	function likech(likepickseq){
		var pn = '<c:out value="${pageNumber }"/>'
		$.ajax({
			 url: "removefav.do", 
			 data: {"likepickseq" : likepicseq},
			 type: "post", 
			 dataType: "json",
			 success: function(data){
				if(data >0){
					alert("관심기업 삭제");
					
					location.href="interestCom.do?pageNum=" + pn;

					}
			 },
			 error: function(){
					alert("error");


		    }




	    })




	}


	
/*
	
	관심 인재 
	function likech(btn, seq, email){
		console.log($(btn).children('i'));

		if( $(btn).children('i').hasClass('unliked')==true ){
			//alert("unliked 선택 / seq : " + seq + " email : " + email);
			$(btn).children('i').removeClass('unliked');
			$(btn).children('i').addClass('liked');

			$.ajax({
				url		: 'addLike.do',
				type	: 'POST',
				data	: { "likePickSeq" : seq , "email" : email },
				success : function(result) {
					if(result) {
						//alert("관심 인재 추가");
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			})
		} else if($(btn).children(':first').hasClass('liked')) {
			//alert("liked 선택 / seq : " + seq);
			$(btn).children(':first').removeClass('liked');
			$(btn).children(':first').addClass('unliked');

			
			$.ajax({
				url		: 'delLike.do',
				type	: 'POST',
				data	: { "likePickSeq" : seq , "email" : email },
				success : function(result) {
					if(result) {
						//alert("관심 인재 해제");
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			})
			
			
			
			
		
		}
	}
	
	/* 열람요청 취소 */
	function cancelAction(seq) {
		//alert("요청을 취소 할 cv_request의 seq : " + seq)
		
		//if (confirm("열람 요청을 취소 합니다.")) {
		Swal.fire({
			 // title: '열람 요청을 취소합니다.',
			  text: "열람 요청을 취소합니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#4f6eff',
			  cancelButtonColor: '#ff7373',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
				if(result.value) {
					$.ajax({
						url : 'requestCancel.do',
						type : 'POST',
						data : { "cv_seq" : seq },
						/* dataType  : "String", */
						success : function(cancelCount) {
							//alert("요청 취소 리턴 값 : " + result);
							if(cancelCount == 1) {
								//alert("취소 완료");
		
								var sKeyword = '<c:out value="${sKeyword}"/>';
								var pn = <c:out value="${pageNumber}"/>;
		
								var totalRecordCount = <c:out value="${totalRecordCount }"/>;
								var recordCountPerPage = <c:out value="${recordCountPerPage }"/>;
								var screenEndPageIndex = $('.paging > ul > li').last().text();
								//alert(screenEndPageIndex)
								
								/* 마지막 페이지에 글이 하나일때, 그 글을 삭제하면 앞페이지로 전송 */
								if( (pn+1) == screenEndPageIndex ) {	// 현재 페이지가 마지막 페이지 일 때 
									//alert('totalRecordCount % recordCountPerPage:'+totalRecordCount % recordCountPerPage)
									if( cancelCount == (totalRecordCount % recordCountPerPage)){
										pn = pn - 1;
									}
								}
		
								if (pn < 0) pn = 0;
								//alert("pn  : "  + pn);ㄴ
								
								
								if (result.value) {
								    Swal.fire({
								      icon : 'success',
								      text : '취소 완료'
								    }).then( (result) => {
										location.href="getRequestList.do?sKeyword="+sKeyword+"&pageNumber="+pn;
								    })
								}
							}
						},
						error:function(request,status,error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
						}
				   });   /* ajax end */
			 }
		})
	}
	
	
	
	
	
	/* 선택 삭제(체크박스된 것 전부) */
	function deleteAction() {

		
		var checkRow = "";
		$("input[name='checkRow']:checked").each(function() {
			checkRow = checkRow + $(this).val() + ",";
		});
		checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		//alert("checkRow seq : " + checkRow); 

		if (checkRow == '') {
			//alert("삭제 할 목록을 선택하세요.");
			Swal.fire({
			  icon : 'question',
			  text : '삭제 할 목록을 선택하세요',
			  confirmButtonColor: '#4f6eff'
			})
			return false;
		}
		console.log("### checkRow => {" + checkRow + "}");
		//if (confirm("선택된 목록을 삭제 합니다")) {
		
		Swal.fire({
			  title: '선택 된 목록을 삭제 합니다',
			  text: "* 주의 : 요청 목록도 함께 삭제 됩니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#4f6eff',
			  cancelButtonColor: '#ff7373',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
				if(result.value) {

					$.ajax({
						url : 'requestDelete.do',
						type : 'POST',
						data : { checkRow },
						/* dataType  : "String", */
						success : function(deleteCount) {
							//alert("success : " + result );
							if(deleteCount != null) {
								//alert(deleteCount + "개가 삭제 되었습니다");
								var sKeyword = '<c:out value="${sKeyword}"/>';
								var pn = <c:out value="${pageNumber}"/>;

								var totalRecordCount = <c:out value="${totalRecordCount }"/>;
								var recordCountPerPage = <c:out value="${recordCountPerPage }"/>;
								var screenEndPageIndex = $('.paging > ul > li').last().text();
								//alert(screenEndPageIndex)
								
								/* 마지막 페이지에 글이 하나일때, 그 글을 삭제하면 앞페이지로 전송 */
								if( (pn+1) == screenEndPageIndex ) {	// 현재 페이지가 마지막 페이지 일 때 
									//alert('totalRecordCount % recordCountPerPage:'+totalRecordCount % recordCountPerPage)
									if( deleteCount == (totalRecordCount % recordCountPerPage)){
										pn = pn - 1;
									}else if( (totalRecordCount % recordCountPerPage) == 0 && deleteCount == 10 ){
										pn = pn - 1;
									}
								}
								if (pn < 0) pn = 0;
								//alert("pn  : "  + pn);
								
								if (result.value) {
								    Swal.fire(
								      '삭제 완료',
								      deleteCount +'개의 항목이 삭제 되었습니다.',
								      'success'
								    ).then( (result) => {
								    	location.href="getRequestList.do?sKeyword="+sKeyword+"&pageNumber="+pn;
								    })
								}
							}
						},
						error:function(request,status,error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
						}
					})
				} else {
					/* 취소 했을 때 */					
				}
			}) /* Swal.fire end */
		//}
	}


	/* 검색 버튼 */
	function searchAction() {
		//alert("검색 버튼 클릭");
		var keyWord = "";
		keyWord = $.trim($("input[name=keyWord]").val());
		//alert("키워드 : "+keyWord);
		
		if(keyWord == null || keyWord == "") {
			//alert("검색어를 입력해주세요.");
			Swal.fire({
			  icon : 'question',
			  text : '검색어를 입력해 주세요'
			})
		} else {
			location.href="getRequestList.do?sKeyword="+keyWord+"&pageNumber=0";		
		}
	}
	/* 검색 엔터키 입력 */
	$("input[name=keyWord]").keyup(function(e){if(e.keyCode == 13) searchAction(); });
	
	

	/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
	  location.href="getRequestList.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
	}

	function a_detail(p_seq){
		alert("구직자 디테일 : " + p_seq);
	}

	function resumeOpen(cvSeq, pEmail) {
		//var w = window.open("about:blank","_blank","width=600, height=700, top=0,left=0,scrollbars=no");

		
		alert(" 이력서 열람 요청 준비중 : resumeOpen() >>>> "+cvSeq + " // " + pEmail )
		 
		$.ajax({
			url 		: "reqResumeOpen.do",
			type		: "POST",
			dataType	: "json",
			data		: {"cvSeq" : cvSeq , "pEmail" : pEmail},
			success 	: function(data) {
				alert("success");
				//w.location.href = "getRequestList.do";
				if(data.filePath == null) {
					alert("filePath : null 웹페이지 연결");

					//alert(data.comseq);
				} else {
					alert("파일 다운로드 연결");
				}
				


				
			},
			error		: function(request,status,error){ 
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
			

		})




		
	}

	 
</script> 


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>