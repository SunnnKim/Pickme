<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/adminHeader.jsp" %>

<div class="profile-wrap">
 <!-- 회원목록 -->
 	<div class="list-title">탈퇴 대기 목록</div>
	<div id="example">
	 	<div id="grid"></div>
	 	<div class="btn-wrapper">
	 		<button id="check1">전체체크</button>
	 		<button>승인</button>
	 	</div>
	</div>
 	
	<div class="list-title">탈퇴한 기업</div>
	<div id="example">
	 	<div id="grid2"></div>
	 	<div class="btn-wrapper">
	 		<button id="check2">전체체크</button>
	 		<button>데이터 삭제</button>
	 	</div>
	</div>

</div>
<script>
var dataList = [];

$(document).ready(function () {
     $("#grid").kendoGrid({
         dataSource: {
             data: [{
				SEQ:'s',
				EMAIL:'s',
				NAME:'s',
				SIGNDATE:''
                }],
             pageSize: 10
         },
         height: 350,
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
             title: "가입일자"
         }, {
             field: "checkall",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' name='checkbox1'>",
             width: 50
         }]
     });
     

     $("#grid2").kendoGrid({
         dataSource: {
             data: [{
            	 SEQ:'',
 				EMAIL:'',
 				NAME:'',
 				SIGNDATE:''
                 }],
             pageSize: 10
         },
         height: 350,
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
             title: "가입일자"
         }, {
             field: "checkall",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' name='checkbox2'>",
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
$('#check2').click(function(){
	var chklist = document.querySelectorAll('input[name=checkbox2]');
	if( $('#check2').text() == '전체체크'){
	    for(i in chklist){
	      chklist[i].checked = true;
	    }
	    $('#check2').text('전체해제') 
	}else{
	  for(i in chklist){
	    chklist[i].checked = false;
	  } 
	  $('#check2').text('전체체크') 
	}
}) 

</script>

<style>
.list-title{ font-size: 25px; margin: 20px 0;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }

</style>

<%@include file="./include/footer.jsp" %>
