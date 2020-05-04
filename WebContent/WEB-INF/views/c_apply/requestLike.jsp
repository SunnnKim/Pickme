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



<style>

 /* 프로필 모달 시작 (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */.;
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.3); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 15px;
    border: 1px solid #888;
    width: 530px; /* Could be more or less, depending on screen size */  
   /*  height: 304px; */                        
}

.modal-content-wrap {display: inline-flex; border-bottom: 1px solid #aaa; border-top: 1px solid #aaa; width: 498px;margin-bottom: 23px;}
.modal-imgArea {width: 180px;}
.modal-imgWrap {float: left; width: 100%; text-align: center; margin-top: 20px;margin-bottom:15px}
.modal-textArea {width: 348px; padding-left: 10px; padding-right: 10px;}
.modal-introduce {resize: none; border: none; margin-bottom: 5px;}


/* 메시지 전송 버튼 */
.modal-msgBtn {margin-left: 9px}
.far.fa-envelope {font-size: 20px; vertical-align: middle; vertical-align: -2px}
/* 프로필 이미지 */
.apProfileImg {width: 140px; height: 140px; border-radius: 50%;}
/* 구직자 이름 */
.apProfileName {margin-top: 7px; display: inline-block; font-size: 20px;}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    margin-top: -12px;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.modal-textUl li {margin-top:5px}
.hashtag1 {display:inline-block;padding:5px 15px;font-size:13px;color:#fff;background:#999;border-radius:3px;margin-right:10px; margin-bottom: 10px; float: left}
.hashtag2 {display:inline-block;padding:5px 15px;font-size:13px;color:#fff;background:#999;border-radius:3px;margin-right:10px; margin-bottom: 10px; float: left}
.hashtag3 {display:inline-block;padding:5px 15px;font-size:13px;color:#fff;background:#999;border-radius:3px;margin-right:10px; margin-bottom: 10px; float: left}

/* 프로필 모달 끝 */



</style>


<!-- subCont 시작 -->

<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<!-- <li class="active"><a href="#allList" onclick="getList('allList', 1)">요청 목록</a></li> -->
	<li 			  ><a href="getRequestList.do">요청 목록</a></li>
	<li	class="active"><a href="requestLike.do">관심 인재</a></li>
</ul>


<!-- favorite -->
<div id="allList" data-tab-content="" class="active">
	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<input type="text" name="keyWord" title="검색어 입력" placeholder="검색어를 입력해주세요." value="${sKeyword }">
			<button type="button" class="btn-search" onclick="searchAction()"><span>검색</span>	</button>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<%-- <col style="width: 10%"> --%>
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 25%">
				<col style="width: 20%">
				<col style="width: 15%">
				<col style="width: 20%">
			</colgroup>
			<thead>
				<tr>
					<!-- <th>No</th> -->
					<th><input type="checkbox" id="checkall"></th>
					<th>관심</th>
					<th>이름</th>
					<th>요청일</th>
					<th>수락여부</th>
					<th>상태</th>
					<!-- 모두선택 -->
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty requestLike }">
					<tr>
						<td colspan="6">추가 된 인재가 없습니다</td>
					</tr>
				</c:if>

				<c:forEach items="${requestLike }" var="like" varStatus="vs">
					<tr>
						<%-- <td>${like.seq }</td> --%>
						<!-- 
						<td class="like-td">
							<i class="fas fa-heart liked"></i>
							<button type="button" onclick="likech(this)"><i class="fas fa-heart liked"></i></button>
						</td>
						 -->
						 
						<td><input type="checkbox" class="checkRow" name="checkRow" value="${like.seq}"></td>
						
						<td class="like-td">
							<%-- <input type="hidden" id="amem_seq" value="${request.seq }"> --%>
							
							<button type="button" onclick="likech(this, ${like.pseq }, '${like.email }')">
								<i class="fas fa-heart liked"></i>
							</button>

						</td>
						<td>	<!-- 구직자 기본 정보 링크 들어가야함 -->
							<a href="#none" style="text-align: center;" onclick="a_Profile(${like.pseq })">
								${like.name }
							</a>
						</td>
						<td>${like.rdate }</td>
							<td>
								<c:choose>
									<c:when test="${like.accept eq '1'}">
									수락
									</c:when>
									<c:when test="${like.accept eq '2'}">
									거절
									</c:when>
									<c:otherwise>
									대기
									</c:otherwise>
								</c:choose>
							</td>

							<td>
								<c:choose>
								<c:when test="${like.accept eq '1'}">
									<button type="button" class="btn-resumeOpen" onclick="resumeOpen(${like.cvSeq}, '${like.pEmail }')">이력서 열람</button>
								</c:when>
									<c:when test="${like.accept eq '2'}">
										 <!-- 요청 거절 됨 -->
								</c:when>
								<c:otherwise>
									<button type="button" class="btn-cancel" onclick="cancelAction(${like.seq})">요청취소</button>
										<%-- ${request.seq} = cv_request에 대한 seq --%>
									</c:otherwise>
								</c:choose>
							</td>
							
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btn-message clfix">
		<button type="button" class="delete_btn" onclick="deleteAction()">선택삭제</button>
	</div>

	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/c_apply/paging.jsp" flush="false">
			<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
		</jsp:include>
	</div><!-- // paging_wrap -->
	
</div>
<!-- // favorite -->




<!-- The Modal -->
<div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<input type="hidden" id="memSeq" value="">
		<input type="hidden" id="memName" value="">
		<button type="button" class="modal-msgBtn" onclick="cApplySendMsg()"><i class="far fa-envelope"></i>&nbsp;메시지 전송</button>
		<span class="close">&times;</span>
		<div class="modal-content-wrap">
			<div class="modal-imgArea">
				<div class="modal-imgWrap">
					<img class="apProfileImg" src="filedownload.do?filename=1.jpg&filepath=/upload/amember/" alt="프로필사진"> 
					<span class="apProfileName">
					</span>
				</div>
			</div>
			<div class="modal-textArea">
				<div style="float: right; width: 100%;">
					<ul class="modal-textUl">
						<li class="career"></li>
						<li class="job1" style="float: left"></li>
						<li class="job2"></li>
						<li>
							<textarea class="modal-introduce" rows="4.5px" cols="40px" readonly="readonly"></textarea>
						</li>
						<li><span class="hashtag1"></span></li>
						<li><span class="hashtag2"></span></li>
						<li><span class="hashtag3"></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>





<script>

//Get the modal
var modal = document.getElementById('myModal');

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

//When the user clicks on the button, open the modal 
/* 
btn.onclick = function() {
 modal.style.display = "block";
}
 */
//When the user clicks on <span> (x), close the modal
span.onclick = function() {
 modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal) {
     modal.style.display = "none";
 }
}




</script>

























<script>

	$(document).ready(function() {
				
		// 체크박스 전체 체크
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		});

		// 전체 체크 후 개별 체크 해제할 경우 전체 체크 해제		
		$("input[name=checkRow]").click(function(){
			$("#checkall").prop("checked", false);
		});
	})
	
	
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
								//alert("pn  : "  + pn);
								
								
								if (result.value) {
								    Swal.fire({
								      icon : 'success',
								      text : '취소 완료'
								    }).then( (result) => {
								    	location.href="requestLike.do?sKeyword="+sKeyword+"&pageNumber="+pn;
								    })
								}
								
								
								
								
								
								
								//location.href="requestLike.do?sKeyword="+sKeyword+"&pageNumber="+pn;
							}
						},
						error:function(request,status,error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
						}
					});   
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
			  text : '삭제 할 목록을 선택하세요'
			})
			return false;
		}
		console.log("### checkRow => {" + checkRow + "}");

		//if (confirm("선택 된 목록을 삭제 합니다. (요청 목록도 함께 삭제 됩니다)")) {

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
								    	location.href="requestLike.do?sKeyword="+sKeyword+"&pageNumber="+pn;
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
			location.href="requestLike.do?sKeyword="+keyWord+"&pageNumber=0";		
		}
	}
	/* 검색 엔터키 입력 */
	$("input[name=keyWord]").keyup(function(e){if(e.keyCode == 13) searchAction(); });



	/* 페이지 이동 */
	function goPage(pn){
	  var sKeyword = '<c:out value="${sKeyword}"/>';
	//  alert("sKeyword: " + sKeyword);	
		
	  location.href="requestLike.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
		
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
				alert(data.memEmail);


				
			},
			error		: function(request,status,error){ 
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
			

		})




		
	}




	function likech(btn, seq, email){
		//console.log($(btn).children('i'));
		$(btn).children(':first').removeClass('liked');
		$(btn).children(':first').addClass('unliked');

		/* 관심 해제시 대기시간 설정 */
		setTimeout(function() { 
			$.ajax({
				url		: 'delLike.do',
				type	: 'POST',
				data	: { "likePickSeq" : seq , "email" : email },
				success : function(result) {
					if(result) {
						location.href="requestLike.do";
					/*	
						Swal.fire({
							  position: 'center',
							  //icon: 'success',
							  text: '관심 인재 해제',
							  showConfirmButton: false,
							  width: 300,
							  timer: 500
						}).then( (result) =>{
					 		//document.querySelector('#frm').submit();
						
							//alert("test");
		
					 		location.href="requestLike.do";
						})
					*/
					}
				},
				error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			})		/* ajax end */
		}, 150);	/* setTimeout end */
	}





	//프로필 모달에 데이터 저장
	function a_Profile(p_seq){
		//alert("구직자 디테일 : " + p_seq);
		$.ajax({
			url		: "getaMemberProfile.do",
			type	: "post",
			dataType: "json",
			data 	: {"seq" : p_seq},
			success	: function(data){

				var AMember = data.AMember;

				if(AMember.open == 0) {
					Swal.fire({
					  position:'center',
					  icon : 'warning',
					  text : '프로필을 공개하지 않았습니다',
					  showConfirmButton: false,
					  timer: 1300
					})
				} else {
					var tempJob = AMember.job.split(',');
					var tempHash = AMember.hashtag.split(',');
					//alert("success : " + AMember.job );
					$('.apProfileName').html(AMember.name);
					$('.career').text('경력 : ' + AMember.career);

					if(tempJob[0]=="1차분류") {
						$('.job1').text("직무를 선택하지 않았습니다.");
						$('.job2').html("");
					} else {
						$('.job1').text(tempJob[0]);
						$('.job2').html('&nbsp;[ '+tempJob[1]+' ]');
					}
					$('.modal-introduce').text(AMember.introduce);
					$('.apProfileImg').attr("src", "filedownload.do?filename="+AMember.profileName+"&filepath=/upload/amember/")

					
					$('#memSeq').val(AMember.seq);
					$('#memName').val(AMember.name);
					
					for(var i=0 ; i < 3 ; i++) {
						if(tempHash[i] != "undefined") {
							$('.hashtag'+(i+1)).show();
							$('.hashtag'+(i+1)).text('#'+tempHash[i]);
						} else {
							$('.hashtag'+(i+1)).hide();
							/* $('.hashtag'+(i+1)).removeClass(); */
						}
					}
					modal.style.display = "block";
				}
			},
			error		: function(request,status,error){ 
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		})
	}



	/* 메시지 보내기 모달 */
	function cApplySendMsg() {
		var memSeq = $('#memSeq').val();
		var memName = $('#memName').val();

		$(".messenger-wrap").show();
		$('body').css("overfloww", "hidden");
		$("#toName").val("받는 이 : " + memName);
		$("input[name=to]").val(memSeq);	
	}












	

	/*	관심 인재 부분 토글 기능 삭제 
	function likech(btn){
	    console.log($(btn).children('i'));
	     if( $(btn).children('i').hasClass('unliked')==true ){
		     alert("like 전환");
	       $(btn).children('i').removeClass('unliked');
	       $(btn).children('i').addClass('liked');
	       
	    } else if($(btn).children(':first').hasClass('liked')) {
	    	alert("unlike 전환");
	        $(btn).children(':first').removeClass('liked');
	        $(btn).children(':first').addClass('unliked');
	     }
	  }
 	*/





 	
 	/* getList 삭제
	function getList(mode, page) {
		var $area;
		var url = "";
		if (mode == "" || page == "") {return false;}
		
		if (mode == "notice") {
			url = "/pc/cs/noticeListData.json";
			$area = $("div#notice");
		} else if (mode == "favorite") {
			//url = "/pc/cs/winnerListData.json";
			url = "requestLikeList.do";
			//$area = $("div#winner");
		} else {
			url = "getRequestList2.do";
			$area = $("div#allList");
			//alert('11');
		}
		
		// 전송
		$.ajax({
			async		: true,
			url			: url,
			dataType	: 'text',
			type		: 'POST',
			contextType : 'application/json;charset=utf-8',
			data		: { }, //mode : mode , page : page , keyWord : keyWord
			success		: function(data, textStatus, jqXHR){
				// alert('getList : ' + data);
				// alert("dma : " +data.name);
					
			},
	
			error:function(request,status,error){ 
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		});
	}
	*/

	
</script>


<!-- subCont 끝 -->


<!-- 메세지 보내기 모달 -->
<%@include file="../../../include/cApplyWriteMsg.jsp" %>
<%@include file="/include/footer.jsp"%>
