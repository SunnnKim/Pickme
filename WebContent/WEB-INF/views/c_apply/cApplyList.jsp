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
	width: 80px;
	height: 80px;
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

li {margin-top: 10px}


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
						<td colspan="4">지원자가 없습니다</td>
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
							<div class="capply-menu">
								<img class="apProfile" src="filedownload.do?filename=${dto.profilename }&filepath=/upload/amember/"  alt="프로필사진">
								<!-- <div class="resume-menuBtn"> -->
									<%-- <span class="apSubMenu" style="text-align: center" onclick="apProfileOpen(${dto.memSeq})"> ${dto.memName } </span> --%>
									<span class="apSubMenu" style="display: block;"> ${dto.memName } </span>
								<!-- </div> -->
								<ul>
									<li><a href="#none" onclick="profileDetail('${dto.profilename }')">프로필 확인</a></li>
									<%-- <li><a href="cApplyProfile.do?aProfileSeq=${dto.memSeq }">프로필 확인</a></li> --%>
									<li><a href="#none" onclick="cApplySendMeg(${dto.memSeq }, '${dto.memName }')">메시지 전송</a></li>
								</ul>
							</div>
						</td>
						
						<td><span style="text-align: center" onclick="apResumeOpen(${dto.cvSeq})"> ${dto.cvName } </span></td>
						
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




<!-- Trigger/Open The Modal -->
    <button id="myBtn">Open Modal</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
	        <span class="close">&times;</span>
      	<!-- 
      	<div>
	        <h3 style="margin-left: 25px; margin-bottom: 10px; float: left">ㅇㅇㅇ 님의 프로필</h3>
	      	<div class="btn-message clfix" style="float: left">
				<button type="button" onclick="" >메시지 보내기</button>
			</div> 
        </div>
         -->
        
                                                                       
      	<div style="display: inline-flex;border-bottom: 1px solid #ddd;border-top: 1px solid #ddd;width: 498px;height: 223px;">
        	<div style="width: 180px;/* background-color: chartreuse; */">
	        	<div style="float: left;width: 100%;text-align: center;">
	        		<img class="apProfileDetail" src="filedownload.do?filename=1.jpg&filepath=/upload/amember/"  alt="프로필사진">
	        		<span style="margin-top: 12px;display:inline-block;font-size: 20px;">김이박최 &nbsp;<i class="far fa-envelope" style="font-size: 20px"></i></span>
	        	</div>
        	</div>
        	<div style="width: 348px;height: 200px;/* background-color: aqua; */padding-left: 10px;padding-right: 10px;">
	        	<div style="float: right;width: 100%;">
	        		<ul>
	        			<li>신입</li>
	        			<li>리테일/고객서비스 [CS 어드바이저]</li>
	        			<li><textarea rows="3px" cols="35px" readonly="readonly" style="resize: none; border: none">안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요</textarea> </li>
	        			<li><span class="hashTag"> #JAVA </span></li>
	        		</ul>
	        	</div>
        	</div>
		</div>
		<!-- <div style="text-align: center; margin-top: 20px">
			<button type="button">메시지 보내기</button>
		</div>  
		 -->
		     
        
      </div>
      
 
    </div>








<!-- 
<dialog id="cvRequest">
    <div class="dialog__inner">
        <button class="button button-close close">
          <i class="fas fa-times"></i>
        </button>
        <div class="title">
          Request
        </div>
        <div class="request-modal">
          <form action="" method="post" id="frm">
            <div>
              요청기업
              <span id="sender">비트캠프</span>
              <input type="hidden" name="pseq">
            </div>
            <div>
              받는사람
              <span id="receiver">김선주</span>
            </div>
            <div class="text-area">
              <textarea name="comment" placeholder="코멘트를 남겨주세요."></textarea>
            </div>
          </form>
        </div>
        <div class="send-request">
          <button id="sendRequset">열람요청 보내기</button>
        </div>

    </div>
</dialog>


 -->




<!-- 메세지 보내기 모달 -->
<%@include file="../../../include/cApplyWriteMsg.jsp" %>

<script>
/* 페이지 이동 */
 
//var seq = '${sessionScope.logincompany.seq}';
function goPage(pn){	

	 location.href="cApplyMain.do?&pageNumber=" + pn;
	
}

function cApply_list() {
	location.href="cApplyList.do"
}


/* 이력서 열람 */
function apResumeOpen(cvSeq) {
	alert("cvSeq : " + cvSeq);
	$.ajax({
		url		 : "apResumeOpen.do",
		type	 : "POST",
		dataType : "json",
		data	 : {"cvSeq" : cvSeq},
		success	 : function(data) {
			alert("success");
			alert(data.memEmail);
			if(data.filePath == null) {
				alert("웹페이지 디테일");
			} else {
				alert("파일다운");
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


function cApplySendMeg(memSeq, memName) {
	//alert("메시지 전송 MODAL 구직자 seq : " + memSeq);
	//alert("메시지 전송 MODAL 구직자 memName : " + memName);
	$(".messenger-wrap").show();
	$('body').css("overflow", "hidden");
	$("#toName").val("받는 이 : " + memName); 
	$("input[name=to]").val(memSeq); 
}



$(".capply-menu").click(function(){
   //$("capply-menu ul").not($(this).find('ul').fadeToggle('fast')).hide();
   modal.style.display = "block";
});








function profileDetail(imgName) {
	alert(imgName);
	modal.style.display = "block";
	$(".imgName").attr("src", "filedownload.do?filename="+imgName+"&filepath=/upload/amember/")
}















// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}










</script>


<!-- subCont 끝 -->


<%@include file="/include/footer.jsp"%>
