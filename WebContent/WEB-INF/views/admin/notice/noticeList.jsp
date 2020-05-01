<%@page import="model.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<%
	List<NoticeDto> list = (List<NoticeDto>) request.getAttribute("list");
%>
<div class="profile-wrap">


<div id="example">
<div style="font-size: 15px;">* 삭제처리된 공지사항은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
    	<div id="grid"></div>
    	<div class="btn-wrapper">
	 		<button id="check1">전체체크</button>
	 		<button onclick="deleteBtn()">글삭제</button>
	 	</div>
	</div>
</div>

<script>
$(document).ready(function () {
	// 불러온 공지사항 데이터를 배열에 담기
	var noticeList = [];
	<%
	for(int i = 0; i < list.size(); i++ ){
		NoticeDto dto = list.get(i);
		%>
		var noticeArr = {
			SEQ:<%=dto.getSeq()%>,
			TITLE:'<%=dto.getTitle()%>',
			TYPE:'<%=dto.getType()%>',
			WDATE:'<%=dto.getWdate()%>',
			SEQ:'<%=dto.getSeq()%>'
		}
		noticeList.push(noticeArr);
		<%
	}%>
	 
     $("#grid").kendoGrid({
         dataSource: {
             data: noticeList,
             pageSize: 10
         },
         height: 350,
         groupable: true,
         toolbar: ["search"],
         sortable: true,
         pageable: {
             refresh: true,
             pageSizes: true,
             buttonCount: 5
         },
         columns: [
         {
             field: "SEQ",
             title: "번호",
             width: 60
         },{
             template: "<div class='customer-name'>#: TITLE #</div>",
             field: "TITLE",
             title: "제목",
             width: 400
         }, {
             field: "TYPE",
             title: "글종류",
             width: 90
         }, {
             field: "WDATE",
             title: "등록일",
             width: 100
         }, {
             field: "BTN",
             title: "보기",
             template: "<div class='goBtn' onclick='goBtn(this)'>글보기</div>",
             width: 70
         }, { 
             field: "UPDATE",
             title: "글수정",
             template: "<div class='updateBtn' onclick='updateBtn(this)'>수정</div>",
             width: 70
         }, { 
             field: "SEQ",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' seq='#: SEQ #' name='checkbox1'>",
             width: 50
         }]
     });
	$('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
     });

$('#check1').click(function(){
	var chklist = document.querySelectorAll('input[name=checkbox1]');
	if( $('#check1').text() == '전체체크'){
	    for(i in chklist){
	      chklist[i].checked = true;
	    }
	    $('#check1').text('전체해제') 
	}else{
	  for(i in chklist){
	    chklist[i].checked = false;
	  } 
	  $('#check1').text('전체체크') 
	}
})  
function goBtn( btn ){
	var seqNum = btn.parentElement.parentElement.childNodes[0].innerHTML;
	location.href="/Pickme/customer/noticeDetail.do?seq="+seqNum;	// 공지사항 디테일로 가는 경로 입력 
}
function updateBtn( btn ){
	var seqNum = btn.parentElement.parentElement.childNodes[0].innerHTML;
	location.href="/Pickme/admin/notice/updateNoticeView.do?seq=" + seqNum;	// 공지사항 디테일로 가는 경로 입력 
}
// 삭제하기 버튼 
function deleteBtn(){
	var chboxes = document.querySelectorAll('input[name=checkbox1]');
	var checkCount = 0;
	var seqList = [];
	for( i = 0; i < chboxes.length; i++ ){
		if( chboxes[i].checked == true ){
			checkCount++;
			seqList.push(chboxes[i].getAttribute('seq'))
		}
	}
	if(checkCount == 0){
		alert('삭제할 데이터를 체크해주세요')
		return false;
	}

	if(confirm(checkCount + '개의 데이터를 삭제합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'deleteNoticeList.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data == 'true'){
					alert('성공적으로 삭제되었습니다.')
					location.reload();
				}else{
					alert('삭제 실패함')
				}
			}, error: function(err){
				alert('error!')
			}
		})

	}
//	checkCount[0]

}

</script>

<style>
.list-title{ font-size: 25px; margin: 20px 0;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.goBtn{ width: 50px; background: #333; color: #fff; text-align: center;  cursor:pointer}
.updateBtn{ width: 50px; background: #bbb; color: #fff; text-align: center; cursor:pointer}
</style>


<%@include file="../include/footer.jsp" %>
