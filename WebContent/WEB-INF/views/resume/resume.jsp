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
		<div class="resume-item fileUpload">
			<form id="form" method="post" enctype="multipart/form-data">
			<div class="dropZone" onClick="ajaxFileUpload();">			
				<label for="inputFile">	
					<input type="hidden" name="memSeq" value="${sessionScope.loginuser.seq}">
					<input type="hidden" name="userName" value="${sessionScope.loginuser.name}">
					<input type="hidden" name="phone" value="${aMemberDto.phone }">
					<input type="hidden" name="email" value="${sessionScope.loginuser.email}">
					<input type="hidden" name="status" value="2">
					<div>
						<i class="fas fa-file-upload"></i> <span>파일업로드</span>
						<input type="file" id="inputFile" name="originalName" onChange="ajaxFileChange();">
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
						<c:choose>
						    <c:when test="${dto.status == 2}">
						    <div class="cover"></div>
						     <a href="#none" class="aDown">
						    </c:when>
							 <c:otherwise>
						     <a href="/Pickme/resume/resumeView.do?seq=${dto.seq }">
						    </c:otherwise>
						</c:choose>						
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
									<c:choose>
									    <c:when test="${dto.status == 2}">
									    <div class="cover"></div>
									     <li class="down">다운로드</li>
									    </c:when>
										 <c:otherwise>
									    <li class="nameChange">이름 변경</li>
									    </c:otherwise>
									</c:choose>	
									<li class="delete">삭제<input type="hidden" value="${dto.seq }"></li>
								</ul>
							</div><!-- // resume-menu -->							
						</div><!-- // resume-info -->						
					</div><!-- // resume-item -->					
				</c:forEach>			      
				
			</c:when>
		</c:choose>
          	
	</div><!-- // resume-list -->	
	
	<c:choose>
	<c:when test="${not empty resumeList }">
	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/resume/paging.jsp" flush="false">
			<jsp:param name="totalRecCount" value="${totalRecCount }" />
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
		</jsp:include>
	</div><!-- // paging_wrap -->
	</c:when>
	</c:choose>
</div>
<!-- // resumeListWrap -->


<script type="text/javascript">
//$('.downa').get(0).click();

function ajaxFileUpload() {
    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
    jQuery("#inputFile").click();
}

function ajaxFileChange() {
    // 파일이 선택되면 업로드를 진행한다.
    ajaxFileTransmit();
}

// ajax로 파일 전송
function ajaxFileTransmit() {
	
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
          
			//alert('success');
			Swal.fire({
				  icon: 'success',
				  title: '파일 첨부가 완료됐습니다',
				  timer: 1500
			}).then(function(result){
				location.href="resume.do";
			});

			
	  }
        
    });//ajax

    
}



//메뉴 버튼 (이름변겅, 다운로드 , 삭제 )
$(".resume-menu").unbind("click").bind("click",function(){
   $(".resume-menu ul").not($(this).find('ul').fadeToggle('fast')).hide();
});



//파일 다운로드
$(".cover").click(function(){
	var seq = $(this).parent('.resume-preview').siblings('.resume-info').find('input').val();
	//alert('seq' + seq);
	
	var target = $(this).next('a');
	$.ajax({
	   url:"resumeFileSelect.do",
	   type:"post",
	   //datatype:'json',
	   data:{'seq':seq},
	   success: function(data){
	      
	     //alert("resumeFileSelect.do");   
	      //alert("test"+JSON.stringify(data)+data.rsmSeq);   
	      
	      $(target).attr("href", '/Pickme/resume/download.do?filename='+data.storedName+'&filepath=/upload/resume/');
	      $(target).attr("download", data.originalName);  
	      $(target).get(0).click();
	      
	      
	   },
	   error : function(){
	      alert('error'); 
	   }
	    
	 });
});

$(".down").click(function(){
   //alert("클릭");
   var seq = $(this).siblings('.delete').find('input').val();
   //alert('seq' + seq);
   
   var target = $(this).parent('ul').parent('.resume-menu').parent('.resume-info').siblings('.resume-preview').find('a');
   //target.hide();
   $.ajax({
      url:"resumeFileSelect.do",
      type:"post",
      data:{'seq':seq},
      success: function(data){
         
         //alert("resumeFileSelect.do");   
         //alert("test"+JSON.stringify(data)+data.rsmSeq);   
         
         $(target).attr("href", '/Pickme/resume/download.do?filename='+data.storedName+'&filepath=/upload/resume/');
         $(target).attr("download", data.originalName);
         $(target).get(0).click();
         
      },
      error : function(){
         alert('error'); 
      }
      
   });

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
			});
			
			
			
		}
		
	});
	
   
});


// 이름 변경 클릭 시 
$(".nameChange").click(function(){
	var target = $(this).parent('ul').parent('.resume-menu').parent('.resume-info').siblings('.resume-preview').find('h3 input');
	$(this).parent('ul').parent('.resume-menu').parent('.resume-info').siblings('.resume-preview').find('.cover').hide();
	target.removeAttr("readOnly"); 		
	target.css('pointer-events', 'unset');
	target.focus();
});

// 이력서명 바꾸기 
$("input[name=rsmTit]").on('blur', function(){
	$('.cover').show();
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
	 						location.href="resume.do";
	 						
	 						
	 					});
	 					
	 				}
	 			 }); //ajax 
	 			// $(this).parent('ul').parent('.resume-menu').parent('.resume-info').parent('.resume-item').remove();
	  		 }
	 		
		});	
	  
});


//paging
function paging(pn){	
	 location.href="resume.do?&pageNumber=" + pn;	
}

</script>

<%@include file="../../../include/footer.jsp"%>
