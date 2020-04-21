<%@page import="model.PremierServiceDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="model.PremierMemDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>

<div class="profile-wrap">
  <div class="chart-wrap">
      <div class="chart"> 
        <span>이용비율</span>
        <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
      </div>
      <div class="chart">
        <span>결제건수</span>
        <div class="chart-text">0</div>
      </div>
      <div class="chart">
        <span>환불건수</span>
        <div class="chart-text">0</div>
      </div>
  </div>
  <!-- 유료서비스 이용 고객 -->
  <div class="service-title">유료회원 목록</div>
   <div id="example">
    	<div id="grid"></div>
    	<div class="btn-wrapper">
	 		<button id="check">전체체크</button>
	 		<button>이용취소</button>
	 	</div>
	</div>
	<div class="service-title">유료서비스 목록</div>
	<div id="example2">
    	<div id="grid2"></div>
    	<div class="btn-wrapper">
	 		<button id="check2">전체체크</button>
	 		<button>삭제하기</button>
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
	%>	var data = {
			TYPE:'<%= Integer.parseInt( member.getEndDate().replaceAll("-", "")) > today ? "이용중":"종료" %>',
			USERNAME:'<%=member.getName()%>',
			SERVICENAME:'<%=member.getServiceName()%>', 
			STARTDATE:'<%=member.getStartDate()%>', 
			ENDDATE:'<%=member.getEndDate()%>'
		}
		dataList.push(data)
	<%
	}
	// 유료서비스 
	List<PremierServiceDto> serviceList = (List<PremierServiceDto>)request.getAttribute("serviceList");
	for(int i = 0; i < serviceList.size(); i++ ){
		PremierServiceDto service = serviceList.get(i);
	%>	var data = {
			SERVICESEQ: <%=service.getServiceSeq()%>,
			SERVICENAME:'<%=service.getServiceName()%>',
			PRICE:'<%=service.getPrice()%>'
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
             width: 300
         }, {
             field: "SERVICENAME",
             title: "서비스명",
             width: 200
         }, {
             field: "STARTDATE",
             title: "시작일",
             width: 150
         }, {
             field: "ENDDATE",
             title: "마감일",
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
         sortable: true,
         pageable: {
             refresh: true,
             pageSizes: true,
             buttonCount: 5
         },
         columns: [
         {
             field: "SERVICESEQ",
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
             width: 250
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
             field: "checkall",
             title: "체크",
             template: "<input type='checkbox' style='text-align:center' name='checkbox2'>",
             width: 50
         }]
     });
   	$('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
 });



/*  chart with animation */
var chart = new Chartist.Pie('.ct-chart', {
  series: [30,50],
  labels: ['basic','ecnomic']
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
</script>
<style>
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.service-title{ font-size: 30px; margin: 15px 0; }
.goBtn{ width: 80px; background: #333; color: #fff; text-align: center;  cursor:pointer}
.updateBtn{ width: 80px; background: #bbb; color: #fff; text-align: center; cursor:pointer}
</style>


<%@include file="../include/footer.jsp" %>
