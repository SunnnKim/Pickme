<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	CMemberDto dto = (CMemberDto) request.getAttribute("dto");
	String addressArr = request.getParameter("addressArr");
%>



<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script>
  
<style>
/* 컬럼 이름 */
div p.column {font-size : 13pt;}

/* 별표 */
div label.star {font-size : 14pt;}

/* 컬럼 설명 */
div.input-box p.column label.message {color: #757474;font-size: 10pt;}

/* input text */
div input[type=text] {padding-left : 20px;margin-top : 5px;border: 1px solid rgb(176, 176, 176);width : 100%;height : 40px;font-size : 13pt;}

/* input password */
div.input-box input[type=password] {
  padding-left: 20px;
  margin-top:5px;
  border: 1px solid rgb(176, 176, 176);
  width : 100%;
  height : 40px;
  font-size: 13pt;
  background-color:#fff
}

/* 기업 소개 텍스트 에디터 영역 */
div.input-box div.textarea {
  margin-top: 7px;
}

/* 기업 기본주소 텍스트 필드 */
div.input-box input.address_basic {
  padding-left : 20px;
  border : 1px solid rgb(176, 176, 176);
  font-size : 13pt;
  width : 723px;
  height : 40px;
}

/* 기업 상세주소 텍스트 필드 */
div.input-box input.address_specific {
  padding-left : 20px;
  border : 1px solid rgb(176, 176, 176);
  font-size : 13pt;
  width : 100%;
  height : 40px;
}

/* 기업 우편번호 */
div.input-box input.address_zipcode {
	width:200px;
}

/* 주소찾기 버튼 */
div.input-box input.btn {
  margin-top:4px;
  margin-right:20px;
  width:100px;
  height:40px;
  color: #fff;
  background-color: #4f6eff;
  border: 0;
}

/* select 메뉴 */
div select { 
    font-size: 11pt;
    width: 100%;
    height : 45px;
    padding: .8em .5em;
    padding-left: 20px;
    margin-top: 5px;
    border: 1px solid rgb(176, 176, 176);
    font-family: inherit;
    text-align: center;
    background: url('../images/sub/arrow.jpg') no-repeat 95% 50%;
    border-radius: 0px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
div select::-ms-expand {
    display: none;
}


/* 완료 버튼 */
div div.update-btn button {
  width : 80px;
  height : 40px;
  background-color: #4f6eff;
  color: #fff;
}

/* 사진 영역 1 */
div.input-box div.img1 {
  border : 1px solid rgb(186, 186, 186);
  text-align: center;
  width : 870px;
  height : 500px;
  margin-top:30px;
}


/* 사진 영역 2 */
div.input-box div.img2 {
  border : 1px solid rgb(186, 186, 186);
  text-align:center;
  width : 870px;
  height : 500px;
  margin-top:30px;
}

/* 사진 영역 3 */
div.input-box div.img3 {
  border : 1px solid rgb(186, 186, 186);
  text-align: center;
  width : 870px;
  height : 500px;
  margin-top:30px;
}


div.input-box div.img1 img {
  width : auto;
  height : auto;
  overflow : hidden;
}

.c-fileBtn {margin-top:15px;}
.c-fileBtn input {display:block; float:left; width:33.3333%;}

div.input-box div.c-gallery {
	width:100%;
	margin-top:40px;
	margin-bottom:50px;
}



div.c-gallery img {
  display:block;
  width:330px;
  height:330px;
  float:left;
  margin-left:30px;
}

div.c-gallery img:first-child {
	margin-left:0;
}

/* 로고 영역 버튼 테두리 숨기기 */
div div.logo-img input.btTextW {
  border : 1px solid #ffffff;
 }

/* 로고 영역 */
  .input-box{
    margin-bottom: 50px;
  }
  .update-logo{
    height: 130px;
    width: 100%; 
    margin-bottom: 120px;
  }
  .update-logo .logo-text{
    width: 400px;
    float: left; 
    margin-top: 50px;
  }

  /* .update-logo .logo-img {
    line-height: 150px; 
    text-align: center; 
    border: 1px solid #eaeaea; 
    margin-top: 10px; 
    margin-right: 30px; 
    float: right; 
    width: 150px; 
    height: 150px;
    overflow: hidden; 
    border-radius: 80px;
  }

  .update-logo .logo-img img{
    overflow : hidden;
    display : flex;
    align-items: center;
    justify-content : center;
  } */

  
  div.input-box p.column button.btn {
    border: 1px solid rgb(176, 176, 176);
    padding : 7px 7px 7px 7px;
  }
  
  #password_incorrect {
    font-size: 11pt;
    padding-left:40px;
    color: #fff;
  }

  #password_inconsistency {
    font-size: 11pt;
    padding-left:40px;
    color:#fff;
  }

  #hashTagField {
    margin-right: 20px;
  }

  #hashUl {
    overflow:auto;
  }

  #hashUl>li {
    float:left;
    margin-left: 20px;
    margin-top: 20px;
    background-color: #4f6eff;
    color: #fff;
    border : 12px solid #4f6eff;
    border-radius: 5px 5px 5px 5px;
  }
  
  /* `` */
  
