<%@page import="model.StatisticsParam"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="model.RecruitDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/adminHeader.jsp" %>
<%
	List<RecruitDto> getAllRecruit = (List<RecruitDto>)request.getAttribute("getAllRecruit");
	List<StatisticsParam> recruitStatistics = (List<StatisticsParam>)request.getAttribute("getRecruitStatistics");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
	String today = format1.format(cal.getTime());
	
%>
<div class="profile-wrap">
<div class="chart-wrap">
            <div class="chart"> 
              <span>채용공고 통계</span>
              <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
            </div>
            <div class="chart">
              <span>진행중인 채용</span>
              <div class="chart-text">${getRecruitNumber }</div>
            </div>
        </div>
        <div class="question-title">현재채용공고</div>
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
			url:'updateDelRecruit.do',
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
// data
var recruitData = [
<%
	for( RecruitDto r : getAllRecruit ){
	%>
		{ 	SEQ: <%=r.getSeq()%>,
            COMSEQ: <%=r.getComSeq()%>,
            COMNAME: '<%=r.getComName()%>',
            COMJOB1: '<%=r.getComJob1()%>',
            COMJOB2: '<%=r.getComJob2()%>',
            COMJOBTYPE:'<%=r.getComJobType()%>',
            JOBDATE: '<%=r.getDel() == 2 ? "마감":"진행중"%>',
            DEL: '<%=r.getDel() == 1 ? "삭제됨":""%>'
        },
	<%		
	}
%>
]


// kendo-grid
$(document).ready(function () {
	$("#grid").kendoGrid({
        dataSource: recruitData,
            schema: {
                model: {
                    fields: {
                        SEQ: { type: "number" },
                        COMSEQ: { type: "number" },
                        COMNAME: { type: "string" },
                        COMJOB1: { type: "string" },
                        COMJOB2: { type: "string" },
                        COMJOBTYPE: { type: "string" },
                        JOBDATE: { type: "string" },
                        DEL: { type: "string" }
                    }
            },
            pageSize: 30,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true
        },
        height: 550,
        toolbar: ["search"],
        sortable: true,
        filterable: true,
        columnMenu: true,
        pageable: true,
        columns: [ {
                field: "SEQ",
                title: " ",
                width: 50
            }, {
                field: "COMNAME",
                title: "회사명"
            }, {
                field: "COMJOB1",
                title: "직군",
                width: 150
            },  {
                field: "COMJOB2",
                title: "직무",
                width: 150
            },  {
                field: "COMJOBTYPE",
                title: " ",
                width: 70
            },  {
                field: "JOBDATE",
                title: "진행여부",
                width: 100
            },  {
                field: "DEL",
                title: "삭제",
                width: 100
            },{
                field: "SEQ",
                title: " ",
                template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
                width: 50
            }
        ]
    });

    $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
});
</script>


<script>

//차트 데이터 
var json = {};
<%	
	for( StatisticsParam p : recruitStatistics ){
	%>
		if(json.hasOwnProperty('<%=p.getStatStr1()%>')){
			json['<%=p.getStatStr1()%>'] += <%=p.getStatNum1()%>
			console.log( json)
		}else{
			json['<%=p.getStatStr1()%>'] = <%=p.getStatNum1()%>
		}
	<%
	}
%>
var recruitLabels = [];
var recruitValue = [];
for( var key in json){
	recruitLabels.push(key)
	recruitValue.push(json[key])
}

// chart with animation
var chart = new Chartist.Pie('.ct-chart', {
  series: recruitValue,
  labels: recruitLabels
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
