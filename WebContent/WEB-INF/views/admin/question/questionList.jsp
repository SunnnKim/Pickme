<%@page import="model.QuestionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/adminHeader.jsp" %>
<%
	List<QuestionDto> allList = (List<QuestionDto>) request.getAttribute("allList");
	List<QuestionDto> notAnswerList = (List<QuestionDto>) request.getAttribute("notAnswerList");
	List<QuestionDto> typeStatistic = (List<QuestionDto>) request.getAttribute("typeStatistic");  
%>
<div class="profile-wrap">
	<div class="chart-wrap">
	   <div class="chart"> 
	     <span>문의 비율</span>
	     <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
	    </div>
	    <div class="chart">
	      <span>미답변 문의내역</span>
	      <div class="chart-text"><%=notAnswerList.size() %></div>
	    </div>
	</div>
	<div class="question-title">미답변 문의내역
	</div>
	<div id="example">
	  <div id="grid"></div>
	  <div class="btn-wrapper">
	 		<button id="check">전체체크</button>
	 		<button onclick="deleteQuestion('checkbox')">삭제</button>
	 		<button onclick="passQuestion('checkbox')">응답처리</button>
	 	</div>
	</div>
	<div class="question-title">전체 문의내역
		<div style="font-size: 15px;">* 삭제된 문의내역은 매주 월요일마다 데이터베이스에서 삭제됩니다.</div>
	</div>
	<div id="example2">
	  <div id="grid2"></div>
	  <div class="btn-wrapper">
	 		<button id="check2">전체체크</button>
	 		<button onclick="deleteQuestion('checkbox2')">삭제하기</button>
	 	</div>
	</div>
</div>
<script>
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

	if(confirm(checkCount + '개의 데이터를 삭제합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'deleteQuestion.do',
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

// 응답처리 버튼 
function passQuestion( str ){
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
		alert('응답처리 할 데이터를 체크해주세요')
		return false;
	}

	if(confirm(checkCount + '개의 데이터를 완료 처리합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'passQuestion.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data === true ){
					alert('성공적으로 처리되었습니다.')
					location.reload();
				}else{
					alert('처리 실패함')
				}
			}, error: function(err){
				alert('error!')
			}
		})
	}
}

//답변하기 클릭
function answer(seq){
	location.href="/Pickme/admin/question/answerQuestion.do?seq="+seq;
}
</script>


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
//체크박스 모두 선택 
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
// 데이터 초기화 
// 미응답 데이터 
var notAnswerList = [];
<%
	for(int i = 0; i < notAnswerList.size(); i++ ){
		QuestionDto dto = notAnswerList.get(i);
	%>
		var temp = { 
			"NUM": <%=i+1%>, 
			"SEQ": <%=dto.getSeq()%>, 
			"TITLE":`<%=dto.getTitle()%>`, 
			"TYPE":`<%=dto.getType()%>`, 
			"EMAIL":`<%=dto.getEmail()%>`, 
			"WDATE":`<%=dto.getwDate()%>`,
			"REPLY":`<%=dto.getSeq()%>`
		}
		notAnswerList.push(temp)
	<%
	}
%>
// 전체 데이터
var allList = [];
<%
	for(int i = 0; i < allList.size(); i++ ){
		QuestionDto dto = allList.get(i);
		String status = "";
		if( dto.getReply() == null && dto.getDel() == 0 ) status = "미응답";
		else{
			if( dto.getDel() == 0 ) status = "완료됨";
			else if( dto.getDel() == 1 ) status = "삭제";
		}
	%>
		var temp = { 
			"NUM": <%=i+1%>, 
			"SEQ": <%=dto.getSeq()%>, 
			"TITLE":`<%=dto.getTitle()%>`, 
			"TYPE":`<%=dto.getType()%>`, 
			"EMAIL":`<%=dto.getEmail()%>`,
			"WDATE":`<%=dto.getwDate()%>`,
			"REPLY":`<%=status%>`
		}
		allList.push(temp)
	<%
	}
%>



// kendo-grid
$(document).ready(function () {
	// 미응답 리스트
    $("#grid").kendoGrid({
        dataSource: {
            data: notAnswerList,
            pageSize: 10
        },
        height: 350,
        groupable: true,
        sortable: true,
        toolbar: ["search"],
        pageable: {
            refresh: true,
            pageSizes: true,
            buttonCount: 5
        },
        columns: [
        {
            field: "NUM",
            title: "no.",
            width: 50
        },{
        	template: "<div class='customer-name' style='overflow:hidden; height:30px; white-space:nowrap;text-overflow:ellipsis;'>#: TITLE #</div>",
            field: "TITLE",
            title: "제목",
            width: 250
        }, {
            field: "TYPE",
            title: "글분류",
            width: 120
        }, {
            field: "WDATE",
            title: "등록일",
            width: 80
        }, {
            field: "EMAIL",
            title: "이메일",
            template: "<div style='overflow:hidden; height:30px; white-space:nowrap;text-overflow:ellipsis;'>#: EMAIL# </div>",
            width: 150
        }, {
            field: "REPLY",
            title: "",
            template: "<div class='answer-btn' onclick='answer( #: REPLY# )'>답변하기</div>",
            width: 80
        }, {
            field: "SEQ",
            title: "체크",
            template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
            width: 50
        }]
    });


    // 전체 문의내역
    $("#grid2").kendoGrid({
        dataSource: {
            data: allList,
            pageSize: 5
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
            field: "NUM",
            title: "no.",
            width: 50
        },{
            template: "<div class='customer-name' style='overflow:hidden; height:30px; white-space:nowrap;text-overflow:ellipsis;'>#: TITLE #</div>",
            field: "TITLE",
            title: "제목",
            width: 300
        }, {
            field: "TYPE",
            title: "글분류",
            width: 100
        }, {
        	 field: "EMAIL",
             title: "이메일",
             template: "<div style='overflow:hidden; height:30px; white-space:nowrap;text-overflow:ellipsis;'>#: EMAIL# </div>",
             width: 150
         }, {
            field: "WDATE",
            title: "등록일",
            width: 80
        }, {
            field: "REPLY",
            title: "답변여부",
            width: 50
        }, {
            field: "SEQ",
            title: "체크",
            template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #' style='text-align:center' name='checkbox2'></label>",
            width: 50
        }]
    });
    $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
});
</script>

<script>
// 차트용 데이터
var chartLabels = [];
var chartData = [];
<%
	for(int i=0; i < typeStatistic.size(); i ++){
		QuestionDto dto = typeStatistic.get(i);
		%>
		chartLabels.push(`<%=dto.getStatStr()%>`)
		chartData.push(`<%=dto.getStatNum()%>`)
		<%
	}
%>

// chart with animation
var chart = new Chartist.Pie('.ct-chart', {
  'series': chartData,
  'labels': chartLabels
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
.answer-btn {width: 80px; text-align: center; background: #304edf; color:#fff; cursor: pointer;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}
</style>


<%@include file="../include/footer.jsp" %>
