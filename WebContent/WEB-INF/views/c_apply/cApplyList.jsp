<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JQuery 추가 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>



<!-- subCont 시작 -->

<!-- 메뉴 -->
<!-- 
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="cApplyList.do">현재공고</a></li>
	<li><a href="">지난공고</a></li>
</ul>
 -->

<style>
.apProfile {
	width: 70px;
	height: 70px;
	border-radius: 50%;
}

.apProfileDetail {
	width: 140px;
	height: 140px;
	border-radius: 50%;
}

.capply-menu ul {display:none;position:absolute;top:-40px;left:50px;width:100px;/* height:84px; */background:#fff;box-shadow:0 0 10px rgba(0,0,0,0.3);}
.capply-menu ul li {line-height:28px;font-size:13px;}
.capply-menu ul li a {display:block; width: 100%; height:100%; padding:0 15px; transition:all 0.1s ease-in-out;}
.capply-menu ul li:hover a {background:#4f6eff; color:#fff;}


.capply-menu {position:relative; padding:7px 0; cursor:pointer;}
/* .capply-menu .resume-menuBtn {text-align:center; transform:rotate(90deg);} */




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





 /* The Modal (background) */
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
    height: 310px;                        
}
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

/* li {margin-top: 10px} */


.hashTag {display:inline-block;padding:5px 15px;font-size:15px;color:#fff;background:#999;border-radius:3px;margin-right:10px;}












</style>


<!-- allList -->

<div id="allList" data-tab-content="" class="active">
	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 15%">
				<col style="width: 35%">
				<col style="width: 20%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>이력서</th>
					<th>지원날짜</th>
					<th>열람여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cApplyList }">
					<tr>
						<td colspan="5">지원자가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach items="${cApplyList }" var="dto" varStatus="vs">
					<tr>
						<td>
							<!-- <a href="#none" style="text-align: center"> 
							</a> -->
							${vs.count }
						</td>
						<%-- <td><span class="apSubMenu" style="text-align: center" onclick="apProfileOpen(${dto.memSeq})"> ${dto.memName } </span></td> --%>
						<td>
							<div class="capply-menu" onclick="a_Profile(${dto.memSeq })">
								<img class="apProfile" src="filedownload.do?filename=${dto.profilename }&filepath=/upload/amember/"  alt="프로필사진">
								<!-- <div class="resume-menuBtn"> -->
									<%-- <span class="apSubMenu" style="text-align: center" onclick="apProfileOpen(${dto.memSeq})"> ${dto.memName } </span> --%>
									<span class="apSubMenu" style="display: block;"> ${dto.memName } </span>
								<!-- </div> -->
								<%-- <ul>
									<li><a href="#none" onclick="profileDetail('${dto.profilename }')">프로필 확인</a></li>
									<li><a href="cApplyProfile.do?aProfileSeq=${dto.memSeq }">프로필 확인</a></li>
									<li><a href="#none" onclick="cApplySendMeg(${dto.memSeq }, '${dto.memName }')">메시지 전송</a></li>
								</ul> --%>
							</div>
						</td>
						
						<td><span style="text-align: center; cursor: pointer" onclick="apResumeOpen(${dto.cvSeq})"> ${dto.cvName } </span></td>
						
						<c:set var="aDate" value="${dto.aDate }"/>
						<td>${fn:substring(aDate,0,16) }</td>
						<c:if test="${dto.open == 0 }"><td>미열람</td></c:if>
						<c:if test="${dto.open == 1 }"><td>열람</td></c:if>		
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
<!-- // allList -->
	




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
/* 페이지 이동 */
 
//var seq = '${sessionScope.logincompany.seq}';
function goPage(pn){	

	 location.href="cApplyMain.do?&pageNumber=" + pn;
	
}

function cApply_list() {
	location.href="cApplyList.do"
}


/* 이력서 열람 파일 유무 검증 */
function apResumeOpen(cvSeq) {
	//alert("cvSeq : " + cvSeq);
	$.ajax({
		url		 : "apResumeOpen.do",
		type	 : "POST",
		dataType : "json",
		data	 : {"cvSeq" : cvSeq},
		success	 : function(data) {
			var fileDto = data.fileDto
			if(fileDto == null) {
				//alert("새창 웹페이지");
				//alert("첨부파일 없음 , 웹페이지 연결");
				//window.open("openResumeDetail.do?seq="+cvSeq);
				location.href = "openResumeDetail.do?seq="+cvSeq;
			} else {
				//alert("첨부파일 있음 , 파일 다운로드");
				//alert(fileDto.filePath);
				location.href = "resumeDownLoad.do?filename="+fileDto.storedName;
			}
		},
		error	 : function(request,status,error){ 
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		}
	})
		
}

function apProfileOpen(memSeq) {
	alert("구직자 프로필 연결 구직자 seq : " + memSeq);
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





function profileDetail(imgName) {
	alert(imgName);
	modal.style.display = "block";
	$(".imgName").attr("src", "filedownload.do?filename="+imgName+"&filepath=/upload/amember/")
}








</script>


<!-- subCont 끝 -->

<!-- 메세지 보내기 모달 -->
<%@include file="../../../include/cApplyWriteMsg.jsp" %>
<%@include file="/include/footer.jsp"%>