</style>    

<form action = "update.do" method = "post" id = "frm" name = "frm" enctype = "multipart/form-data">
<input type="hidden" name="seq" value="${dto.seq}"/>

<!-- 로고 이미지 경로 호출 -->
<input type="hidden" name="logoPath" value="/upload/c_mypage/">
<input type="hidden" name="logoName" value="${dto.logoName }">
		
		
		          
        <div class="update-logo">
          <div class="logo-text">
            <span class = "intro_message">
              <p style="font-size: 19pt;">회사 정보를 수정하거나 등록해주세요.</p>
              <p style="font-size: 11pt;"> 
                <label class = "star" style="color:#ff0000"> * </label> 
                표시된 정보는 일반회원, 기업회원 모두 열람이 가능합니다.
              <p>
            </span>
          </div>



			<div class="profileWrap">
				<div class="profile">
					<i class="fas fa-user"></i>
					<div class="imgs-wrap" id="imgs-wrap"></div>
				</div>
				<div class="filebox preview-image">
					<label for="inputFile"><i class="fas fa-camera"></i></label> 
					<input type="file" name ="logoImg" id="inputFile"> 
					<!-- <input type="hidden" class="upload-name" name="_profileName"> -->
					<img id="uploadThumb" src="/Pickme/c_mypage/imageDownload.do?filename=${dto.logoName }&filepath=${dto.logoPath }" >
				</div>
			</div>


			<!-- <div class="logo-img">
              <input type = "button" class = "btTextW" value = "로고" onclick = document.all.file.click();>
              <input type = "file" name = "file" id = "file" style = "display: none;" accept="image/*"/>
            </div> -->
        </div>

        <div class="input-box clfix">
          <p class = "column"> 이메일 
            <label class = "star" style = "color:#ff0000"> * </label> 
          </p>
          <input type = "text" value = "${dto.email}" style = "background: #f4f4f4;border: none;"readonly>
        </div>
       
        <div class="input-box">
          <p class = "column"> 기업명
          <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <input type = "text"  value = "${dto.name }" style = "background: #f4f4f4;border: none;" readonly>
        </div>

        <div class = "input-box">
          <p class = "column"> 대표자명 
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <input type = "text" name = "president" id = "president" value = "${dto.president }">
        </div>

        <div class="input-box">
          <p class = "column"> 기업 분야 
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <select id = "c_department" name = "department" sel = "${dto.department }">
            <option value="none"> 기업 분야를 선택해주세요 </option>
          </select>
        </div>
       
        <div class="input-box">
          <p class = "column"> 기업 형태
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <select id = "typeid" name = "type" sel = "${dto.type }">
            <option value="none"> 기업 형태를 선택해주세요 </option>
          </select>
        </div>

        <div class="input-box">
          <p class = "column"> 기업 주소 
            <label class = "star" style="color:#ff0000"> * </label> &nbsp;&nbsp;&nbsp;&nbsp; 
          </p>
          
          	<input type = "button" class = "btn" onclick="sample6_execDaumPostcode()" value="주소찾기">
          	
            <!-- 우편번호 -->
            <input type= "text" value = "${realArr2 }" class = "address_zipcode" id="sample6_postcode" placeholder="우편번호">
            
            <!-- 기본주소 -->
            <input type = "text" value = "${arr2 }" class = "address_basic" id="sample6_address" placeholder="기본주소">
            	<input type="hidden" name="address"><!-- 이 부분은 우편번호'기본주소'상세주소 이런식으로 들어가도록 스크립트에서 작업 -->
            	<br>
            <!-- 참고항목 -->
            <input type = "hidden" class = "address_reference" id="sample6_extraAddress">
            
            <!-- 상세주소 -->
            <input type = "text" value = "${arr3 }" class = "address_specific" placeholder="상세주소를 입력해주세요." id="sample6_detailAddress">
        
        </div>
        
        <div class="input-box">
          <p class = "column"> 사업자 등록 번호 </p> 
          <input type = "text" id="number" name="number" value="${dto.number }" style = "background: #f4f4f4;border: none;" readonly>
        </div>
        <div class="input-box">
          <p class = "column"> 대표 연락처 <label class = "star" style="color: #ff0000;"> * </label> <label class = "message"> '-' 포함하여 숫자 10~11자로 입력해주세요. 예) 010-1234-5678 </label></p>
          <input type = "text" id="tel" name = "tel" value="${dto.tel }" maxlength="13">
        </div>
		
		
        <div class="input-box">
          <p class = "column"> 해시태그 
            <label class = "star" style = "color: #ff0000;"> * </label> 
            <label class = "message"> 한글, 영문, 숫자만 가능하며, 엔터 입력시 등록됩니다. </label>
          </p>
          <input type="text" id="hashtag" placeholder="최대 3개까지 입력가능">
          <div class="inhash"></div>
        </div>
       <!-- <input type = "text" id = "hashId" class = "hashId" placeholder="해시태그는 최대 3개까지 등록 가능합니다."/>
            <input type = "hidden" id = "hash1">
            <input type= "hidden" id = "hash2">
            <input type=  "hidden" id = "hash3">
            <input type="hidden"  id = "hashT" name = "hashTag" value = ${dto.hashTag }>
              <ul id = "hashUl"></ul>
        	-->
        	
        	<style>
        		.hashbtn1 {margin-left: 20px;margin-top: 20px;background-color: #4f6eff;color: #fff;border : 12px solid #4f6eff;border-radius: 5px 5px 5px 5px;}
        		.hashbtn1 i{margin-left:5px;}
        	</style>
        	
        	<!-- 해시태그 테스트 -->
        
        <div class="hashtagWrap">
				
			   <!-- <button type="button" id="hashadd" onclick="tagappend()">추가</button> -->				
		</div>
			
        	
        	<script type="text/javascript">
        	
		// db에서 값 가져오기
		   var hashstr = '${dto.hashTag}';

		   var hashdbArray = hashstr.split(',');
		   var hashdb01 = hashdbArray[0]
		   var hashdb02 = hashdbArray[1]
		   var hashdb03 = hashdbArray[2]

		   /*
		   hashdb01.replace('','undefined'); 
		   hashdb02.replace('','undefined'); 
		   hashdb03.replace('','undefined'); 
		   */
		   
		   console.log("hashstr = " + '${dto.hashTag}');

		   console.log("해쉬태그1: " + hashdb01);
		   console.log("해쉬태그2: " + hashdb02);
		   console.log("해쉬태그3: " + hashdb03);


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
				 var hstr01 = "<span><button type='button' class='hashbtn1 mr8' name='hashtag'>#"+hashdb01+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb01+"'></span>";
				 var hstr02 = "<span><button type='button' class='hashbtn1 mr8' name='hashtag'>#"+hashdb02+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb02+"'></span>";
				 var hstr03 = "<span><button type='button' class='hashbtn1 mr8' name='hashtag'>#"+hashdb03+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashdb03+"'></span>";
				 
				  
				 if(hashdb01 != undefined && hashdb01 != ''){			
			   	    $(".inhash").append(hstr01);
				     element_count++;
				     hashTagCount();
				  }
				  if(hashdb02 != undefined){
					  $(".inhash").append(hstr02);
					  element_count++;
					  hashTagCount();
				  }
				  if(hashdb03 != undefined){
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
		   const str = "<span><button type='button' class='hashbtn1' name='hashtag' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button><input type='hidden' name='hashTag' value='"+hashtext+"'></span>";
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
		</script>
        
        

        <div class="input-box" style="margin-top:20px;">
          <p class = "column"> 기업 소개 
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 기업에 대해 자유롭게 소개해주세요. </label>
          </p>
            <div class = "textarea">
              <textarea name="introduce" cols="30" rows="30" id="introduce">
              ${dto.introduce }
              </textarea>
              <script>  CKEDITOR.replace('introduce', {  width : 1047,   height : 330, });</script>
            </div>
        </div>
 </form>
 
 
	<style>
		.column_images{font-size : 13pt;}
		.company_image_container{margin-top:5px;}
		.company_image_container img{display:block;width:350px;height:330px;float:left;}
	</style>
 
 
 
 
 
 <form id="fileform" method="post" action="uploadImage.do" enctype="multipart/form-data">
        <div class="input-box">
          <p class = "column"> 기업 이미지 
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 3장만 등록 가능하며, 해당 이미지를 클릭하면 삭제됩니다. </label>
          </p>

	          <div class="cmypage-fileWrap clfix">
	           	 <div class="c-fileBtn clfix">
	             	<input type = "file" class="photo-add" id = "image1" name="originfile" accept=".jpg, .png">
	             	<input type = "file" class="photo-add" id = "image2" name="originfile" accept=".jpg, .png">
	             	<input type = "file" class="photo-add" id = "image3" name="originfile" accept=".jpg, .png">
	             </div>
	             <!-- 이미지 추가되는 영역 -->
	            <div class = "c-gallery clfix" style="width:1052px; height:332px;border:1px solid rgb(176, 176, 176)">
	            
	            </div>
	            
	          </div>
	             <!-- 기존 이미지 영역 -->
	            <c:if test="${not empty fileslist }">
		            <p class = "column_images"> 기존 이미지 </p>
		            <div class="company_image_container" style="width:1052px;height:332px;border:1px solid rgb(176,176,176)">
		            		<c:forEach var = "dto" items="${fileslist }" varStatus="rs">
		            			<img src = "imageDownload.do?filename=${dto.newname }&filepath=/upload/c_mypage/">
		            		</c:forEach>
	 	            </div>
	            </c:if>
   		</div>
</form>

        <!-- <div style = "margin-top: 100px;">
        </div> -->

        <div class="update-btn" style = "text-align:center">
            <button type = "button" id = "completeBtn" onclick = "updateComplete()"> 완료 </button>
        		<!-- <button onclick = "sunny()"> 확인 </button> -->
        </div>
  
     
<!------------------------------------ 본문 영역 끝 --------------------------------------------->



<!--==================================== 스크립트 영역 ========================================-->


<!---------------- 기업분야, 기업형태 선택 ------------------>
<script>

$(document).ready(function () {
	var temp1 = $("select#c_department").attr("sel");
	$('select#c_department option[value="'+temp1+'"]').attr('selected', 'selected');

	var temp2 = $("select#typeid").attr("sel");
	$('select#typeid option[value="'+temp2+'"]').attr('selected', 'selected');
})
</script>



<!---------------- 로고 등록 -------------------->
<script>
var fileTarget = $('.filebox .upload-hidden');

fileTarget.on('change', function () {
  if (window.FileReader) {
    // 파일명 추출
    var filename = $(this)[0].files[0].name;
  } else {
    // Old IE 파일명 추출
    var filename = $(this).val().split('/').pop().split('\\').pop();
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
    img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
  }
});
</script>


<!--------------------- 유효성 검사 + 수정완료 처리 ---------------------------->
<script>

//hash tag
var taglen = $("input[name='hashTag']").length;
var tags = new Array(taglen);

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

	
// 정보 유효성 검사

var presidentCheck = false;		// 대표자명
var departmentCheck = false;	// 기업분야
var typeCheck = false;			// 기업규모
var telCheck = false;			// 연락처

var addressCheck = false;		// 주소
var hashTagCheck = false;		// 해시태그
var introduceCheck = false;		// 소개

// input 값
var president = document.querySelector("#president");		// 대표자명
var department = document.querySelector("#c_department");	// 기업분야
var type = document.querySelector("#typeid");				// 규모
var tel = document.querySelector("#tel");					// 연락처
	
var address = document.querySelector("#address");			// 주소
var hashTag = document.querySelector("#hashId");				// 해시태그
var introduce = document.querySelector("#introduce");		// 소개

document.addEventListener("DOMContentLoaded", function() {

	


		
		// 1. 대표자명
		var korRegPresident = /^[가-힣]*$/;				// 한글 정규식
		var engRegPresident = /^[a-zA-Z]*$/;				// 영어 정규식
		var beforePresident = $("#president").val();
		console.log("페이지 열릴 때 대표자명 = " + beforePresident);

		if( beforePresident != null || beforePresident != "") {
			presidentCheck = true;
		}
		
		/*
		if( president.onfocusout = () => {
			var presidentValue = $("#president").val();
			console.log("클릭 후 대표자명 = " + presidentValue);

				if( presidentValue == "" ) {
					presidentCheck = false;
				} else if ( korRegPresident.test(president.value) || engRegPresident.test(president.value) ) {
					presidentCheck = true;
				} else {
					Swal.fire({
	        			position: 'center',
	        			icon: 'error',
	        			title: '이름이 적합하지 않습니다!',
	        			showConfirmButton: false,
	        			timer: 3000
	        		}).then ( (result) => {
	        			presidentCheck = false;
	        		})
				}
			});
		*/
		
		$(president).focusout(function (){
			var presidentValue = $("#president").val();
			console.log("클릭 후 대표자명 = " + presidentValue);

				if( presidentValue == "" ) {
					presidentCheck = false;
				} else if ( korRegPresident.test(president.value) || engRegPresident.test(president.value) ) {
					presidentCheck = true;
				} else {
					Swal.fire({
	        			position: 'center',
	        			icon: 'error',
	        			title: '이름이 적합하지 않습니다!',
	        			showConfirmButton: false,
	        			timer: 3000
	        		}).then ( (result) => {
	        			presidentCheck = false;
	        		})
			}
		});
		
		// 2. 분야
		if(department.onchange = () => {
			if( department.value == 'none' ) {
				Swal.fire({
        			position: 'center',
        			icon: 'error',
        			title: '기업분야를 선택해주세요!',
        			showConfirmButton: false,
        			timer: 3000
        		}).then ( (result) => {
            		$("#c_department").focus();
        			departmentCheck = false;
        		})
			} else {
				departmentCheck = true;
			}
		});

		// 3. 형태
		if(type.onchange = () => {
			if( type.value == 'none' ) {
				Swal.fire({
        			position: 'center',
        			icon: 'error',
        			title: '기업형태를 선택해주세요!',
        			showConfirmButton: false,
        			timer: 3000
        		}).then ( (result) => {
        			typeCheck = false;
        		})
			} else {
				typeCheck = true;
			}
		});


		// 4. 대표연락처
		var regTel = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		var beforeTelValue = $("#tel").val();
		
		if( beforeTelValue != null || beforeTelValue != "" ) { 
			console.log("페이지 열릴 때 연락처 = " + beforeTelValue);
			telCheck = true;
		}
		
		if( tel.onfocusout = () => {
			var telValue = $("#tel").val();
			console.log("클릭 후 연락처 = " + telValue);
			
			if( telValue == "" ) {
				telCheck = false;
			} else if ( regTel.test(tel.value) ) {
				telCheck = true;
			} else {
				Swal.fire({
        			position: 'center',
        			icon: 'error',
        			title: '연락처 형식이 올바르지 않습니다!',
        			text: '하이픈을 포함하여 10~11자의 숫자로 입력해주세요.',
        			showConfirmButton: false,
        			timer: 3000
        		}).then ( (result) => {
        			telCheck = false;
        		})
			}
		});
		



});
</script>



<script>
function CKupdate(){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
}

//============================= 완료 submit ===========================================//
function updateComplete() {
	CKupdate();

	var presidentVal = $("#president").val();
	var typeVal = $("#typeid").val();
	var departmentVal = $("#c_department").val();
	var telVal = $("#tel").val();


	// 대표자명 검사
	var korRegPresident1 = /^[가-힣]*$/;				// 한글 정규식
	var engRegPresident1 = /^[a-zA-Z]*$/;
	if(korRegPresident1.test(presidentVal) && engRegPresident1.test(presidentVal)) {
		presidentCheck = true;
	}

	// 기업 규모 검사
	if(typeVal != 'none') {
		typeCheck = true;
	}

	// 기업 분야 검사
	if(departmentVal != 'none') {
		departmentCheck = true;
	}

	// 전화번호 검사
	var telReg1 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(telReg1.test(telVal)) {
		telVal = true;
	}

	
	// 주소 합치기 !
   var addressStr = '';
   addressStr += "[" + $('#sample6_postcode').val() + "]'";      // 우편번호
   addressStr += $('#sample6_address').val() + "'";         // 기본주소
   if($('#sample6_detailAddress').val() == "") {
      addressStr += " ";       // 상세주소
   } else {
      addressStr += $('#sample6_detailAddress').val();       // 상세주소
   }
      $('input[name=address]').val(addressStr);
/* 
   alert(addressStr); */
   console.log(addressStr);

	
	// 대표자명 잘못 입력
	if( presidentCheck == false ) {
		president.focus();
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '대표자명을 다시 한 번 확인해주세요',
			showConfirmButton: false,
			timer: 3000
		}).then ( (result) => {
			return;
		})
	}
	
	// 기업형태 잘못 선택
	if( typeCheck == false ) {
		type.focus();
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '기업형태를 다시 한 번 확인해주세요',
			showConfirmButton: false,
			timer: 3000
		}).then ( (result) => {
			return;
		})
	}

	
	// 기업분야 잘못 선택
	if( departmentCheck == false ) {
		department.focus();
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '기업분야를 다시 한 번 확인해주세요',
			showConfirmButton: false,
			timer: 3000
		}).then ( (result) => {
			return;
		})
	}
	
	// 연락처 잘못 입력
	if( telCheck == false ) {
		tel.focus();
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '연락처를 다시 한 번 확인해주세요',
			showConfirmButton: false,
			timer: 3000
		}).then ( (result) => {
			return;
		})
	}
	//
	
	
	/*
	// 해쉬태그 합치기
	var hashTag = new Array();
	// <input type= "hidden" name = "hashTag" id = "hashT">
	console.log("hashVal: "+$('#hashT').val());

	// name = hashTag 의 값을 json 으로 변환
	var receivedArray =  new Array()
	if( $('#hashT').val() != "") {
			receivedArray = JSON.parse($('#hashT').val());
	};
	console.log("receivedArray: " +receivedArray.length); // 길이 체크
	
	for( var i=1; i <= 3; i++){
		if( $('#hash'+i).val() != "" ){
			receivedArray[i-1] = $('#hash'+i).val();
			// hash1 = receivedArray[0]
			// hash2 = receivedArray[1]
			// hash3 = receivedArray[2]
		}
	}
	console.log("receivedArray: "+receivedArray);
	console.log("receivedArray type: "+typeof(receivedArray));
	for(var i=0; i < 3; i++){
		if(hashTag[i] == '' && receivedArray[i] != hashTag[i]) {
			hashTag[i] = receivedArray[i];
			// hashTag[0] = receivedArray[0]
			// hashTag[1] = receivedArray[1]
			// hashTag[2] = receivedArray[2]
		}
	}
	// receivedArray 를 String 으로 변환
	json = JSON.stringify(receivedArray);
	console.log(json);
	alert("json : " + json);
	// hash tag -> string
    //var jsondata = JSON.parse(tags);
   	jsondata = JSON.stringify(hashTag);
//  console.log( jsondata)

	// input 에 변환한 배열 데이터를 넣기
	$('input[name=hashTag]').val(json);
	console.log("jsondata: "+jsondata);
	*/

	// submit
	/* 
	Swal.fire({
		position: 'center',
		icon: 'success',
		title: '성공적으로 수정되었습니다!',
		showConfirmButton: false,
		timer: 1500
	}).then ( (result) => {
		document.querySelector('#frm').submit();
	})
	 */
	 

	 	
	 	
	 	var image1Upload = $("#image1").val();
 		var image2Upload = $("#image2").val();
 		var image3Upload = $("#image3").val();

 		var imageUploadCheck = false;


 		// 이미지 3개 모두 업로드 하거나
	 	if(image1Upload != '' && image2Upload != '' && image3Upload != '') {
	 		imageUploadCheck = true;
		 }

 		// 이미지를 단 1장도 업로드 하지 않거나
		if(image1Upload == '' && image2Upload == '' && image3Upload == '') {
			imageUploadCheck = true;
		 }

		// 이미지 업로드 에러
		if( imageUploadCheck == false ) {
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '이미지는 3장을 업로드 해야 합니다.',
				showConfirmButton: false,
				timer: 3000
			}).then ( (result) => {
				return;
			})
		}
	 	
		 var hashtagVar = tags[0] + "," + tags[1] + "," + tags[2];
		 var form = $('#frm')[0];
	     var formData = new FormData(form);

	     var frmTag = document.getElementById("frm");

	 	 var input2 = document.createElement('input');
	 	 input2.setAttribute("type", "hidden");
	 	 input2.setAttribute("name", "hashTag");
	 	 input2.setAttribute("value", hashtagVar);
	 	 frmTag.appendChild(input2);

		var getFile = $('input[name=logoImg]')[0].files[0];
		var originName = $("#input[name=originname]").val();	//

		//alert("getFile 값 :" + getFile);
		formData.append("file", getFile);



		   // Ajax
	if(imageUploadCheck == true && presidentCheck == true && typeCheck == true && departmentCheck == true && telCheck== true) {
			   
		$.ajax({
			data 		: formData,
			type 		: 'POST',
			url			: "update.do",
			cache		: false,
		    contentType	: false,
		    processData	: false,
		    async 		: false,
		    enctype		: 'multipart/form-data',
		    success		: function (data) { 
			    	Swal.fire({
			    		position: 'center',
			    		icon: 'success',
			    		title: '성공적으로 수정되었습니다!',
			    		showConfirmButton: true,
			    		timer: 1500
			    	}).then(function(result){
			    		$("#fileform").submit();
					});
		    }, 
		    error : function(request,status,error){ 
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}

		})

		
	}	
}

