<%@include file="../../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="aMypage-wrap">
	<%-- <img src="/Pickme/a_mypage/imageDownload.do?filename=${dto.profileName }&filepath=${dto.profilePath }" class="upload-thumb"> --%>
	<form id="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="${sessionScope.loginuser.seq}">
		<input type="hidden" name="email" value="${sessionScope.loginuser.email}">
		<input type="hidden" name="name" value="${sessionScope.loginuser.name}">
		<input type="hidden" name="profilePath" value="/upload/amember/">
		<input type="hidden" name="profileName" value="${dto.profileName }">
		<!--  <input type="hidden" name="profileName" value="${sessionScope.loginuser.seq}">-->
		<div class="aMypage_top clfix">
			<div class="profileWrap">
				<div class="profile">
					<i class="fas fa-user"></i>
					<div class="imgs-wrap" id="imgs-wrap">
					</div>					
				</div>
				<div class="filebox preview-image">					
					<label for="inputFile"><i class="fas fa-camera"></i></label>
					<input type='file' id="inputFile" name="profile">
	        		<img id="uploadThumb" src="/Pickme/a_mypage/imageDownload.do?filename=${dto.profileName }&filepath=${dto.profilePath }" >					
				</div>
			</div>
			<!-- //profileWrap -->
			<div class="aMyinfo">
				<h4>${sessionScope.loginuser.name}</h4>
				<p>${sessionScope.loginuser.email}</p>
				<p>
					<input type="text" name="phone" placeholder="연락처를 입력해주세요" maxlength="13" value="${dto.phone }" />
				</p>
				<ul>
					<li>
						<strong>직무</strong>
						<select class="select_cons" name="userJob01" id="userJob01" onchange="changeOcc(this)">
							<option value="0">1차분류</option>
						</select>
						<select class="select_cons ml10" name="userJob02" id="userJob02">
							<option value="0">2차분류</option>	
						</select>
					</li>
					<li>
					
						<strong>경력</strong>
						<select class="" name="career">
							<option value="신입">신입</option>
							<option value="1년">1년</option>
							<option value="2년">2년</option>
							<option value="3년">3년</option>
							<option value="4년">4년</option>
							<option value="5년">5년</option>
							<option value="6년">6년</option>
							<option value="7년">7년</option>
							<option value="8년">8년</option>
							<option value="9년">9년</option>
							<option value="10년">10년</option>
						</select>
					</li>
				</ul>
				<div class="aMyBtn <c:if test="${dto.open != 0}">on</c:if>"><i class="fa fa-check" aria-hidden="true"></i>프로필 공개<input type="hidden" name="open" value="${dto.open }"></div>
			</div>
		</div>
		<!-- // aMypage_top -->
		<div class="aMycont">
			<h5>간단 소개글</h5>
			<p>직무 내용, 경험, 목표 등을 추가해서 더욱 멋진 소개글을 작성해보세요.</p>
			<textarea name="introduce"><c:out value="${dto.introduce }" /></textarea>
			<h5 class="block">관심분야를 태그해주세요</h5>
			<div class="hashtagWrap">
				<input type="text" id="hashtag" placeholder="태그는 최대 3개까지 입력가능합니다.">
				<button type="button" id="hashadd" onclick="tagappend()">추가</button>				
			</div>
			<div class="inhash"></div>
			<button type="button" id="pSaveBtn">작성 완료</button>
		</div>
		<!-- // aMycont -->
	</form>
</div>
<!-- // aMypage-wrap -->

