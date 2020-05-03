<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="resumeListWrap">
	<div class="resume-list clfix">
		<div class="resume-item">
			<a href="/Pickme/resume/resumeWrite.do" class="new_resume">
				<div>
					<i class="fas fa-file-alt"></i> <span>새 이력서 작성</span>
				</div>
			</a>
		</div>
		<!-- // resume-item  새 이력서 작성 -->
		<div class="resume-item">
			<form id="form" method="post" enctype="multipart/form-data">
			<div class="dropZone">			
				<label for="inputFile">	
					<div>
						<i class="fas fa-file-upload"></i> <span>파일업로드</span>
						<input type="file" id="inputFile" name="originalName">
					</div>
				</label>
			</div>
			</form>
		</div>
		<!-- // resume-item  파일업로드 -->
		
		<c:choose>
        	<c:when test="${empty resumeList }">
			
			</c:when>
			<c:when test="${not empty resumeList }">				  
				<c:forEach items="${resumeList }" var="dto" varStatus="rs">						
					<div class="resume-item <c:if test="${dto.status != 0}">complete</c:if>">
						<div class="resume-preview">
							<a href="/Pickme/resume/resumeView.do?seq=${dto.seq }">
								<div class="resume-choice">
									<label class="radioBtn <c:if test="${dto.mainResume != 0}">active</c:if>" title="대표 이력서 선택">
										<input type="radio" name='m_resume' value="${dto.mainResume }" title="대표 이력서 선택">
										<input type="hidden" value="${dto.seq }">
										<i class="fa fa-square-o fa-2x"></i>
										<i class="fa fa-check-square-o fa-2x"></i>
									</label>
								</div>
								<h3><input type="text" name="rsmTit" value="${dto.name }" readOnly><input type="hidden" value="${dto.seq }"></h3>
								<p>${dto.wDate }</p>
							</a>
						</div>
						<div class="resume-info clfix">
							<c:if test="${dto.status == 0}"><p>작성중</p></c:if>
							<c:if test="${dto.status == 1}"><p>작성완료</p></c:if>
							<c:if test="${dto.status == 2}"><p>첨부완료</p></c:if>							
							<div class="resume-menu">
								<div class="resume-menuBtn">
									<span></span> <span></span> <span></span>
								</div>
								<ul>
									<li class="nameChange">이름 변경</li>
									<li >다운로드</li>
									<li class="delete">삭제<input type="hidden" value="${dto.seq }"></li>
								</ul>
							</div><!-- // resume-menu -->							
						</div><!-- // resume-info -->						
					</div><!-- // resume-item -->					
				</c:forEach>			      
				
			</c:when>
		</c:choose>
          	
	</div><!-- // resume-list -->
	
	
</div>
<!-- // resumeListWrap -->

1-${aMemberDto.userName }
2-${aMemberDto.phone }
3-${aMemberDto.email }
<script>

// 파일 업로드 눌렀을 때
$(".dropZone").on("click",function(){

	var memSeq = ${sessionScope.loginuser.seq};
	var name = $("input[name=originalName]").val();
	var userName = "${aMemberDto.userName }";
	var phone = "${aMemberDto.phone }";
	var email = "${aMemberDto.email }";
	var status = 2;
	
	var filePath = "/upload/resume/";

	console.log({
		'memSeq':memSeq, 'name':name, 'userName':userName, 'phone':phone, 'email':email, 'status':status, 
		'rsmSeq':rsmSeq, 'originalName':originalName, 'filePath':filePath
	});
	
	return false;
	
	var frmTag = document.getElementById("form");

	 var form = $('#form')[0];
     var formData = new FormData(form);


	var getFile = $('input[name=originalName]')[0].files[0]
	formData.append("file", getFile);
    $.ajax({
      data: formData,
      type: 'POST',
      url: "resumeFileUpload.do",
      cache: false,
      contentType: false,
      processData: false,
      async : false,
      enctype: 'multipart/form-data',
      success: function (data) { 
			alert('success');
			Swal.fire({
				  icon: 'success',
				  title: '파일 첨부가 완료됐습니다',
				  timer: 1500
			}).then(function(result){
				
			});
			
	     }
        
    });
		
});

