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
    	<div id="grid"></div>
    	<div class="btn-wrapper">
	 		<button id="check1">전체체크</button>
	 		<button>글삭제</button>
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
			WDATE:'<%=dto.getWdate()%>'
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
             width: 150
         }, {
             field: "WDATE",
             title: "등록일"
         }, {
             field: "BTN",
             title: "글보기",
             template: "<div class='goBtn' ondblclick='goBtn(this)'>더블클릭해서 글보기</div>",
         }, { 
             field: "checkall",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' name='checkbox1'>",
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
	
//	location.href="/Pickme/notice/noticeDetail.do?seq="+seqNum;	// 공지사항 디테일로 가는 경로 입력 
	
}

</script>

<style>
.list-title{ font-size: 25px; margin: 20px 0;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }

</style>


<%@include file="../include/footer.jsp" %>
