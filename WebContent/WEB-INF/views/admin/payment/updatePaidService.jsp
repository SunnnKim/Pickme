<%@page import="model.PremierServiceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PremierServiceDto dto = (PremierServiceDto) request.getAttribute("dto");
%>
<!-- Header -->
<%@include file="../include/adminHeader.jsp" %>
<!-- resource -->
<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="/Pickme/js/summernote/summernote.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="/Pickme/js/summernote/summernote.js"></script>
<!-- //summernote -->

<!-- HTML -->
<div class="profile-wrap">
<form action="updateService.do" id="frm" method="POST">
	<input type="hidden" value="<%=dto.getServiceSeq()%>" name ="serviceSeq">
  <div class="content-wrap">
    <div class="contents-box">
      <span>서비스명</span>
      <input type="text" name="serviceName" style="width: 81%" value="<%=dto.getServiceName()%>">
      <span>가격</span>
      <input type="text" name="price" numberOnly maxlength="8" style="text-align: right; padding-right: 10px;"  value="<%=dto.getPrice()%>">
      <span>기간</span>
      <input type="text" name="period" style="text-align: right; padding-right: 10px;" value="<%=dto.getPeriod()%>">
      <span>요약</span>
      <input  style="width: 81%" type="text" name="serviceInfo" style="text-align: right; padding-right: 10px;"  value="<%=dto.getServiceInfo()%>">
    
    </div>
    <textarea id="summernote"></textarea>
    <input type="hidden" name="content" >
    <div class="submit-btn">
      <button type="button" id="submitBtn">서비스등록</button>
    </div>
    </div>
</form>
</div>

<!-- modal -->
<div class="check-modal">
    <div class="modal-form">
      <div id="clossBtn" style="position: absolute; font-size: 30px; padding-right: 10px; right: 0; color:#eaeaea; cursor:pointer;">X</div>
      <div class="label-title">유료서비스 등록</div>
      <div class="service-name title">
        <span class="service-title">서비스명</span>
        <span class="serviceName serviceName">zzz</span>
      </div>
      <div class="service-price title">
        <span class="service-title">가격</span>
        <span class="serviceName servicePrice">zzz</span>
      </div>
      <div style="height: 80px; text-align: center; line-height: 80px;font-size: 18px;">정말로 등록하시겠습니까?</div>
      <div id="submitModal">등록하기</div>
    </div>
</div>