//메뉴 버튼 (이름변겅, 다운로드 , 삭제 )
$(".resume-menu").click(function(){
   $(".resume-menu ul").not($(this).find('ul').fadeToggle('fast')).hide();
});

// 메인 이력서 체크
$(".radioBtn").unbind("click").bind("click",function(){
	
   $(".radioBtn").not($(this).addClass('active')).removeClass('active');
   var memSeq = ${sessionScope.loginuser.seq};
   var seq = $(this).find('input[type=hidden]').val();
   //alert(memSeq);
   //alert(seq);

   $.ajax({
		url:"MainResumeUpdate.do",
		type:"post",
		datatype:'json',
		data:{'seq':seq, 'memSeq':memSeq},
		success: function(data){
			
				//alert("MainResumeUpdate.do");		
				Swal.fire({
					  icon: 'success',
					  title: '메인 이력서 변경',
					  timer: 1500
				})
			
			
		}
	});
	
   
});


// 이름 변경 클릭 시 
$(".nameChange").click(function(){
	var target = $(this).parent('ul').parent('.resume-menu').parent('.resume-info').siblings('.resume-preview').find('h3 input');
	target.removeAttr("readOnly"); 		
	target.css('pointer-events', 'unset');
	target.focus();
});

// 이력서명 바꾸기 
$("input[name=rsmTit]").on('blur', function(){
	$(this).css('pointer-events', 'none');
	$(this).attr("readOnly",true);
	var name = $(this).val();	
	var seq = $(this).siblings('input[type=hidden]').val();
	// alert('seq' + seq);
	// alert('name' + name);
	
	$.ajax({
		url:"ResumeNameUpdate.do",
		type:"post",
		datatype:'json',
		data:{'name':name,'seq':seq},
		success: function(data){
			//alert("ResumeNameUpdate.do");		
			Swal.fire({
				  icon: 'success',
				  title: '이력서명 변경이 완료됐습니다',
				  timer: 1500
			})
			
		}
	});
	

});

// 이력서명 enter key 이용 변경시켜주기

const intervalCall1000 = intervalCall(1000)
 $("input[name=rsmTit]").keyup(function(e){ 
	 if(e.keyCode == 13){ // enter 
		// 인터벌 함수 실행 
		 intervalCall1000(() => {
		 	$(this).blur();
	    })
	}

});

//enter 중복클릭 방지
// interval 시간 안에 다시 호출된 함수 콜은 무시한다
function intervalCall(interval){
  let elapsed = true
  return (fn) => {
    if(!elapsed){
      return    // 마지막 호출 후 제한된 경과시간이 지나지 않은 경우 리턴
    }
    elapsed = false
    fn()
    setTimeout(() => {elapsed = true}, interval)
  }
}

// 삭제 
$(".delete").click(function(){
	  var seq = $(this).find('input[type=hidden]').val();
	  //alert(seq);
	  Swal.fire({
	  	title: '삭제하시겠습니까?',
	 	 showCancelButton: true,
	  	confirmButtonColor: '#3085d6',
	 	 cancelButtonColor: '#d33',
	 	 confirmButtonText: '삭제',
	 	 cancelButtonText: '닫기',
		}).then((result) => {			
	 		if (result.value) {		
	 			$.ajax({
	 				url:"ResumeDelete.do",
	 				type:"post",
	 				datatype:'json',
	 				data:{'seq':seq},
	 				success: function(data){
	 					// alert("ResumeDelete.do");	
	 					Swal.fire({
	 						  icon: 'success',
	 						  title: '이력서가 삭제됐습니다',
	 						  timer: 1500
	 					}).then(function(result){
	 						//location.href="resume.do";
	 						
	 						
	 					});
	 					
	 				}
	 			 }); //ajax 
	 			$(this).parent('ul').parent('.resume-menu').parent('.resume-info').parent('.resume-item').remove();
	  		 }
	 		
		});	
	  
});


//paging
function paging(pn){	
	 location.href="resume.do?&pageNumber=" + pn;	
}

</script>

<%@include file="../../../include/footer.jsp"%>