<script>

	// 연락처 숫자만 입력
   /*  $("input[name=phone]").keyup(function(event){
      	var inputVal = $(this).val();        
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));      	
 	}); */


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

 	// 프로필 이미지 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#uploadThumb').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#inputFile").change(function() {
    	$('img#uploadThumb').show();
        readURL(this);
    });    

    // 프로필 사진이 여부 확인
    $(function(){
	    var pfImg = "${dto.profileName }";
	    if(pfImg == "") {
	    	 $('img#uploadThumb').hide();
	    }
    });    
	

	// 직군 , 직무 선택
	// 직무 카테고리
    var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
  
    var json;
    var jsonArr = [];


	// 직군, 직무 db에서 값 가져오기
    var jobstr = "${dto.job}";

    var jobuserArray = jobstr.split(',');
    var jobuser01 = jobuserArray[0]
    var jobuser02 = jobuserArray[1]

    console.log("job" + "${dto.job }");
	console.log("직군: " + jobuser01);
	console.log("직무: " + jobuser02);
	
    $.getJSON(json_url, function(data){
        for( var i in data){
          json = JSON.stringify(data[i])
          json = JSON.parse(json);
          jsonArr.push(json)
          for( key in json ){
           // console.log(key);
            $("#userJob01").append("<option value='"+key+"'>"+key+"</option>");
            // console.log("key:"+key+", value:"+json[key]);
            keyArr.push(key);
            valArr.push(json[key]);
          } 
        }


	   
        // selected 되어있을 때 2차 분류 뿌리기   
       	$('#userJob01 option').each(function(){
       	   if($(this).val()== jobuser01){	
       	     $(this).attr("selected","selected"); // attr적용안될경우 prop으로 	
       	   }	
       	});
       	
       	if($("#userJob01 option:selected").val() != '0' ) {	
        	$("#userJob02").append("<option value='"+jobuser02+"' selected>"+jobuser02+"</option>");
       	}
        var i = 0;
        for( arr of jsonArr ){
            // console.log(arr)
            for(key in arr){
                if( key.trim() == jobuser01.trim()){
                  for( i = 0; i < arr[key].length; i++ ){
                    $("#userJob02").append("<option value='"+arr[key][i]+"'>"+arr[key][i]+"</option>");
                  }
                 
                }
            }
          }      
        
       	  // alert(jobuser01);
       	  // alert(jobuser02);
       
       
    });   

    
      function changeOcc( onedepth ){
        var i=0;
        //console.log("ondepth" + onedepth.value);
        $("#userJob02").html('');
        //$("#userJob02").append("<option value='0'>2차분류</option>")
        for( arr of jsonArr ){
          // console.log(arr)
          for(key in arr){
              if( key.trim() == onedepth.value.trim()){
                for( i = 0; i < arr[key].length; i++ ){
                  $("#userJob02").append("<option value='"+arr[key][i]+"'>"+arr[key][i]+"</option>");
                }
               
              }
          }
        }        
        
      }
  	 

 	// 경력 선택
	$('select[name=career] option').each(function(){
	   if($(this).val()=="${dto.career}"){	
	     $(this).attr("selected","selected"); // attr적용안될경우 prop으로 	
	   }	
	});




   
  


   const intervalCall1000 = intervalCall(1000)
	/* hashtag */
	 $("#hashtag").keyup(function(e){ 
		 if(e.keyCode == 13){
			// 인터벌 함수 실행 
			 intervalCall1000(() => {
			 	// 태그삽입
			   if($(this).val().trim() !=""){
			     tagappend();
			   } else {
			 	// 태그 미입력시
			     // alert("태그를 입력해주세요.");
			     Swal.fire({
					  icon: 'error',
					  text: '태그를 입력해주세요'
				 });
			   }
		    })
		}

	 });
   // enter 중복클릭 방지
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

  	// db에 있는 hashtag append시키기 
	$(function(){		

		// db에서 값 가져오기
	    var hashstr = "${dto.hashtag}";

	    var hashdbArray = hashstr.split(',');

	  

	    var hashdb01 = hashdbArray[0]
	    var hashdb02 = hashdbArray[1]
	    var hashdb03 = hashdbArray[2]
		   
		 var hstr01 = "<span><button type='button' class='hashbtn mr8' name='hashtag'>#"+hashdb01+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb01+"'></span>";
		 var hstr02 = "<span><button type='button' class='hashbtn mr8' name='hashtag'>#"+hashdb02+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb02+"'></span>";
		 var hstr03 = "<span><button type='button' class='hashbtn mr8' name='hashtag'>#"+hashdb03+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb03+"'></span>";
		 if(hashdb01 != "" && typeof hashdb01 != "undefined"){			
	   	    $(".inhash").append(hstr01);
		     element_count++;
		     hashTagCount();
		  }
		  if(hashdb02 != "" && typeof hashdb02 != "undefined"){
				$(".inhash").append(hstr02);
			  element_count++;
			  hashTagCount();
		  }
		  if(hashdb03 != "" && typeof hashdb03 != "undefined"){
			  $(".inhash").append(hstr03);
			  element_count++;
			  hashTagCount();
		  }
		  		  		  		
		 //alert("끝")
		
	});
  	

  //hashtag append
  var element_count = document.getElementsByTagName('hashtag').length;
  function tagappend(){
   var hashtext = document.getElementById('hashtag').value;
   const str = "<span><button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashtext+"'></span>";
   if(hashtext.trim() != ""){
    $(".inhash").append(str);

	    document.getElementById('hashtag').value="";
	    element_count++;
	    hashTagCount();

   } else {
     // alert("태그를 입력해주세요.");
	 Swal.fire({
		  icon: 'error',
		  text: '태그를 입력해주세요'
	 });
   }
 	//alert(element_count);
  }

  function remove( element ){
    //element.parentNode.parentNode.removeChild(element.parentNode);
    element_count--;
    hashTagCount();
    //alert(element_count);

  };

 $('.inhash').on('click', 'i', function() {
    $(this).parent('button').parent('span').remove();
 });

  function hashTagCount(){
    if(element_count >= 3){
       $("#hashtag").attr("readonly","readonly");
       $("#hashadd").attr("disabled",true);
    }else {
      $("#hashtag").removeAttr("readonly");
      $("#hashadd").attr("disabled",false);
    }
  }

