<%@page import="model.PaymentParam"%>
<%@page import="model.PremierServiceDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="model.PremierMemDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<%
	int newPremierMember = (int) request.getAttribute("newPremierMember");
	int refundMember = (int) request.getAttribute("refundMember");
%>
<div class="profile-wrap">
  <div class="chart-wrap">
      <div class="chart"> 
        <span>이용비율</span>
        <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
      </div>
      <div class="chart">
        <span>신규결제건수</span>
        <div class="chart-text"><%=newPremierMember %></div>
      </div>
      <div class="chart">
        <span>신규환불건수</span>
        <div class="chart-text"><%=refundMember %></div>
      </div>
  </div>
  <!-- 유료서비스 이용 고객 -->
  <div class="service-title">유료회원 목록
	  <div style="font-size: 15px;">* 삭제된 유료회원 목록은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
  </div>
  
   <div id="example">
    	<div id="grid"></div>
    	<div class="btn-wrapper">
	 		<button id="check">전체체크</button>
	 		<button>이용취소</button>
	 	</div>
	</div>
	<div class="service-title">유료서비스 목록
	  <div style="font-size: 15px;">* 삭제된 유료서비스 목록은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
	</div>
	<div id="example2">
    	<div id="grid2"></div>
    	<div class="btn-wrapper">
	 		<button id="check2">전체체크</button>
	 		<button onclick="deleteBtn2()">삭제하기</button>
	 	</div>
	</div>
</div>
<script>
var dataList = [];
var dataList2 = [];
<%
	// 오늘 기준
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat format1 = new SimpleDateFormat( "yyyyMMdd");
	int today = Integer.parseInt(format1.format(cal.getTime()));
	
	// 유료회원
	List<PremierMemDto> memberList = (List<PremierMemDto>)request.getAttribute("memberList");
	for(int i = 0; i < memberList.size(); i++ ){
		PremierMemDto member = memberList.get(i);
		String usingType = Integer.parseInt( member.getEndDate().replaceAll("-", "")) > today ? "이용중":"종료";
		
	%>	var data = {
			TYPE:'<%= member.getDel() == 0 ? usingType:"환불처리" %>',
			USERNAME:'<%=member.getName()%>',
			USERNAME:'<%=member.getName()%>',
			IMPUID:'<%=member.getImpUid()%>',
			SERVICENAME:'<%=member.getServiceName()%>', 
			STARTDATE:'<%=member.getStartDate()%>', 
			ENDDATE:'<%=member.getDel() == 0 ? member.getEndDate() : "" %>'
		}
		dataList.push(data)
	<%
	}
	// 유료서비스 
	List<PremierServiceDto> serviceList = (List<PremierServiceDto>)request.getAttribute("serviceList");
	for(int i = 0; i < serviceList.size(); i++ ){
		PremierServiceDto service = serviceList.get(i);
	%>	var data = {
			SEQ:<%= service.getServiceSeq()%>,
			SERVICENAME:'<%=service.getServiceName()%>',
			PRICE:'<%=service.getPrice()%>',
			PERIOD:'<%=service.getPeriod()%>'
		}
		dataList2.push(data)
	<%
	}
%>

