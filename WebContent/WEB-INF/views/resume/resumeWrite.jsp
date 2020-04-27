<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="resumeWrite_Wrap">
	
	<div class="rsm_top">
		<div class="rsm-downBtn"><button><i class="fas fa-download"></i></button></div>
		<h3>김은청</h3>
		<input type="text" value="bitcamp@gmail.com" readonly>
		<input type="text" value="" name="phone" placeholder="연락처를 입력해주세요" maxlength="13">
		<textarea placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요.(3~5줄 권장)"></textarea>
	</div><!-- //rsm_top -->

	<div class="rsmCont">
		<h4>경력</h4>
		<div class="rsm_addBtn careerBtn">+ 추가</div>
		<form name="careerFrm">
		<div class="rsm_add">			
		</div><!-- //rsm_add -->
		</form>
	</div><!-- //rsmCont -->

	<div class="rsmCont">
		<h4>학력</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_left">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
						<span>-</span>
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
					</div>
					<p><label><input type="checkbox"><span></span>현재 재학중</label></p>
				</div>
				<!-- //rsm_left -->
				<div class="rsm_right">
					<input type="text" class="tit" placeholder="학교명">
					<input type="text" class="desc" placeholder="전공을 입력해주세요">
					<textarea placeholder="이수과목 또는 연구내용"></textarea>
				</div>
				<!-- //rsm_right -->
				<div class="rsm_delete">
					<i class="fas fa-times"></i>
				</div>
			</div>
			<!-- //rsm_addCont -->
		</div>
		<!-- //rsm_add -->
	</div>
	<!-- //rsmCont -->

	<div class="rsmCont">
		<h4>수상 및 기타</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_left">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
					</div>
				</div><!-- //rsm_left -->
				<div class="rsm_right">
					<input type="text" class="tit" placeholder="활동명">
					<textarea placeholder="세부사항"></textarea>
				</div><!-- //rsm_right -->
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="rsmCont">
		<h4>외국어</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="lang">
					<h5>언어</h5>
					<label><input type="radio" name="lang"><span></span>영어</label>
					<label><input type="radio" name="lang"><span></span>중국어</label>
					<label><input type="radio" name="lang"><span></span>일본어</label>
					<label><input type="radio" name="lang"><span></span>독일어</label>
					<label><input type="radio" name="lang"><span></span>프랑스어</label>
					<label><input type="radio" name="lang"><span></span>기타</label>
				</div>
				<div class="level">
					<h5>수준</h5>
					<label><input type="radio" name="level" value="유창함"><span></span>유창함</label>
					<label><input type="radio" name="level" value="비지니스회화"><span></span>비지니스회화</label>
					<label><input type="radio" name="level" value="일상회화"><span></span>일상회화</label>
				</div>
				<div class="lang_testBtn">+ 어학시험 추가</div>
				<div class="lang_test">
					<input type="text" class="desc" placeholder="시험명">
					<input type="text" class="desc" placeholder="점수/급">
					<div class="rsm_date">
						<input type="text" placeholder="YYYY" maxlength="4">
						<span>.</span>
						<input type="text" placeholder="MM" maxlength="2">
						<span>.</span>
						<input type="text" placeholder="DD" maxlength="2">
						<div class="rsm_delete"><i class="fas fa-times"></i></div>
					</div>
				</div>
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="rsmCont">
		<h4>링크</h4>
		<div class="rsm_addBtn">+ 추가</div>
		<div class="rsm_add">
			<div class="rsm_addCont clfix">
				<div class="rsm_right link"><input type="text" class="desc" placeholder="http://"></div>
				<div class="rsm_delete"><i class="fas fa-times"></i></div>
			</div><!-- //rsm_addCont -->			
		</div><!-- //rsm_add -->		
	</div><!-- //rsmCont -->
	

	<div class="resumeBtnWrap">
		<button type="button" name="button">임시저장</button>
		<button type="button" name="button">저장완료</button>
	</div>
</div>
<!-- //resumeWrite_Wrap -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>

<script type="text/javascript">

