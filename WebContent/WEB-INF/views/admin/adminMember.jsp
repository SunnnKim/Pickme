<%@page import="model.AMemberDto"%>
<%@page import="java.util.List"%>
<%@include file="./include/adminHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// all member
	List<AMemberDto> list = (List<AMemberDto>) request.getAttribute("list");
	int newMember = (int)request.getAttribute("newMember");	// 새로가입 멤버
	int aMemberAll = (int) request.getAttribute("aMemberAll"); // 일반회원 전체 
	int cMemberAll = (int) request.getAttribute("cMemberAll"); // 기업회원 전체 

%>
<div class="profile-wrap">
  <div class="chart-wrap">
      <div class="chart"> 
        <span>가입분포</span>
        <div class="ct-chart ct-perfect-fourth" style="width: 300px;"></div>
      </div>
      <div class="chart">
        <span>신규 가입</span>
        <div class="chart-text"><%=newMember%></div>
      </div>
  </div>
  <!-- 회원목록 -->
   <div id="example">
    	<div id="grid"></div>
    	<div class="btn-wrapper">
	 		<button id="check">전체체크</button>
	 		<button onclick="updateDelMember()">탈퇴처리</button>
	 	</div>
	</div>
</div>
<script>
var dataList = [];
<%
for( AMemberDto member : list ){
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
             pageSize: 30
         },
         height: 550,
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
             title: "가입일자"
         }, {
             field: "STATUS",
             title: "가입상태"
         }, {
             field: "checkall",
             title: "체크",
             template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
             width: 50
         }]
     });
     $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
 });



/*  chart with animation */
var chart = new Chartist.Pie('.ct-chart', {
  series: [<%=aMemberAll%>,<%=cMemberAll%>],
  labels: ['일반회원','기업회원']
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

// 탈퇴처리하기
function updateDelMember(){
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
		alert('탈퇴처리할 데이터를 체크해주세요')
		return false;
	}

	if(confirm(checkCount + '개의 데이터를 탈퇴처리 합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'updateDelMemberA.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data === true ){
					alert('성공적으로 탈퇴처리 되었습니다.')
					location.reload();
				}else{
					alert('탈퇴처리 실패함')
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
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}

</style>
<%@include file="./include/footer.jsp" %>
  