$(document).ready(function () {
     $("#grid").kendoGrid({
         dataSource: {
             data: dataList,
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
             field: "TYPE",
             title: "분류",
             width: 70
         },{
             template: "<div class='customer-name'>#: USERNAME #</div>",
             field: "USERNAME",
             title: "기업명",
             width: 250
         }, {
             field: "SERVICENAME",
             title: "서비스명",
             width: 200
         }, {
             field: "STARTDATE",
             title: "시작일",
             width: 100
         }, {
             field: "ENDDATE",
             title: "마감일",
             width: 100
         }, {
             field: "IMPUID",
             title: "주문번호",
             width: 150
         }, {
             field: "checkall",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' name='checkbox'>",
             width: 50
         }]
     });
  

	// 유료서비스 목록     
     $("#grid2").kendoGrid({
         dataSource: {
             data: dataList2,
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
             width: 70
         },{
             template: "<div class='customer-name'>#: SERVICENAME #</div>",
             field: "SERVICENAME",
             title: "서비스명",
             width: 400
         }, {
             field: "PRICE",
             title: "가격",
             width: 130
         }, {
             field: "PERIOD",
             title: "이용기간",
             width: 100
         }, {
             field: "DETAIL",
             title: "자세히보기",
             template: "<div class='goBtn' onclick='goBtn(this)'>보기</div>",
             width: 100
         }, {
             field: "UPDATE",
             title: "수정",
             template: "<div class='updateBtn' onclick='updateBtn(this)'>수정</div>",
             width: 100
         }, {
             field: "SEQ",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' seq='#: SEQ #' name='checkbox2'>",
             width: 50
         }]
     });
   	$('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
 });


// 파이 차트 통계데이터
var pieData = [];
var serviceName = [];
<%
List<PaymentParam> memberCount = (List<PaymentParam>) request.getAttribute("memberCount");
for(int i = 0; i < memberCount.size(); i++ ){
	PaymentParam data = memberCount.get(i);
	%>
		pieData.push('<%=data.getMemberCount()%>')
		serviceName.push('<%=data.getServiceName()%>')
	<%	
}
%>

console.log(pieData)
console.log(serviceName)

/*  chart with animation */
var chart = new Chartist.Pie('.ct-chart', {
  series: pieData,
  labels: serviceName
}, {
  donut: true,
  showLabel: true
});

chart.on('draw', function(data) {
  if(data.type === 'slice') {
    // Get the total path length in order to use for dash array animation
    var pathLength = data.element._node.getTotalLength();

    // Set a dasharray that matches the path length as prerequisite to animate dashoffset
    data.element.attr({
      'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
    });

    // Create animation definition while also assigning an ID to the animation for later sync usage
    var animationDefinition = {
      'stroke-dashoffset': {
        id: 'anim' + data.index,
        dur: 1000,
        from: -pathLength + 'px',
        to:  '0px',
        easing: Chartist.Svg.Easing.easeOutQuint,
        // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
        fill: 'freeze'
      }
    };

    // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
    if(data.index !== 0) {
      animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
    }

    // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
    data.element.attr({
      'stroke-dashoffset': -pathLength + 'px'
    });

    // We can't use guided mode as the animations need to rely on setting begin manually
    // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
    data.element.animate(animationDefinition, false);
  }
});

// For the sake of the example we update the chart every time it's created with a delay of 8 seconds
chart.on('created', function() {
  if(window.__anim21278907124) {
    clearTimeout(window.__anim21278907124);
    window.__anim21278907124 = null;
  }
  window.__anim21278907124 = setTimeout(chart.update.bind(chart), 500000);
});

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

// 체크박스 모두 선택 2 
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
// 자세히보기 클릭
function goBtn( btn ){
	var seqNum = btn.parentElement.parentElement.childNodes[0].innerHTML;
	location.href="/Pickme/customer/paidServiceDetail.do?seq="+seqNum;	// 공지사항 디테일로 가는 경로 입력 
}
// 수정하기 클릭
function updateBtn( btn ){
	var seqNum = btn.parentElement.parentElement.childNodes[0].innerHTML;
	location.href="/Pickme/admin/payment/updatePaidService.do?seq=" + seqNum;	// 공지사항 디테일로 가는 경로 입력 
}
//삭제하기 버튼 
function deleteBtn2(){
	var chboxes = document.querySelectorAll('input[name=checkbox2]');
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
			url:'deleteService.do',
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
}
</script>
<style>
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.service-title{ font-size: 30px; margin: 15px 0; }
.goBtn{ width: 80px; background: #333; color: #fff; text-align: center;  cursor:pointer}
.updateBtn{ width: 80px; background: #bbb; color: #fff; text-align: center; cursor:pointer}
</style>


<%@include file="../include/footer.jsp" %>