<!-- Javascript -->
<script>
$('input[name=content]').val(`<%=dto.getContent()%>`);	// 내용 불러오기 (데이터에 저장)
$('#summernote').val(`<%=dto.getContent()%>`)
$(document).ready(function() {
	// summernote Image Upload
	  	let fileArray = [];
		let keyCnt = 0;
		$('#summernote').summernote({
		height: 400,
		callbacks: {
            onImageUpload: function (files, editor, welEditable) {
                sendFile(files[0], editor, welEditable);
     	      }
     	   }
		});

		// 기존에 있던 이미지파일 비교 어레이  
		var beforeUpdateContents = $('#summernote').val();
		var splitArr = beforeUpdateContents.split('<img ');

		// 텍스트에디터 안에 있는 소스만 배열로 옮기기 
		for( i = 1; i < splitArr.length; i++ ) {
			var arr = splitArr[i];
			if( !arr.includes('src') ) continue;	// 소스코드가 없는 태그들 빼기 
			arr = arr.split('>')[0];
			// 소스부분 잘라서 비교할 배열에 넣기 
			var temp1 = arr.split('filename=')[1];
			var temp2 = arr.split('id="')[1];
		
			var obj = {};
			var nameAndPath = temp1.substring(0, temp1.indexOf('\"')).split('&amp;filepath=');
			obj.key = temp2.substring(0, temp2.indexOf('\"'));
			obj.filename = nameAndPath[0];
			obj.filepath = nameAndPath[1];
			
			fileArray.push(obj);	// 비교할 데이터를 배열에 담기
		}


		console.log(fileArray)
		
		
		//이미지 업로드 시 temp 폴더에 저장 후 불러옴 
		function sendFile(file, editor, welEditable) {
			   let data = new FormData();
			   data.append("file", file); 

			    $.ajax({
			      data: data,
			      type: 'POST',
			      url: "serviceContentImg.do",
			      cache: false,
			      contentType: false,
			      processData: false,
			      enctype: 'multipart/form-data',
			      success: function (url) { 
			         var key = ('img_' + keyCnt);
			    	 fileArray.push({
			    		'key': key,
			    		'filename': url.filename,
			    		'filepath': url.filepath,
			    		'file': file
			    	});
			    	// 에디터창에 넣기
			    	var downloadUrl = '/Pickme/admin/payment/imgDownload.do?filename=' + url.filename + '&filepath=' + url.filepath;
		         	$("#summernote").summernote('editor.insertImage', downloadUrl, ('img_' + keyCnt));
			        keyCnt++;
			      }
			   });
			}	
	// 등록버튼 눌렀을때 
	$('#submitBtn').click(function(){
	
	  // 변수 
	  var serviceName = $('input[name=serviceName]');
	  var price = $('input[name=price]');
	  var content = $('#summernote');
	  var serviceInfo = $('input[name=serviceInfo]');
	  var period = $('input[name=period]');
	
	  // 빈칸 검사 
	  if(serviceName.val().trim() == ''){
	    alert('서비스명을 작성하세요')
	    serviceName.focus()
	    return false;
	  }
	  if(price.val().trim() == ''){
	    alert('가격을 작성하세요')
	    price.focus()
	    return false;
	  }
	  if(content.val().trim() == ''){
	    alert('내용을 작성하세요')
	    content.focus()
	    return false;
	  }
	  if(serviceInfo.val().trim() == ''){
	    alert('서비스내용요약을 작성하세요')
	    serviceInfo.focus()
	    return false;
	  }
	  if(period.val().trim() == ''){
	    alert('서비스기간을 작성하세요')
	    period.focus()
	    return false;
	  }
	  // 모달열기 
	  $('.serviceName').html(serviceName.val())
	  $('.servicePrice').html(changeValue(price.val()) + " 원");
	  $('.check-modal').css('display', 'block');
	});
	
	// submitModal
	$('#submitModal').click(function(){
		
		// 텍스트에디터에 있는 사진 비교하기 
		var contentHtml = $('#summernote').val();
		var splitArr = contentHtml.split('<img ');
		var uploadArr = [];	// 텍스트에디터 안에 있는 소스코드부분 배열에 담기 

		// hidden에 content 값 넣기 
		$('input[name=content]').val(contentHtml);
	
		// 텍스트에디터 안에 있는 소스만 배열로 옮기기 
		for( i = 1; i < splitArr.length; i++ ) {
			var arr = splitArr[i];
			if( !arr.includes('src') || !arr.includes('temp') ) continue;	// 소스코드가 없는 태그들 빼기 
			arr = arr.split('>')[0];
			// 소스부분 잘라서 비교할 배열에 넣기 
			var temp1 = arr.split('filename=')[1];
			var temp2 = arr.split('id="')[1];
		
			var obj = {};
			var nameAndPath = temp1.substring(0, temp1.indexOf('\"')).split('&amp;filepath=');
			obj.key = temp2.substring(0, temp2.indexOf('\"'));
			obj.filename = nameAndPath[0];
			obj.filepath = nameAndPath[1];
			uploadArr.push(obj);	// 비교할 데이터를 배열에 담기
		}

		console.log(uploadArr)
		// 파일데이터를 담을 formData
		let data2 = new FormData();
			
		// 탐색하기
		for( arr of uploadArr ){
			for( fileArr of fileArray ){
				if( arr.filename === fileArr.filename ){
					data2.append('file', fileArr.file)
					data2.append('filename', fileArr.filename)
					$("#frm").append("<input type='hidden' name='contentfilename' value='"+fileArr.filename+"'>");
					break;	
				}
			}
		}
		
		
		// ajax로 콘텐츠 사진부터 업로드하기 
		$.ajax({
	      data: data2,
	      type: 'POST',
	      url: "editorImageUpload.do",
	      cache: false,
	      contentType: false,
	      processData: false,
	      enctype: 'multipart/form-data',
	      success: function (data) { 
			if(data == 'success'){
				// 텍스트에디터 경로 모두 바꾸기 
				var modifiedContent = contentHtml.replace(/\/upload\/temp/gi, '/upload/paidService');
				//console.log(modifiedContent);
				$('input[name=content]').val(modifiedContent);
				$("#frm").submit(); 
			}else{
				alert('fail to upload editor images!')
			}	    	
	     }
	   }); 
	});
});
</script>
<script>
// 기능함수
// clossBtn 
$('#clossBtn').click(function(){
  $('.check-modal').css('display', 'none');
})	
// 가격은 숫자만 
$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
    if($(this).length == 1 && $(this).val() == '0'){
      $(this).val($(this).val().replace(/[^1-9]/g,""));
    }
  });
// 세자리 이상 숫자에 , 붙이기 
function changeValue( number ){
	number = String(number);
    return number.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

</script>

<!-- CSS -->
<style>
.content-wrap{ width: 900px; margin: 0 auto; }
.content-wrap .contents-box { margin: 10px 0; height: 160px; margin-bottom: 30px;}
.content-wrap .contents-box > span{font-size: 20px; width: 120px; display: inline-block; text-align: center;}
.content-wrap .contents-box .price-tag .number { margin: 0 10px;}
.content-wrap .contents-box > input{ width: 300px; height: 40px; padding-left: 10px; outline: none; margin:10px 0;}
.content-wrap .submit-btn{ text-align: center;}
.content-wrap .submit-btn > button{ background-color: #304edf; color: #fff; width: 100px; height: 50px; outline: none;}
/* modal */
.check-modal{height: 100%; background-color: rgb(51, 51, 51,0.3); width: 100%;position: fixed; top: 0; left: 0; color: #333; display: none;}
.check-modal .modal-form {width: 500px; margin: 0 auto; height: 400px; background: #fff;position: fixed; top: 150px; left: 30%; z-index: 1000;}
.check-modal .modal-form .label-title {width: 200px; font-size: 30px; color: #333; margin: 20px auto;}
.check-modal .modal-form .title { margin: 30px; height: 50px; padding: 0 10px; line-height: 50px;}
.check-modal .modal-form .title > .service-title{text-align: center; float: left; color: #fff;display: block; width: 120px; font-size: 15px; background: #bbb;}
.check-modal .modal-form .title > .serviceName{ border: 1px solid #eaeaea; display: inline-block; margin-left: 20px; width: 250px; padding: 0 20px }
#submitModal{ cursor: pointer; background: #4356b3; color:#fff; width: 200px; text-align: center; height: 40px; line-height: 40px; margin: 0 auto;}
</style>

<!-- footer -->
<%@include file="../include/footer.jsp" %>
