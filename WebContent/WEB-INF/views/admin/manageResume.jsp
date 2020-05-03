<%@page import="model.StatisticsParam"%>
<%@page import="model.AdminParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/adminHeader.jsp" %>
<%
	List<AdminParam> resumes = (List<AdminParam>) request.getAttribute("getAllResume");
	List<AdminParam> resumes2 = (List<AdminParam>) request.getAttribute("getAllResume2");
	List<StatisticsParam> resumeStatistics = (List<StatisticsParam>) request.getAttribute("resumeStatistics");

%>
<div class="profile-wrap">
<div class="chart-wrap">
            <div class="chart"> 
              <span>지원분야 통계</span>
              <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
            </div>
            <div class="chart">
              <span>누적 제출현황</span>
              <div class="chart-text">${totalResumeNumber }</div>
            </div>
        </div>
        <div class="question-title">작성 이력서관리
        	<div style="font-size: 15px;">* 삭제된 이력서목록은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
        </div>
        <div id="example">
          <div id="grid"></div>
          <div class="btn-wrapper">
	 		<button id="check">전체체크</button>
	 		<button onclick="deleteQuestion('checkbox')">삭제</button>
	 	</div>
        </div>
        <div class="question-title">제출 이력서</div>
        <div id="example2">
          <div id="grid2"></div>
          <div class="btn-wrapper">
	 		<button id="check2">전체체크</button>
	 		<button onclick="deleteQuestion('checkbox2')">삭제</button>
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
// 함수부
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
	var sendUrl = "";
	if( str == 'checkbox' ){
		sendUrl = "updateDelResume.do"
	}else{
		sendUrl = "updateDelResume2.do"
	}

	if(confirm(checkCount + '개의 데이터를 삭제합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:sendUrl ,
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

// 넣을 데이터
var resumes = [
	<%
	 for( AdminParam p : resumes ){
		 %>
			{ SEQ:<%=p.getSeq()%>,
                MEMSEQ:'<%=p.getMemSeq()%>',
                NAME:'<%=p.getResumeName()%>',
                USERNAME:'<%=p.getUsername()%>',
                STATUS:'<%=p.getStatus() > 0 ? "작성완료": "작성중"%>',
                MAINRESUME:'<%=p.getMainResume() > 0 ? "메인":"" %>',
                WDATE:'<%=p.getwDate()%>',
                DEL:'<%=p.getDel() > 0 ? "삭제됨":""%>'
			},
		 <%
	 }
	%>
]
//넣을 데이터
var resumes2 = [
	<%
	 for( AdminParam p : resumes2 ){
		 %>
			{ SEQ:<%=p.getSeq()%>,
                MEMSEQ:'<%=p.getMemSeq()%>',
               	COMNAME:'<%=p.getComName()%>',
                NAME:'<%=p.getResumeName()%>',
                USERNAME:'<%=p.getUsername()%>',
                STATUS:'<%=p.getStatus() > 0 ? "작성완료": "작성중"%>',
                WHOSE:'<%=p.getWhose() == 0 ? "일반지원":"기업제출" %>',
                WDATE:'<%=p.getwDate() %>',
                OPEN:'<%=p.getOpen() != 0 ? "열람":"미열람"%>',
                DEL:'<%=p.getDel() > 0 ? "삭제됨":""%>'
			},
		 <%
	 }
	%>
]


// kendo-grid
$(document).ready(function () {
    $("#grid").kendoGrid({
        dataSource: {
            data:resumes,
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
            field: "SEQ",
            title: "SEQ",
            width: 50
        },{
            template: "<div class='customer-name'>#: MEMSEQ #</div>",
            field: "MEMSEQ",
            title: "회원번호",
            width: 50
        }, {
            field: "NAME",
            title: "이력서명",
            width: 200
        }, {
            field: "USERNAME",
            title: "회원명",
        }, {
            field: "STATUS",
            title: "상태",
        }, {
            field: "MAINRESUME",
            title: "메인이력서",
        }, {
            field: "DEL",
            title: "삭제여부",
        }, {
            field: "WDATE",
            title: "등록일",
        }, {
            field: "checkall",
            title: "체크",
            template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
            width: 50
        }]
    });

 
    // 전체 문의내역
    $("#grid2").kendoGrid({
        dataSource: {
            data: resumes2,
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
            field: "SEQ",
            title: " ",
            width: 50
        },{
            template: "<div class='customer-name'>#: MEMSEQ #</div>",
            field: "MEMSEQ",
            title: "번호",
            width: 50
        }, {
            field: "COMNAME",
            title: "기업명",
        }, {
            field: "NAME",
            title: "이력서명",
            width: 150
        }, {
            field: "USERNAME",
            title: "회원명",
        }, {
            field: "STATUS",
            title: "상태",
        }, {
            field: "WHOSE",
            title: "제출상태",
        }, {
            field: "WDATE",
            title: "등록일",
        }, {
            field: "DEL",
            title: "삭제여부",
            width: 70
        }, {
            field: "OPEN",
            title: "열람",
        }, {
            field: "checkall",
            title: "체크",
            template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox2'></label>",
            width: 50
        }]
    });
    $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
});
</script>


<script>
// chart data  
var label1 = []
var datas = []
<%	for( StatisticsParam p : resumeStatistics ){
	%>
		label1.push('<%= p.getStatStr1()%>')
		datas.push(<%= p.getStatNum1()%>)
	<%
}
%>

var chart = new Chartist.Pie('.ct-chart', {
  series: datas,
  labels: label1
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
    if(data.index !== 0) {
      animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
    }
    data.element.attr({
      'stroke-dashoffset': -pathLength + 'px'
    });
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

</script>
<style>
.question-title{ font-size: 30px; margin: 20px 0; margin-top: 40px; padding-left: 5px;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}
</style>


<%@include file="./include/footer.jsp" %>