// 로고 이미지 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#uploadThumb').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

// 로고 바뀌면 썸네일 띄움
$("#inputFile").change(function() {
	$('img#uploadThumb').show();
    readURL(this);
});    

// 로고 이미지 있는지 여부 확인
$(function(){
    var pfImg = "${dto.logoName }";
    if(pfImg == "") {
    	 $('img#uploadThumb').hide();
    }
});    

</script>

<!----------------------- 해시태그 -------------------------->

<!-- 
<script>
   // 해시태그 추가

   var index = 0;
   $("#hashId").keypress(function(event) {
	   if(event.which == 13) {
       // 태그 개수

       var count = $("ul#hashUl li").length;

       // 해시태그 내용
       var hashtag = $("#hashId").val();
       var hiddenHashtag1 = $("#hash1").val();
       var hiddenHashtag2 = $("#hash2").val();
       var hiddenHashtag3 = $("#hash3").val();
       
       // 해시태그 유효성 (한글, 영어, 숫자만 허용)
       var hashtagCheck = /^[가-힣a-zA-Z0-9]*$/;

       // 태그는 3개까지 허용하며, 빈 칸인 경우 추가하지 않는다.
       if (count < 3 && hashtag != '') {
           if(hashtagCheck.test(hashtag)) {
		   	  // 추가 성공
        	  $("#hashUl").append("<li>" + "#" + hashtag + "</li>");

		   	  console.log("hiddenHashtag1: " + hiddenHashtag1)
				
        	  if(hiddenHashtag1 == '') {
        	  	$("#hash1").val( $("#hashId").val() );
			  } else if(hiddenHashtag2 == '') {
				$("#hash2").val( $("#hashId").val() );
			  } else if(hiddenHashtag3 == '') {
				$("#hash3").val( $("#hashId").val() );
			  }
        	  
                	  
        	  // 새로 추가될 때마다 입력창을 비운다.
              $("#hashId").val('');
              removeScript();
           } else {
              // 추가 실패(형식 에러)
        	   Swal.fire({
        			position: 'center',
        			icon: 'error',
        			title: '형식이 올바르지 않습니다!',
        			text: '한글, 영문, 숫자만 가능합니다',
        			showConfirmButton: false,
        			timer: 4000
        		}).then ( (result) => {
        			$("#hashId").val('');
        		})
           }
           

       } else if (count > 2 && hashtag != '') {
           // 추가 실패(개수 초과)
           Swal.fire({
				position:'center',
				icon:'error',
				title:'해시태그 개수가 너무 많습니다!',
				text:'3개까지만 추가 가능합니다.',
				showConfirmButton: false,
				timer:4000
           }).then ( (result) => {
				$("#hashId").val('');
           })
       }

	   }

   	});

 	function removeScript() {
		$("ul#hashUl li").click(function() {
			$(this).remove();
		})
 	}
    
