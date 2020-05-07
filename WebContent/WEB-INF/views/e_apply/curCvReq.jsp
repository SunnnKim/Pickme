<%@page import="pickme.com.a.util.EApplyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL사용 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"
	crossorigin="anonymous"></script>

<!-- subCont 시작 -->

<!-- 로그인 검증  -->


<!-- 메뉴 -->
<ul class="tab-default column3 mt30" data-tab="">
	<li class="active"><a href="curCvReq.do">현재요청</a></li>
	<li><a href="pastCvReq.do">지난요청</a></li>
</ul>


<div id="allList" data-tab-content="" class="active">

	<!-- 검색창 -->
	<div class="bbs-top">
		<div class="form-search">
			<c:if test="${not empty sKeyword}">
			<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="" value="${sKeyword }">
			</c:if>
			<c:if test="${empty sKeyword}">
			<input type="text" id="_keyword" name="keyWord" title="검색어 입력"
				placeholder="검색어를 입력해주세요." value="">
			</c:if>
			<button type="button" class="btn-search" onclick="searchAction()">
				<span>검색</span>
			</button>
		</div>
	</div>


	<div class="bbs-infoWrap clfix mt30">
		<div class="bbs-lt">
			총 <span>${totalRecordCount }</span>개
		</div>
		<div class="bbs-rt">
			<p class=cancel-notice></p>
		</div>
	</div>

	<!-- 리스트 -->
	<div class="table-col table-bbs mt10">
		<table>
			<caption>전체</caption>
			<colgroup>
				<col style="width: 5%">
				<%-- <col style="width: 8%"> --%>
				<col style="width: 15%">
				<col style="width: 40%">
				<col style="width: 15%">
				<col style="width: 25%">
			</colgroup>
		<thead>
				<tr>
					<th><input type="checkbox" id="checkall"></th>
					<!-- <th>번호</th> -->
					<th>기업명</th>
					<th>COMMENT</th>
					<th>요청일</th>
					<th>수락여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cvReqList }">
					<tr>
						<c:if test="${not empty sKeyword }">
							<td colspan="5">검색결과가 없습니다</td>
						</c:if>
						<c:if test="${empty sKeyword }">
							<td colspan="5">현재요청내역이 없습니다</td>
						</c:if>
				</c:if>

				<c:forEach items="${cvReqList }" var="cvReq" varStatus="vs">
					<c:set var="rdate" value="${cvReq.rdate }" />
					<tr>
						<td><input type="checkbox" name="checkRow"
							value="${cvReq.seq }"> <input type="hidden"
							class="cvReq_cSeq" value="${cvReq.cSeq}"></td>
						<td><a href="/Pickme/c_mypage/goCMypage.do?sentSeq=${cvReq.cSeq }" style="text-align:center;">${cvReq.name }</a></td>
						<td>${cvReq.comment }</td>
						<td><%=EApplyUtil.todayMsg(pageContext.getAttribute("rdate").toString())%></td>
						<td>
							<button class="cvAcepBtn"
								onclick="singleAccept(${cvReq.seq}, ${cvReq.cSeq })">수락</button>
							<button class="cvRejBtn" onclick="reject(${cvReq.seq})">거절</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- // table-col close -->

	<div class="cvreq-DelBtn">
		<button type="button" style="float: left;" onclick="acceptAction()">선택수락</button>
	</div>

	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/e_apply/paging.jsp" flush="false">
			<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
		</jsp:include>
	</div>
	<!-- // paging_wrap -->
</div>
<!-- // allList -->


