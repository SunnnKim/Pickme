<%@page import="model.CMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/adminHeader.jsp" %>
<%
	List<CMemberDto> companyList = (List<CMemberDto>) request.getAttribute("companyList");
%>
<div class="statisitc">
	<div class="title">승인필요 기업</div>
	<div><%=companyList.size() %></div>
</div>
<div id="example">
          <div id="grid"></div>
          <div class="btn-wrapper">
            <button id="check">전체체크</button>
            <button onclick="unapprovalBtn()">승인취소</button>
            <button onclick="approvalBtn()">승인</button>
          </div>
      </div>
      <script>
		// 데이터 가져오기 
		var companyList = [
		<%
			for( int i = 0; i < companyList.size(); i++ ){
				CMemberDto dto = companyList.get(i);
			%>
				{ NUM:<%=i+1%>,
					SEQ:<%=dto.getSeq()%>,
                    NAME:'<%=dto.getName()%>',
                    NUMBER:'<%=dto.getNumber()%>',
                    EMAIL:'<%=dto.getEmail()%>',
                    TYPE:'<%=dto.getType()%>',
                    STATUS:'<%= dto.getDel() == 0 ? "미승인": "재확인필요" %>'
				},
			<%
			}
		%>
		]
      
        $(document).ready(function () {
            $("#grid").kendoGrid({
                dataSource: {
                    data:companyList,
                    pageSize: 20
                },
                height: 500,
                groupable: true,
                toolbar: ["search"],
                sortable: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 5
                },
                columns: [{
                    field: "NUM",
                    title: "NUM",
                    width: 50
                }, {
                    field: "EMAIL",
                    template: "<div style='height:20px; overflow:hidden; white-space:nowrap;  text-overflow: ellipsis;'>#:EMAIL#</div>",
                    title: "EMAIL",
                    width: 250
                }, {
                    field: "NAME",
                    template: "<div style='height:20px; overflow:hidden; white-space:nowrap;  text-overflow: ellipsis;'>#:NAME#</div>",
                    title: "회사명"
                }, {
                    field: "TYPE",
                    title: "TYPE"
                }, {
                    field: "NUMBER",
                    template: "<div class='check-number' onclick='onopen( #:NUMBER#)'>#:NUMBER#</div>",
                    title: '사업자등록번호'
                }, {
                    field: "STATUS",
                    title: "가입상태",
                    width: 100
                }, {
                    field: "SEQ",
                    title: "체크",
                    template: "<label class='check-label'><input type='checkbox' seq='#: SEQ #'  style='text-align:center' name='checkbox'></label>",
                    width: 50
                }]
            });
            $('.k-grouping-header').text('[ 여기에 그룹핑할 말머리를 드래그하세요 ]')
        });
    </script>
    
<script>

function onopen( value )
{
var url = "http://www.ftc.go.kr/bizCommPop.do?wrkr_no=" + value;
win = window.open(url, "PopupWin", "width=650, height=600;Uncopyhistory=no");
}
</script>

<script>
// 승인버튼 
function approvalBtn(){
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
		alert('승인할 데이터를 체크해주세요')
		return false;
	}
	console.log(seqList)
	if(confirm(checkCount + '개의 데이터를 승인합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'approveCompany.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data == true){
					alert('성공적으로 승인되었습니다.')
					location.reload();
				}else{
					alert('승인 실패함')
				}
			}, error: function(err){
				alert('error!')
			}
		})

	}
}
function unapprovalBtn(){
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
		alert('승인할 데이터를 체크해주세요')
		return false;
	}
	console.log(seqList)
	if(confirm(checkCount + '개의 데이터를 승인취소 합니다.')){
		console.log(seqList)
		var sendData = { "seqList":seqList };
		$.ajax({
			url:'unapproveCompany.do',
			data:sendData,
			type:'post',
			success: function(data){
				if(data == true){
					alert('성공적으로 승인취소 되었습니다.')
					location.reload();
				}else{
					alert('승인취소 실패함')
				}
			}, error: function(err){
				alert('error!')
			}
		})

	}

	
}

// check all
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
.statisitc{ text-align: center; height: 100px; margin-bottom: 30px}
.statisitc div{ font-size: 50px;}
.statisitc div.title{ font-size: 15px}
.table-btn{height: 40px; line-height: 30px;}
.table-btn span{ font-size: 20px; margin-left: 5px;}
.table-btn div{ border: 1px solid; transition: all 0.3s ease-in-out; margin-left: 10px;width: 100px; text-align: center; float: right; cursor: pointer;}
.table-btn div:hover{ background:#333; color:#fff; }
.table-title{ width: 100%; border: 1px solid; text-align: center; line-height: 50px; background-color: #333; color: #fff;}
.table-title ul{ width: 100%; height: 50px;}
.table-title ul li{ float: left; }
.amember-list{ border: 2px solid #eee; height: 300px; overflow-y: scroll;}
.between{ margin-top:100px;}
.check-label{ display: inline-block; width: 100px; margin: 0px -10px;}
.check-label input{ text-align: center; margin-left: 25px;}
.btn-wrapper{ margin: 20px 0; height: 30px; }
.btn-wrapper button{ float:right; margin-left: 10px; width:100px; height: 30px; line-height:30px; color:#fff; background: #4f6eff; outline: none; }

  /* 조회버튼 */
  .check-number{
    border: 1px solid; text-align: center; color: #fff; background: #333; cursor: pointer;
  }
  .check-num{
    background-color: #888;color: #fff; display: inline-block; width: 100px;
    border: 1px solid; padding: 5px 10px; margin-left: 20px; cursor: pointer;
  }
  </style>

<%@include file="./include/footer.jsp" %>