</script>

<script>
	var tags = <%=dto.getHashTag() %>;
	console.log(tags);

	for( key in tags ) {
		var arr = tags[key];
		$("#hashUl").append("<li>" + "#" + arr + "</li>");
	}

$(document).ready(function() {
	       $("ul#hashUl li").click(function() {
	           $(this).remove();
	       });
	   	
})
</script>

 -->

<!---------------------- 이미지 다중 썸네일 --------------------------->

<script>
  $(function() {
  // Multiple images preview in browser
  var imagesPreview = function(placeToInsertImagePreview) {

    // Empty preview so we can safely rebuild it
    $(placeToInsertImagePreview).empty();

    // Get all files
    var elems = document.getElementsByClassName("photo-add");

    // Loop through each file and append them to the preview if available
    for (i = 0; i < elems.length; i++) {
      if (elems[i].files.length != 0) {
        var reader = new FileReader();
        var id = $(elems[i]).attr('id');
        //console.log('Before reader onload: '+id);

        reader.onload = (function(id) {
          console.log('After reader onload: ' + id);
          return function(e) {
            $($.parseHTML('<img>')).attr({
              'src': e.target.result,
              'data-id': id
            }).appendTo(placeToInsertImagePreview);
          }
        })(id);

        reader.readAsDataURL(elems[i].files[0]);
      }
    }
  };

  window.reset = function(e) {
    e.wrap("<form>").closest('form').get(0).reset();
    e.unwrap();
  }

  $('div.c-gallery').on('click', 'img', function() {
    var id = $(this).attr("data-id");
    reset($('#' + id));
    $(this).remove();
  });

  $('.photo-add').on('change', function() {
    imagesPreview('div.c-gallery');
  });
});
</script>