<script>
	$(document).ready(function() {
		// 체크박스 전체 체크
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		})
	})
	
	/* 선택 삭제(체크박스된 것 전부) */
	function acceptAction() {   
		var seqArray = [];
		var cSeqArray = []
		$("input[name='checkRow']:checked").each(function() {
			// 배열에 집어넣기
			seqArray.push($(this).val());
			cSeqArray.push($(this).siblings('.cvReq_cSeq').val());
		//	alert("cSeq:" + $(this).siblings('.cvReq_cSeq').val());

		});
		
		if (seqArray == null || seqArray.length == 0) {
			Swal.fire({
				  icon: 'warning',
				  title: '선택하신 요청이 없습니다.',
				  text: '수락하실 요청을 먼저 선택해주세요.',
				  
				})
			return false;
		}

		$.ajax({
			type	: "post",
			url		: "getMainResume.do",
			dataType: "json",
			success : function(data){
				// 작성된 이력서 없을 때
				if(data == 0){
					Swal.fire({
							  icon: 'warning',
							  title: '수락하실 메인이력서가 없습니다',
							  text: '메인이력서를 설정해주세요.',
							  
							})
						return false;
				}	
	
				Swal.fire({
					  title: '선택하신 요청을 수락하기 원하십니까?',
					  text: "",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  cancelButtonText:'돌아가기',
					  confirmButtonText: '수락하기'
					}).then((result) =>{
					  if (result.value) {
						  $.ajax({
								url        : "cvReqAccept.do",
								dataType   : "json",
								type       : "post",
						    	traditional: true, // array보낼때 필요
								data       : {"seqArray" : seqArray, 
											  "cSeqArray" : cSeqArray	
											 },						
								success    : function(data){			
									if(data != null){
										Swal.fire({
											  position: 'center',
											  icon: 'success',
											  title: '수락되었습니다!',
											  showConfirmButton: false,
											  timer: 1000
										}).then( (result) =>{
		
										  var sKeyword = '<c:out value="${sKeyword}"/>';
										  var pn = '<c:out value="${pageNumber}"/>'
										
										location.href="curCvReq.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
										});
									}else{
										Swal.fire({
											  position: 'center',
											  icon: 'warning',
											  title: '작성된 메인이력서가 없습니다',
											  showConfirmButton: true,
											  cancelButton : true,
											  timer: 1000
										}).then( (result) =>{
		
											location.href="/Pickme/resume/resume.do";
										
										});
									}
								},
								error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							    }
						   });	
					  }
				});

		  },

		  error:function(){
			  
	     }		
		});	
		  
	}

	// 요청거절
	function reject(seq){
		Swal.fire({
			  title: '요청을 거절하기 원하십니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'돌아가기',
			  confirmButtonText: '거절하기'
			}).then((result) =>{
			  if (result.value) {
				  $.ajax({
						url        : "cvReqReject.do",
						dataType   : "json",
						type       : "post",
				    	traditional: true, // array보낼때 필요
						data       : {"seq" : seq, 
									 },						
						success    : function(data){			
							if(data != null){
								Swal.fire({
									  position: 'center',
									  icon: 'success',
									  title: '거절되었습니다!',
									  showConfirmButton: false,
									  timer: 1000
								}).then( (result) =>{

								  var sKeyword = '<c:out value="${sKeyword}"/>';
								  var pn = '<c:out value="${pageNumber}"/>'
								
								location.href="curCvReq.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
								});
							}
						},
						error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
				   });	  
			  }
		});
	}

	//요청 수락 (이력서 선택)
	function singleAccept(seq, cSeq){

		$.ajax({
			type	: "post",
			url		: "getResumeList.do",
			dataType: "json",
			success : function(data){
				// 작성된 이력서 없을 때
				if(data == ""){
					Swal.fire({
							  icon: 'warning',
							  title: '수락하실 이력서가 없습니다',
							  text: '이력서를 먼저 작성해주세요.',
							  
							})
						return false;
				}		
											
				
				// ajax로 받아온 이력서 리스트 배열에 넣기 
			    var optionArray = new Array();		
				$.each(data, function(index, resume){
					optionArray.push({seq: resume.seq, name: resume.name})
			
				});

				//배열에 들어있는 데이터를 sweetalret의 inputoptions에 넣기 좋은 형태로 가공 
				var options = {};
				$.map(optionArray, function(o){
					options[o.seq] = o.name;		
				});

				console.log(options);
				if(options != {}){
					(async() => {
						const { value: resume } = await Swal.fire({
						  title:'열람요청수락하기',
						  input: 'select',
						  inputOptions: options,
						  inputPlaceholder: '이력서 선택',
						  showCancelButton: true,
						  inputValidator: (value) => {
						    return new Promise((resolve) => {
						      if (value != "") {
						        resolve()
						      } else {
						        resolve('열람요청을 수락할 이력서를 선택해주세요')
						      }
						    })
						  }
						})
						
						// resume에 선택한 이력서 seq담기면 ajax로 수락요청 시행
						if (resume) {
							$.ajax({
								url     : "pickNSendResume.do",
								type    : "post",    
								dataType: "text",
								data    : {
											"seq"  : seq,
										    "cSeq" : cSeq,
										    "rSeq" : resume	
								          },	
								success : function(data){
									console.log(data);
									
									if(data != null){
										Swal.fire({
											  position: 'center',
											  icon: 'success',
											  title: '수락되었습니다!',
											  showConfirmButton: false,
											  timer: 1000
										}).then( (result) =>{
										  var sKeyword = '<c:out value="${sKeyword}"/>';
										  var pn = '<c:out value="${pageNumber}"/>'
										// 수락성공 후 페이지 다시 로드함
										location.href="curCvReq.do?sKeyword=" +sKeyword + "&pageNumber=" + pn;
										});		
									 }
								},
								error : function(request,status,error){
									  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
									Swal.fire({
										  icon: 'error',
										  title: '문제가 발생하였습니다',
										  text: '잠시 후 다시 시도해주세요',
									})											
								}          
						   });
						}	
					})()	 
				}	
					 	
			},
			error : function(){
				
			}	
		});
						
	}


	/* 페이지 이동*/
	
	function goPage(pn){
		  var sKeyword = '<c:out value="${sKeyword}"/>';
		  var filter = '<c:out value="${filter}"/>';
			
		  location.href="curCvReq.do?sKeyword=" + sKeyword +"&pageNumber=" + pn;
			
	}

	// 검색 
	function searchAction() {
		var sKeyword =($("#_keyword").val()).trim();
		
			if(sKeyword == null || sKeyword == ""){
				alert("검색어를 입력해주세요.");
			}else{
			 location.href="curCvReq.do?sKeyword=" + sKeyword +"&pageNumber=0";
			}	
		}


	// enter키로 검색 
	$("#_keyword").keyup(function(e){if(e.keyCode == 13) searchAction(); });
			
	
	


	
</script>


<!-- subCont 끝 -->



<%@include file="/include/footer.jsp"%>
