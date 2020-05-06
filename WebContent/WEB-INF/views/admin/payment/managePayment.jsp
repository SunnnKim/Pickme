<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="model.PaymentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>

<% 
	List<PaymentDto> paymentList = (List<PaymentDto>)request.getAttribute("paymentList");
	List<PaymentDto> refundList = (List<PaymentDto>)request.getAttribute("refundList");
	//오늘 기준
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat format1 = new SimpleDateFormat( "yyyyMMdd");
	int today = Integer.parseInt(format1.format(cal.getTime()));
%>

<div class="profile-wrap">
<!-- 	
	<div class="chart-wrap">
	     <div class="chart"> 
	       <span>결제 통계/</span>
	       <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
	     </div>
	     <div class="chart">
	       <span>지원현황</span>
	       <div class="chart-text">50</div>
	     </div>
	</div>
	 -->
	   <div class="question-title">결제내역모두보기
      </div>
      <div id="example2">
        <div id="grid2"></div>
	</div>
      </div>
	<div class="question-title">환불처리완료
       <div style="font-size: 15px;">* 환불내역은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
	</div>
	<div id="example">
  	<div id="grid"></div>
    	<div class="btn-wrapper">
		<button id="check">전체체크</button>
		<button onclick="deleteQuestion('checkbox')">삭제</button>
	</div>
      </div>
    
</div>

<script>
//체크박스 모두 선택 
$('#check').click(function(){
	var chklist = document.querySelectorAll('input[name=checkbox]');
	if( $('#check').text() == '전체체크'){
	    for(i in chklist){
	      chklist[i].checked = true;
	    }
	    $('#check').text('전체해제') 
	}else{
	  for(i in chklist){
	    chklist[i].checked = false;
	  } 
	  $('#check').text('전체체크') 
	}
}) 

// 삭제하기 버튼 
function deleteQuestion( str ){
	var chboxes = document.querySelectorAll('input[name=' + str + ']');
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

		console.log(seqList)
	if(confirm(checkCount + '개의 데이터를 삭제합니다.' )){
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'deleteRefund.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data === true ){
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
}

// kendo-grid data
// 모든 결제내역 불러오기 
var allList = [
<%
	for( PaymentDto p : paymentList ){
		String date = p.getEndDate().split(" ")[0];
		String usingType = Integer.parseInt( date.replaceAll("-", "")) > today ? "이용중":"종료";
	%>
	{SEQ:'<%=p.getSeq()%>',
	USERNAME:'<%=p.getBuyerName()%>',
    NAME:'<%=p.getServiceName()%>',
    STATUS:'<%=p.getRefund() == 1 ? "환불처리" : usingType %>',
    IMPUID:'<%=p.getImpUid()%>',
    PRICE:'<%=p.getTotalPay()%>',
    METHOD:'<%=p.getMethod()%>',
    WDATE:'<%=p.getPayDate()%>'},
	<%
	}
%>
];

// 모든 환불내역 불러오기 
 var refundList = [
<%
	for( PaymentDto p : refundList ){
	%>
	{SEQ:'<%=p.getSeq()%>',
	USERNAME:'<%=p.getBuyerName()%>',
    NAME:'<%=p.getServiceName()%>',
    IMPUID:'<%=p.getImpUid()%>',
    PRICE:'<%=p.getTotalPay()%>',
    WDATE:'<%=p.getPayDate()%>',
    REFUNDDATE:'<%=p.getPayDate()%>',
    REASON:'<%=p.getRefundInfo()%>'}
	<%
	}
%>
];
 

// kendo-grid
$(document).ready(function () {
    $("#grid").kendoGrid({
        dataSource: {
            data: refundList,
            pageSize: 5
        },
        height: 350,
        toolbar:['search'],
        groupable: true,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true,
            buttonCount: 5
        },
        columns: [
        {
            field: "NAME",
            title: "NAME",
			width: 100
        }, {
            field: "USERNAME",
            title: "USERNAME",
        }, {
            field: "PRICE",
            title: "PRICE",
			width: 100
        }, {
            field: "IMPUID",
            title: "IMPUID",
        }, {
            field: "WDATE",
            title: "WDATE",
        }, {
       	     field: "REFUNDDATE",
             title: "REFUNDDATE",
         }, {
            field: "REASON",
            title: "REASON",
            width: 120
         }, {
            field: "checkall",
            title: "체크",
            template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
            width: 50
        }]
    });


    // 전체 결제 내역
    $("#grid2").kendoGrid({
        dataSource: {
            data: allList,
            pageSize: 5
        },
        height: 350,
        toolbar:['search'],
        groupable: true,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true,
            buttonCount: 5
        },
        columns: [
        {
            field: "NAME",
            title: "NAME",
        }, {
            field: "USERNAME",
            title: "USERNAME",
        }, {
            field: "STATUS",
            title: "STATUS",
            width: 100
        }, {
            field: "IMPUID",
            title: "IMPUID",
        }, {
            field: "PRICE",
            title: "PRICE",
        }, {
            field: "METHOD",
            title: "METHOD",
           	width:100
        }, {
            field: "WDATE",
            title: "WDATE",
        }]
    });
    $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
});
</script>


<style>
.answer-btn {width: 80px; text-align: center; background: #304edf; color:#fff; cursor: pointer;}
.question-title{ font-size: 30px; margin: 20px 0; margin-top: 40px; padding-left: 5px;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}
</style>


<%@include file="../include/footer.jsp" %>