<!---------------- 텍스트 에디터 ----------------->
<!-- <script>
  // 텍스트 에디터 스크립트
  CKEDITOR.replace('introduce', {
    width : 1047,
    height : 330,
  });
</script> -->
<!--------------- 기업 형태 값 셋팅 ----------------->

<script>
  
   $(document).ready(function() {
      // select id=type 의 어트리뷰트 sel
      var temp = $('select#typeid').attr('sel');
      $('select#typeid option[value=' + temp + ']').attr('selected', 'selected');         
   })      
</script>

<!--------------- 기업 분야 select 초기화 --------------->

<script>
  var department1 = [
    "가사, 가정",'건설', '공공행정, 국방', '광업', '교육서비스', '국제, 외교기관', '금융', '기타 서비스업', '농림, 어업', '물류, 운송업',
    '보건, 사회복지', '부동산', '사업지원', '상수도, 환경', '숙박, 음식점', '예술, 스포츠, 여가','전기, 가스', '전문, 과학기술',
    'IT, 컨텐츠, 네트워크', '제조', '판매, 유통'
  ];
  for( arr of department1 ){
    document.querySelector("#c_department").innerHTML += '<option value="'+ arr +'">'+arr+'</option>';
  }
</script>

<!--------------- 기업 형태 select 초기화 --------------->
<script>
  var type1 = [
	"대기업", "대기업 계열사, 자회사", "중소기업(300명 이하)", "중견기업(300명 이상)", "벤처기업", 
	"외국계(외국계 투자기업)", "외국계(외국계 법인기업)", "국내 공공기관, 공기업", "비영리단체, 협회, 교육재단"
  ];
  for( arr of type1 ) {
	document.querySelector("#typeid").innerHTML += '<option value="'+ arr + '">'+arr+'</option>';
  }