// 연락처 정규식 
$("input[name=phone]").on('keydown', function(e){
    // 숫자만 입력받기
    var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
 				
 	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
 	{
   	    e.preventDefault();
 	}
}).on('blur', function(){ // 포커스를 잃었을때 실행
     if($(this).val() == '') return;

     // 기존 번호에서 - 를 삭제.
     var trans_num = $(this).val().replace(/-/gi,'');
   
     // 입력값이 있을때만 실행
     if(trans_num != null && trans_num != '')
     {
         // 총 핸드폰 자리수는 11글자이거나, 10자
         if(trans_num.length==11 || trans_num.length==10) 
         {   
             // 유효성 체크
             var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
             if(regExp_ctn.test(trans_num))
             {
                 // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                 trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                 $(this).val(trans_num);
             }
             else
             {
                 //alert("유효하지 않은 전화번호 입니다.");
                 Swal.fire({
					  icon: 'error',
					  text: '유효하지 않은 전화번호 입니다'
				 });
                 $(this).val("");
                 $(this).focus();
             }
         }
         else 
         {
             // alert("유효하지 않은 전화번호 입니다.");
             Swal.fire({
				  icon: 'error',
				  text: '유효하지 않은 전화번호 입니다'
			 });
             $(this).val("");
             $(this).focus();
         }
   }
});



//날짜 입력 숫자만 가능하게
$('.rsm_date input[type=text]').keyup(function(event){
  var inputVal = $(this).val();
  $(this).val(inputVal.replace(/[^0-9]/gi,''));
});

/************* prependTo **************/
// prepend career
var careerCount = 0;
$('.careerBtn').click(function(){
	// var target = $(this).siblings('.rsm_add');
	var target = $(this).siblings('form').find('.rsm_add');
	$('<div class="rsm_addCont clfix" id="career">'+
		'<div class="rsm_left">'+
			'<div class="rsm_date">'+
				'<input type="text" name="career['+careerCount+'][startYear]" placeholder="YYYY" maxlength="4" value="">'+
				'<span>.</span>'+
				'<input type="text" name="career['+careerCount+'][startMonth]" placeholder="MM" maxlength="2" value="">'+
				'<span class="dateHide">-</span>'+
				'<input type="text" class="dateHide" name="career['+careerCount+'][endYear]" placeholder="YYYY" maxlength="4" value="">'+
				'<span class="dateHide">.</span>'+
				'<input type="text" class="dateHide" name="career['+careerCount+'][endMonth]" placeholder="MM" maxlength="2" value="">'+
			'</div>'+
			'<p><label><input type="checkbox"><span></span>현재 재직중</label><input type="hidden" name="career['+careerCount+'][dateCheck]" value="false"></p>'+
		'</div><!-- //rsm_left -->'+
		'<div class="rsm_right">'+
			'<input type="text" class="tit" placeholder="회사명" name="career['+careerCount+'][companyName]" value="">'+
			'<input type="text" class="desc" placeholder="부서명/직책" name="career['+careerCount+'][companyPosition]" value="">'+
		'</div><!-- //rsm_right -->'+
		'<div class="rsm_delete"><i class="fas fa-times"></i></div>'+
	'</div><!-- //rsm_addCont -->').prependTo(target);
	careerCount++;
});


//현재 재직중 체크했을 때 
$(document).on('click','.rsm_left label', function(){
	var endYear = $(this).parent('p').siblings('.rsm_date').find('input[name=endYear]');
	var endMonth = $(this).parent('p').siblings('.rsm_date').find('input[name=endMonth]');
	var dateCheck = $(this).find('input[type="checkbox"]');
	var dateHide = $(this).parent('p').siblings('.rsm_date').find('.dateHide');
	if($(dateCheck).is(":checked")){
		endYear.val("").hide();
		endMonth.val("").hide();
		dateHide.hide();		
		$(this).next('input[type=hidden]').val('true');
	}else {
		endYear.show();
		endMonth.show();
		dateHide.show();
		$(this).next('input[type=hidden]').val('false');
	}
	
});





//추가 내용 삭제
$(document).on('click','.rsm_delete', function(){
	// $(this).parents('.rsm_addCont').remove();
var serializeObject = $('form[name=careerFrm]').serializeObject();

	console.log(serializeObject);

	var json_str = JSON.stringify(serializeObject); // Obejct를 json문법에 맞게 string 타입으로 변형    
    console.log("json_str" + json_str);
    var jsonObj = JSON.parse(json_str)
    for( var i in jsonObj.career ){
	    console.log(jsonObj.career[i].companyName)
    }
	var career = jsonObj;
    //결과 : '[{"name":"a","value":"1"},{"name":"b","value":"2"},{"name":"c","value":"3"},{"name":"d","value":"4"},{"name":"e","value":"5"}]' //string


   // var json_obj = JSON.parse(json_str); // json문법의 string을 배열의 Object형태로 변형
   // console.log(json_obj)                // 결과는 serializeObject와 같다.    //object
    

	//alert(json_str);
	
});






</script>
