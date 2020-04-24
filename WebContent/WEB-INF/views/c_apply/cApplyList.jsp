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

.capply-menu ul {display:none;position:absolute;top:-40px;left:50px;width:100px;/* height:84px; */background:#fff;box-shadow:0 0 10px rgba(0,0,0,0.3);}
.capply-menu ul li {line-height:28px;font-size:13px;}
.capply-menu ul li a {display:block; width: 100%; height:100%; padding:0 15px; transition:all 0.1s ease-in-out;}
.capply-menu ul li:hover a {background:#4f6eff; color:#fff;}


.capply-menu {position:relative; padding:7px 0; cursor:pointer;}
/* .capply-menu .resume-menuBtn {text-align:center; transform:rotate(90deg);} */

</style>


<!-- allList -->

<div id="allList" data-tab-content="" class="active">
	<!-- 리스트 -->
	<div class="table-col table-bbs">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 35%">
				<col style="width: 20%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th>사진</th>
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
							<!-- <a href="#none" style="text-align: center"> --> 
								<img class="apProfile" src="filedownload.do?filename=${dto.profilename }&filepath=/upload/amember/"  alt="프로필사진">
							<!-- </a> -->
						</td>
						<%-- <td><span class="apSubMenu" style="text-align: center" onclick="apProfileOpen(${dto.memSeq})"> ${dto.memName } </span></td> --%>
						<td>
							<div class="capply-menu">
								<!-- <div class="resume-menuBtn"> -->
									<%-- <span class="apSubMenu" style="text-align: center" onclick="apProfileOpen(${dto.memSeq})"> ${dto.memName } </span> --%>
									<span class="apSubMenu" style="text-align: center" > ${dto.memName } </span>
								<!-- </div> -->
								<ul style=>
									<li><a href="#none">프로필 확인</a></li>
									<%-- <li><a href="cApplyProfile.do?aProfileSeq=${dto.memSeq }">프로필 확인</a></li> --%>
									<li><a href="#none" onclick="cApplySendMeg(${dto.memSeq })">메시지 전송</a></li>
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


<!-- // allList -->


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


function cApplySendMeg(memSeq) {
	alert("메시지 전송 MODAL 구직자 seq : " + memSeq);
}



$(".capply-menu").click(function(){
   $("capply-menu ul").not($(this).find('ul').fadeToggle('fast')).hide();
});

</script>


<!-- subCont 끝 -->


<%@include file="/include/footer.jsp"%>
