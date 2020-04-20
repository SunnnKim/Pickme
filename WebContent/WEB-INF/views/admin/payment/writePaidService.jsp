<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
	<!-- JQuery -->

<!-- HTML -->
<div class="profile-wrap">
<form action="" method="POST">
  <div class="content-wrap">
    <div class="contents-box">
      <span>서비스명</span>
      <input type="text" name="serviceName">
      <span>가격</span>
      <input type="text" autocomplete="" name="price" numberOnly maxlength="8" style="text-align: right; padding-right: 10px;">
    </div>
    <textarea id="summernote" name="content"></textarea>
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
      <div id="submitBtn">등록하기</div>
    </div>
</div>

<!-- Javascript -->
<script>
	$(document).ready(function() {
	  $('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});
	// 가격은 숫자만 
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    if($(this).length == 1 && $(this).val() == '0'){
	      $(this).val($(this).val().replace(/[^1-9]/g,""));
	    }
	  });
	
	// 등록버튼 눌렀을때 
	$('#submitBtn').click(function(){
	
	  // 변수 
	  var serviceName = $('input[name=serviceName]');
	  var price = $('input[name=price]');
	  var content = $('textarea[name=content]');
	
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
	  // 모달열기 
	  $('.serviceName').html(serviceName.val())
	  $('.servicePrice').html(price.val())
	  $('.check-modal').css('display', 'block');
	
	  
	})
	
	});
	// clossBtn 
	$('#clossBtn').click(function(){
	  $('.check-modal').css('display', 'none');
	})
</script>

<!-- CSS -->
<style>
.content-wrap{ width: 900px; margin: 0 auto; }
.content-wrap .contents-box { margin: 10px 0; height: 50px; margin-bottom: 30px;}
.content-wrap .contents-box > span{font-size: 20px; width: 120px; display: inline-block; text-align: center;}
.content-wrap .contents-box  .price-tag .number { margin: 0 10px;}
.content-wrap .contents-box > input{ width: 300px; height: 40px; padding-left: 10px; outline: none;}
.content-wrap .submit-btn{ text-align: center;}
.content-wrap .submit-btn > button{ background-color: #304edf; color: #fff; width: 100px; height: 50px; outline: none;}
/* modal */
.check-modal{height: 100%; background-color: rgb(51, 51, 51,0.3); width: 100%;position: fixed; top: 0; left: 0; color: #333; display: none;}
.check-modal .modal-form {width: 500px; margin: 0 auto; height: 400px; background: #fff;position: fixed; top: 150px; left: 30%; z-index: 1000;}
.check-modal .modal-form .label-title {width: 200px; font-size: 30px; color: #333; margin: 20px auto;}
.check-modal .modal-form .title { margin: 30px; height: 50px; padding: 0 10px; line-height: 50px;}
.check-modal .modal-form .title > .service-title{text-align: center; float: left; color: #fff;display: block; width: 120px; font-size: 15px; background: #bbb;}
.check-modal .modal-form .title > .serviceName{ border: 1px solid #eaeaea; display: inline-block; margin-left: 20px; width: 250px; padding: 0 20px }
#submitBtn{ cursor: pointer; background: #4356b3; color:#fff; width: 200px; text-align: center; height: 40px; line-height: 40px; margin: 0 auto;}
</style>

<!-- footer -->
<%@include file="../include/footer.jsp" %>