</script>

<!---------------- 주소찾기 api 스크립트 ------------------>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<!--------------- 이미지 단일 썸네일 ------------------>
<script>
  var sel_file;

  $(document).ready(function () {
    $("#file").on("change", handleImgFileSelect);
  });

  function handleImgFileSelect(event) {
    var files = event.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function (f) {
      if(!f.type.match("image.*")) {
        alert("이미지 확장자만 가능합니다.");
        return;
      }
      sel_file = f;

      var reader = new FileReader();
      reader.onload = function(event) {
        $("#img").attr("src", event.target.result);
      }
      reader.readAsDataURL(f);
    });
  }
</script>

<!-- ================================================================================ -->

<style>
          .profileWrap {position:relative; float:right; width:250px;}
.profileWrap .profile {position:relative; width:250px; height:250px; border-radius:50%; background:#eaeaea; overflow:hidden;}
.profileWrap .profile i {position:absolute; top:42px; left:33px; font-size:210px; color:#fff; z-index:1;}
.profileWrap .profile #imgs-wrap {position:absolute; top:0; left:0; width:100%; height:250px; z-index:2;}
.profileWrap .profile #imgs-wrap p {width:100%; height:250px; background-size:cover !important; background-position:50% !important;}
.profileWrap .filebox {}
.profileWrap .filebox input[type="file"] {
   position: absolute;
   width: 0px;
   height: 0px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip:rect(0,0,0,0);
   border: 0;
}
.profileWrap .filebox label {
  position:absolute; top:0; left:0; width:250px; height:250px;
  z-index:3; background:rgba(0,0,0,0.6); font-size:65px; color:#fff;
  text-align:center; line-height: 250px; border-radius:50%;
  cursor:pointer; opacity:0; transition:all 0.4s ease-in-out;
}
.profileWrap .filebox label:hover {opacity:1;}

/* imaged preview */
.filebox .upload-display {
  position:absolute; top:0; left:0; width:250px; height:250px;
  z-index:2; overflow: hidden; border-radius:50%;
}

.filebox .upload-display img {
   display: block;
   max-width: 250px;
   width: 100%;
   height: 250px;
   
</style>

<%@include file ="../../../include/footer.jsp" %>





