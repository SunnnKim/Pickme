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
		<!--  <input type="hidden" name="profileName" value="${sessionScope.loginuser.seq}">-->
		<div class="aMypage_top clfix">
			<div class="profileWrap">
				<div class="profile">
					<i class="fas fa-user"></i>
					<div class="imgs-wrap" id="imgs-wrap">
					</div>					
				</div>
				<div class="filebox preview-image">					
						
					<div class="upload-display">
						<img src="/Pickme/a_mypage/imageDownload.do?filename=${dto.profileName }&filepath=${dto.profilePath }" class="upload-thumb" >
					</div>					
			       
					<label for="input_file"><i class="fas fa-camera"></i></label>
					<input type="file" id="input_file" name="profile" class="upload-hidden">
					<input type="hidden" class="upload-name" name="pv_profileName">
				</div>
			</div>
			<!-- //profileWrap -->
			<div class="aMyinfo">
				<h4>${sessionScope.loginuser.name}</h4>
				<p>${sessionScope.loginuser.email}</p>
				<p>
					<input type="text" name="phone" placeholder="연락처를 입력해주세요" maxlength="11" value="${dto.phone }" />
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
				<!-- <div class="aMyBtn"><a href="#none">비밀번호수정 / 탈퇴</a></div> -->
			</div>
		</div>
		<!-- // aMypage_top -->
		<div class="aMycont">
			<h5>간단 소개글</h5>
			<p>직무 내용, 경험, 목표 등을 추가해서 더욱 멋진 소개글을 작성해보세요.</p>
			<textarea name="introduce"><c:out value='${manager_name}'/> ${dto.introduce }</textarea>
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
 $(document).ready(function(){
	// 연락처 숫자만 입력
    $("input[name=phone]").keyup(function(event){
      	var inputVal = $(this).val();        
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));      	
 	});
	
	/*
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
                     alert("유효하지 않은 전화번호 입니다.");
                     $(this).val("");
                     $(this).focus();
                 }
             }
             else 
             {
                 alert("유효하지 않은 전화번호 입니다.");
                 $(this).val("");
                 $(this).focus();
             }
       }
   });  
	*/
     
   // 프로필 사진 등록
   var fileTarget = $('.filebox .upload-hidden');

   fileTarget.on('change', function () {
     if (window.FileReader) {
       // 파일명 추출
       var filename = $(this)[0].files[0].name;
     } else {
       // Old IE 파일명 추출
    //   var filename = $(this).val().split('/').pop().split('\\').pop();
     };

     $(this).siblings('.upload-name').val(filename);

   });

   //preview image
   var imgTarget = $('.preview-image .upload-hidden');

   imgTarget.on('change', function () {
     var parent = $(this).parent();
     parent.children('.upload-display').remove();

     if (window.FileReader) {
       //image 파일만
       if (!$(this)[0].files[0].type.match(/image\//)) {
         alert("이미지파일만 가능");
         return;
       }

       var reader = new FileReader();
       reader.onload = function (e) {
    	   var src = e.target.result;
        // if("${dto.profileName}" != ""){
           //  src = "/imageDownload.do?filename=${dto.profileName}&filepath=/upload/amember/";
        	 
         // }
         parent.prepend('<div class="upload-display"><img src="' + src + '" class="upload-thumb"></div>');
       };
       reader.readAsDataURL($(this)[0].files[0]);
     } else

     {
       $(this)[0].select();
       $(this)[0].blur();
       var imgSrc = document.selection.createRange().text;
       parent.prepend('<div class="upload-display"><img class="upload-thumb"></div>');

       var img = $(this).siblings('.upload-display').find('img');
       //img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
     }
   });
 });

	 // 직군 , 직무 선택
	 // 직무 카테고리
    var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
  
    var json;
    var jsonArr = [];


	// db에서 값 가져오기
    var jobstr = "${dto.job}";

    var jobuserArray = jobstr.split(',');
    var jobuser01 = jobuserArray[0]
    var jobuser02 = jobuserArray[1]

    console.log("job" + "${dto.job }");
	console.log("jobuser01" + jobuser01);
	console.log("jobuser02" + jobuser02);
	
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
          /* $('#userJob01 option').each(function(){
     	   if($(this).val()== jobuser01){	
     	     $(this).attr("selected","selected"); // attr적용안될경우 prop으로 	
     	   }	
     	  }); */
		
    });
    
      function changeOcc( onedepth ){
        var i=0;
        console.log("ondepth" + onedepth.value);
        $("#userJob02").html('');
        $("#userJob02").append("<option value='0'>2차분류</option>")
        for( arr of jsonArr ){
          // console.log(arr)
          for(key in arr){
              if( key.trim() == onedepth.value.trim() ){
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

	

 /* hashtag */
  $("#hashtag").keyup(function(e){if(e.keyCode == 13)
    if($(this).val().trim() !=""){
      tagappend();
    } else {
      alert("태그를 입력해주세요.");
    }
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
     alert("태그를 입력해주세요.");
   }
  // alert(element_count);
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


 	// 작성완료 버튼 눌렀을 때
  	$("#pSaveBtn").on("click",function(){
	 alert("클릭");
      //hash tag
  	var taglen = $("input[name='hashTag']").length;
  	var tags = new Array(taglen);

    for(var i=0; i < taglen;i++){
        tags[i] = $("input[name='hashTag']").eq(i).val();
  		console.log("tags:"+tags);
  	}
		//var jsondata = JSON.parse(tags);
		jsondata = JSON.stringify(tags)
  		console.log(jsondata)
	
	/*  
		String 데이터를 Json데이터로 바꾸는 방법
		jsondata = JSON.parse(jsondata)
	  	console.log( jsondata)
	*/    	


	var queryString = $("#form").serialize();

	// name value
	var seq = <%=member.getSeq() %>;
	var email = "<%=member.getEmail() %>";
	var phone = $("input[name=phone]").val();
	var profileName = $("input[name=profileName]").val();
	var profilePath = "/upload/amember/";
	var job = $("#userJob01 option:selected").text()+","+$("#userJob02 option:selected").text(); //직군, 직무;
	var career = $("select[name=career]").val();
	var introduce = $("textarea[name=introduce]").val();
	var hashtag = jsondata;

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
      enctype: 'multipart/form-data',
      success: function (data) { 
			alert('success');

			
			
			
	     }
        
    });

	

	/* 
  $.ajax({
	url:"profileUpdate.do",
	type:"post",
	datatype:'json',
	data:{'seq':seq,'email':email,'phone':phone,'profilePath':profilePath,'profileName':profileName,'job':job,'career':career,
		  'introduce':introduce, 'hashtag':hashtag},
	success: function(data){
		alert("success");
		
	},
	 error:function(request,status,error){
        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
       }

	});  */

		
  });

 </script>

<%@include file="../../../include/footer.jsp"%>