// 프로필 공개 여부 체크

$('.aMyBtn').click(function(){
	$(this).toggleClass('on');
	if($(this).hasClass("on") === true) {
		$('input[name=open]').val(1);
	}else {
		$('input[name=open]').val(0);
	}

});

// 작성완료 버튼 눌렀을 때
$("#pSaveBtn").on("click",function(){
	 //alert("클릭");
     //hash tag
  	var taglen = $("input[name='hashTag']").length;
  	var tags = new Array(taglen);
  	tags[0] = "";
  	tags[1] = "";
  	tags[2] = "";

    for(var i=0; i < taglen;i++){
        tags[i] = $("input[name='hashTag']").eq(i).val();
  		console.log("tags:"+tags);
  	}
		//var jsondata = JSON.parse(tags);
		/* jsondata = JSON.stringify(tags)
  		console.log(jsondata) */

  		console.log("첫번째태그" + tags[0]);
  		console.log("두번째태그" + tags[1]);
  		console.log("세번째태그" + tags[2]);
	/*  
		String 데이터를 Json데이터로 바꾸는 방법
		jsondata = JSON.parse(jsondata)
	  	console.log( jsondata)
	*/    	

	/*
	var queryString = $("#form").serialize();
  	*/

  	/* hashtag 가져오기 */
	
	
	var seq = <%=member.getSeq() %>;
	var email = "<%=member.getEmail() %>";
	var phone = $("input[name=phone]").val();
	var profileName = $("input[name=profileName]").val();
	var profilePath = "/upload/amember/";
	var job = $("#userJob01 option:selected").text()+","+$("#userJob02 option:selected").text(); //직군, 직무;
	var career = $("select[name=career]").val();
	var introduce = $("textarea[name=introduce]").val();
	var hashtag = tags[0] + "," + tags[1] + "," + tags[2];

	console.log({
		'seq':seq, 'email':email, 'phone':phone,'profilePath':profilePath, 'profileName':profileName,'job':job,'career':career,
		'introduce':introduce, 'hashtag':hashtag
	});
	
	
	var frmTag = document.getElementById("form");
	var input1 = document.createElement('input');
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "job");
	input1.setAttribute("value", job);
	frmTag.appendChild(input1);

	var input2 = document.createElement('input');
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "hashtag");
	input2.setAttribute("value", hashtag);
	frmTag.appendChild(input2);

	//$('#form').attr("action", "profileUpdate.do").submit();
	
	 var form = $('#form')[0];
     var formData = new FormData(form);

   		
	//let data = new FormData;
	//console.log()
	var getFile = $('input[name=profile]')[0].files[0]
	formData.append("file", getFile);
	//console.log(data)
    $.ajax({
      data: formData,
      type: 'POST',
      url: "profileUpdate.do",
      cache: false,
      contentType: false,
      processData: false,
      async : false,
      enctype: 'multipart/form-data',
      success: function (data) { 
			//alert('success');
			Swal.fire({
				  icon: 'success',
				  title: '프로필 작성이 완료됐습니다',
				  timer: 1500
			}).then(function(result){
				location.href="profile.do";
			});
			
	     }
        
    });
		
  });

 </script>

<%@include file="../../../include/footer.jsp"%>
