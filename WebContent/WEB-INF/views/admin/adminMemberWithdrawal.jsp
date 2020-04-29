<%@page import="java.util.List"%>
<%@page import="model.AMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/adminHeader.jsp" %>
<%
	List<AMemberDto> memberList = (List<AMemberDto>) request.getAttribute("memberList");
%>
<div class="profile-wrap">
 <!-- 회원목록 -->
 	<div class="list-title">
 		탈퇴 목록
	 	<div style="font-size: 15px;">* 탈퇴 회원은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
 	</div>
	<div id="example">
	 	<div id="grid"></div>
	 	<div class="btn-wrapper">
	 		<button id="check1">전체체크</button>
	 		<button onclick="recoverBtn()">복원</button>
	 	</div>
	</div>
 	
</div>
<script>
var dataList = [];
<%
for( AMemberDto member : memberList ){
	String status = "";
	int num = member.getDel();
	switch( num ){
		case -1 :
			status = "이메일체크";
			break;
		case 0 :
			status = "승인";
			break;
		case 1 :
			status = "탈퇴";
			break;
	}
%>
member = { SEQ:'<%=member.getSeq()%>',
               	EMAIL:'<%=member.getEmail()%>',
               	NAME:'<%=member.getName()%>',
               	STATUS:'<%=status%>',
               	SIGNDATE:'<%=member.getSignDate()%>' }
dataList.push(member)					
<% } %> 
$(document).ready(function () {
     $("#grid").kendoGrid({
         dataSource: {
             data: dataList,
             pageSize: 10
         },
         height: 350,
         toolbar: ["search"],
         groupable: true,
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
             width: 70
         },{
             template: "<div class='customer-name'>#: EMAIL #</div>",
             field: "EMAIL",
             title: "계정",
             width: 400
         }, {
             field: "NAME",
             title: "이름",
             width: 150
         }, {
             field: "SIGNDATE",
             title: "탈퇴일자"
         }, {
             field: "checkall",
             title: "체크",
             template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
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

function recoverBtn(){
	var chboxes = document.querySelectorAll('input[name=checkbox]');
	var checkCount = 0;
	var seqList = [];
	for( i = 0; i < chboxes.length; i++ ){
		if( chboxes[i].checked == true ){
			checkCount++;
			seqList.push(chboxes[i].getAttribute('seq'))
		}
	}
	if(checkCount == 0){
		alert('복원할 데이터를 체크해주세요')
		return false;
	}
	console.log(seqList)
	if(confirm(checkCount + '개의 계정을 복원 합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'recoverMemberA.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data == true){
					alert('성공적으로 복원 되었습니다.')
					location.reload();
				}else{
					alert('복원 실패함')
				}
			}, error: function(err){
				alert('error!')
			}
		})
	}
}


</script>

<style>
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}
.list-title{ font-size: 25px; margin: 20px 0;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }

</style>

<%@include file="./include/footer.jsp" %>
