<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>





<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script>
  
<style>
/* 컬럼 이름 */
div p.column {
  font-size : 13pt;
}

/* 별표 */
div label.star {
  font-size : 14pt;
}

/* 컬럼 설명 */
div.input-box p.column label.message {
  color: #757474;
  font-size: 10pt;
}

/* input text */
div input[type=text] {
  padding-left : 20px;
  margin-top : 5px;
  border: 1px solid rgb(176, 176, 176);
  width : 100%;
  height : 40px;
  font-size : 13pt;
}

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
  
  /* 해시태그 추가버튼 */
  .hashAdd {
  	width : 80px;
	height : 40px;
	background-color: #4f6eff;
	color: #fff;
  }
  
</style>    

<form action = "update.do" method = "post" id = "frm" name = "frm">
<input type="hidden" name="seq" value="${dto.seq}"/>
      <div style = "">
          
        <div class="update-logo">
          <div class="logo-text">
            <span class = "intro_message">
              <p style="font-size: 19pt;">회사 정보를 수정하거나 등록해주세요.</p>
              <p style="font-size: 11pt;"> 
                <label class = "star" style="color:#ff0000"> * </label> 
                표시된 정보는 일반회원, 기업회원 모두 열람이 가능합니다.
              </p>
            </span>
          </div>



			<div class="profileWrap">
				<div class="profile">
					<i class="fas fa-user"></i>
					<div class="imgs-wrap" id="imgs-wrap"></div>
				</div>
				<div class="filebox preview-image">
					<label for="input_file"><i class="fas fa-camera"></i></label> <input
						type="file" id="input_file" class="upload-hidden"> <input
						type="hidden" class="upload-name" name="_profileName">
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
          <input type = "text" value = "원티드" value = "${dto.name }" style = "background: #f4f4f4;border: none;" readonly>
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
            <input type= "text" class = "address_zipcode" id="sample6_postcode" placeholder="우편번호">
            
            <!-- 기본주소 -->
            <input type = "text" class = "address_basic" id="sample6_address" placeholder="기본주소">
            	<input type="hidden" name="address"><!-- 이 부분은 우편번호'기본주소'상세주소 이런식으로 들어가도록 스크립트에서 작업 -->
            	<br>
            <!-- 참고항목 -->
            <input type = "hidden" class = "address_reference" id="sample6_extraAddress">
            
            <!-- 상세주소 -->
            <input type = "text" style= "background-color:#ffffff" class = "address_specific" placeholder="상세주소를 입력해주세요." id="sample6_detailAddress">
        
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
            <label class = "message"> 한글, 영문, 숫자만 가능하며, 등록된 태그를 클릭하면 삭제됩니다. </label>
          </p>
          <input type = "text" id = "hashId" class = "hashId" placeholder="해시태그는 최대 3개까지 등록 가능합니다."/>
          <input type = "hidden" name = "hashTag" id = "hash1">
          <input type= "hidden" name = "hashTag" id = "hash2">
          <input type=  "hidden" name = "hashTag" id = "hash3">
          <ul id = "hashUl">
          
          </ul>
        </div>
        
        

        <div class="input-box" style="margin-top:20px;">
          <p class = "column"> 기업 소개 
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 기업에 대해 자유롭게 소개해주세요. </label>
          </p>
            <div class = "textarea">
              <textarea name="introduce" cols="30" rows="30" id="introduce">
              ${dto.introduce }
              </textarea>
            </div>
        </div>
 </form>
 
        <div class="input-box">
          <p class = "column"> 기업 이미지
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 최대 3장까지 등록 가능하며, 해당 이미지를 클릭하면 삭제됩니다. </label>
          </p>
          <form>
	          <div class="cmypage-fileWrap clfix">
	           	 <div class="c-fileBtn clfix">
	             	<input type = "file" class="photo-add" id = "image1" name="images[]" accept="image/*">
	             	<input type = "file" class="photo-add" id = "image2" name="images[]" accept="image/*">
	             	<input type = "file" class="photo-add" id = "image3" name="images[]" accept="image/*">
	             </div>
	            <div class = "c-gallery clfix" style="width:1052px; height:332px;border:1px solid rgb(176, 176, 176)">
	            </div>
	          </div>
          </form>
        </div>

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

document.addEventListener("DOMContentLoaded", function() {

	
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

		
		// 1. 대표자명
		var korRegPresident = /^[가-힣]*$/;				// 한글 정규식
		var engRegPresident = /^[a-zA-Z]*$/;				// 영어 정규식
		var beforePresident = $("#president").val();
		console.log("페이지 열릴 때 대표자명 = " + beforePresident);

		if( beforePresident != null || beforePresident != "") {
			presidentCheck = true;
		}
		
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
		
		if( tel.onfocusout = () => {
		var telValue = $("#tel").val();

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

		// 5. 주소
		
		
		// 6. 해시태그
		
		
		

// 완료버튼 누름
updateComplete = () => {

	// 주소 합치기 ! 
	var addressStr = '';
	addressStr += "[" + $('#sample6_postcode').val() + "] ";	// 우편번호
	addressStr += $('#sample6_address').val() + " ";			// 기본주소
	addressStr += $('#sample6_extraAddress').val();				// 상세주소
	$('input[name=address]').val(addressStr);

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
			return false;
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
			return false;
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
			return false;
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
			return false;
		})
	}


	// submit
	Swal.fire({
		position: 'center',
		icon: 'success',
		text: '성공적으로 수정되었습니다!',
		showConfirmButton: false,
		timer: 1500
	}).then ( (result) => {
		document.querySelector('#frm').submit();
	})
	
}

});
</script>

<!----------------------- 주소 쪼개기 ------------------------------->

<script>

	var dbAddress = "${dto.address }";
	

</script>

<!----------------------- 해시태그 -------------------------->

<script>

/*
function addTag() {

	var index = 0;

	// 태그 개수
    var count = $("#hashDiv").length;

    // 해시태그 내용
    var hashtag = $("#hashId").val();

    // 해시태그 유효성 (한글, 영어, 숫자만 허용)
    var hashtagCheck = /^[가-힣a-zA-Z0-9]*$/;

    // 태그는 3개까지 허용하며, 빈 칸인 경우 추가하지 않는다.
    if (count < 3 && hashtag != '') {
        if(hashtagCheck.test(hashtag)) {
		   // 추가 성공
     	  $("#hashDiv").append("<span>"+"#"+hashtag+"<input type='hidden' name='hashTag' value='"+hashtag+"'></span>");
		  count++;
		  alert(hashtag);
		  alert(count);
     		
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
} */

   // 해시태그 추가

   var index = 0;
   $("#hashId").focusout(function() {
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

        	  if(hiddenHashtag1 == null) {
        	  	$("#hash1").val( $("#hashId").val() );
			  } else if(hiddenHashtag2 == null) {
				$("#hash2").val( $("#hashId").val() );
			  } else if(hiddenHashtag3 == null) {
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

   	});

   function removeScript() {
       $("ul#hashUl li").click(function() {
           $(this).remove();
       });
   }
    
</script>

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

<script>
  // 텍스트 에디터 스크립트
  CKEDITOR.replace('introduce', {
    width : 1047,
    height : 330,
  });
</script>

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





