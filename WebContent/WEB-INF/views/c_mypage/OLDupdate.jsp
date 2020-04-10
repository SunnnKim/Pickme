<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
  <script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script> 
<!----- [ 디자인 CSS 영역 ] ----->
<link rel="stylesheet" href="./css/reset.css" type="text/css"> <!-- 리셋 CSS -->
<link rel="stylesheet" href="./css/style.css" type="text/css"> <!-- 디자인 CSS -->

<style>

/* 컬럼 이름 */
div p.collumName {
  font-size : 13pt;
}

/* 별표 */
div label.star {
  font-size : 14pt;
}

/* 컬럼 설명 */
div.input-box p.collumName label.message {
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
div input[type=password] {
  padding-left: 20px;
  margin-top:5px;
  border: 1px solid rgb(176, 176, 176);
  width : 100%;
  height : 40px;
  font-size: 13pt;
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
  width : 480px;
  height : 40px;
}

/* 기업 상세주소 텍스트 필드 */
div.input-box input.address_specific {
  padding-left : 20px;
  border : 1px solid rgb(176, 176, 176);
  font-size : 13pt;
  width : 869px;
  height : 40px;
}

/* 주소찾기 버튼 */
div.input-box input.btn {
  margin-top:4px;
  margin-left: 20px;
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

div.input-box div.gallery {
  overflow: hidden;
  text-align: center;
  justify-content: center;
  align-content: center;
}

div.input-box form div.gallery img {
  margin-top: 50px;
  margin-bottom : 10px;
  max-width : 60%;
  height : auto;
  text-align: center;
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

  .update-logo .logo-img {
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
  }

  
  div.input-box p.collumName button.btn {
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
  
</style>


</head>
<body>
<div id="wrap">
  <header>
    <div class="inner clfix">
      <strong class="logo"><a href="#none">PICK ME</a></strong>
      <nav class="gnb">
        <a href="#none">채용탐색</a>
        <a href="#none">이력서</a>
        <a href="#none">지원현황</a>
        <a href="#none">고객센터</a>
      </nav><!-- // gnb -->
      <ul class="header_infoBtn clfix">
        <li><button type="button" id="searchBtn"></button></li>
        <li><span><a href="#none">로그인</a> / <a href="#none">회원가입</a></span></li>
        <li><a href="#none">기업서비스</a></li>
      </ul>
    </div><!-- // inner -->
  </header><!-- // header -->

  <div id="sub-container">
    <div class="inner">
      <div class="subTit">
        <h2 class="pageTit">마이페이지</h2>
        <div class="location">
          <span>홈</span>
          <span>></span>
          <span>마이페이지</span>
          <span>></span>
          <span>기업정보 수정 · 등록</span>
        </div>
        <ul class="depth02 clfix">
          <li class="on"><a href="#none">기업정보 수정 · 등록</a></li>
          <li><a href="#none">결제</a></li>
          <li><a href = "#none">회원탈퇴</a></li>
        <!--<li><a href="#none">depth02-C</a></li>-->
        </ul><!-- // depth02 -->
      </div><!-- // subTit -->

      <div class="subCont">

        <!-- 본문 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

      <form>

      <div style = "margin-top:50px; padding-left:90px; padding-right:90px;">
          
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
          <div class="logo-img">
            <input type = "button" class = "btTextW" value = "로고" onclick = document.all.file.click();>
            <input type = "file" name = "file" id = "file" style = "display: none;" accept="image/*"/>
          </div>
        </div>

        <div class="input-box clfix">
          <p class = "collumName"> 이메일 
            <label class = "star" style = "color:#ff0000"> * </label> 
          </p>
          <input type = "text" value = "adf@naver.com" style = "background: #f4f4f4;border: none;"readonly>
        </div>
        
        <div class="input-box">
          <p class = "collumName"> 기존 비밀번호 </p>
          <input type = "password">
        </div>

        <div class="input-box">
          <p class = "collumName"> 새 비밀번호 <label id="password_incorrect"> 비밀번호가 적합하지 않습니다. </label></p>
          <input type = "password" id = "newPassword">
        </div>

        <div class = "input-box">
          <p class = "collumName"> 새 비밀번호 확인 <label id="password_inconsistency"> 비밀번호가 일치하지 않습니다. </label></p>
          <input type = "password" id = "newPassword_confirm">
        </div>

        <div class="input-box">
          <p class = "collumName"> 기업명 
          <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <input type = "text" value = "원티드" style = "background: #f4f4f4;border: none;" readonly>
        </div>

        <div class="input-box">
          <p class = "collumName"> 대표자명 
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <input type = "text">
        </div>

        <div class="input-box">
          <p class = "collumName"> 기업 분야 
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <select id = "c_department">
            <option value="none"> 기업 분야를 선택해주세요 </option>
          </select>
        </div>

        <div class="input-box">
          <p class = "collumName"> 기업 형태 
            <label class = "star" style = "color:#ff0000"> * </label>
          </p>
          <select>
            <option value = "none"> 기업 형태를 선택해주세요 </option>
            <option value = "대기업"> 대기업 </option>
            <option value = "대기업 계열사, 자회사"> 대기업 계열사, 자회사 </option>
            <option value = "중소기업(300명 이하)"> 중소기업(300명 이하) </option>
            <option value = "중견기업(300명 이상)"> 중견기업(300명 이상) </option>
            <option value = "벤처기업"> 벤처기업 </option>
            <option value = "외국계(외국 투자기업)"> 외국계(외국 투자기업) </option>
            <option value = "외국계(외국 법인기업)"> 외국계(외국 법인기업) </option>
            <option value = "국내 공공기관, 공기업"> 국내 공공기관, 공기업 </option>
            <option value= "비영리단체, 협회, 교육재단"> 비영리단체, 협회, 교육재단 </option>
          </select>
        </div>

        <div class="input-box">
          <p class = "collumName"> 기업 주소 
            <label class = "star" style="color:#ff0000"> * </label> &nbsp;&nbsp;&nbsp;&nbsp; 
          </p>
            <!-- 기본주소 -->
            <input type = "text" class = "address_basic" id="sample6_address" placeholder="기본주소">
            <input type = "button" class = "btn" onclick="sample6_execDaumPostcode()" value="주소찾기">

            <!-- 우편번호 -->
            <input type= "hidden" id="sample6_postcode">

            <!-- 상세주소 -->
            <input type = "text" class = "address_specific" placeholder="상세주소를 입력해주세요." id="sample6_detailAddress">
              
            <!-- 참고항목 -->
            <input type = "hidden" id="sample6_extraAddress">
        </div>

        <div class="input-box">
          <p class = "collumName"> 사업자 등록 번호 <label class = "message"> '-' (하이픈) 구분없이 숫자로만 입력해주세요. </label> </p> 
          <input type = "text">
        </div>

        <div class="input-box">
          <p class = "collumName"> 대표 연락처 <label class = "star" style="color: #ff0000;"> * </label> <label class = "message"> '-' (하이픈) 구분없이 숫자 10~11자로 입력해주세요. </label></p>
          <input type = "text">
        </div>

        <div class="input-box">
          <p class = "collumName"> 해시태그 
            <label class = "star" style = "color: #ff0000;"> * </label> 
            <label class = "message"> 태그는 최대 3개까지 입력 가능하며, 등록된 태그를 클릭하면 삭제됩니다. </label>
          </p>
          <input type = "text" id = "hashId">
          <ul id = "hashUl">
            
          </ul>
          
        </div>

        <div class="input-box" style="margin-top:20px;">
          <p class = "collumName"> 기업 소개 
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 기업에 대해 자유롭게 소개해주세요. </label>
          </p>
            <div class = "textarea">
              <textarea name="content" cols="30" rows="30">
              </textarea>
            </div>
        </div>

        <div class="input-box">
          <p class = "collumName"> 기업 이미지 
            <label class = "star" style = "color:#ff0000"> * </label>
            <label class = "message"> 최대 3장까지 등록 가능하며, 해당 이미지를 클릭하면 삭제됩니다. </label>
          </p>
          <p style = "margin-top:30px;float: right;">
          <form>
              <input type = "file" id = "image1" class = "photo-add" name = "images[]">
              <input type = "file" id = "image2" class = "photo-add" name = "images[]">
              <input type = "file" id = "image3" class = "photo-add" name = "images[]">
            <div class = "gallery" style = "margin-top:80px"></div>

            </div>
          </form>
          </p>
        </div>

        <div style = "margin-top: 100px; margin-bottom:70px">
        </div>

        <div class="update-btn" style = "text-align:center">
            <button type = "button" id = "completeBtn" onclick = "updateComplete()"> 완료 </button>
        </div>
          
      </div>

      </form>
        <!-- 본문 끝!!!!!!!!!!!!!!!! !!!!!!!! -->

      </div><!-- // subCont -->
    </div><!-- // inner -->
  </div><!-- // sub-container -->

  <footer>
    <p class="copyright">Copyright by Up All Rights Reserved.</p>
  </footer><!-- // footer -->

</div><!-- // wrap -->







<!------------------------------------ 스크립트 영역 ----------------------------------------->

<script>
  // 새 비밀번호 유효성 검사

</script>


<script>
  // 새 비밀번호 일치 검사
  $("#newPassword_confirm").focusout(function () {
    var pwd1 = $("#newPassword").val();
    var pwd2 = $("#newPassword_confirm").val();

    if(pwd1 != "" && pwd2 == "" || pwd1 == "" && pwd2 != "") {
      null;
    } else if(pwd1 != "" || pwd2 != "") {
      if(pwd1 == pwd2) {
        $("#password_inconsistency").css("color", "white");
      } else {
        $("#password_inconsistency").css("color", "red");
      }
    }
  })

  $("#newPassword").focusout(function () {
    var pwd1 = $("#newPassword").val();
    var pwd2 = $("#newPassword_confirm").val();

    if(pwd1 != "" && pwd2 == "" || pwd1 == "" && pwd2 == "") {
      null;
    } else if(pwd1 != "" || pwd2 != "") {
      if(pwd1 == pwd2) {
        $("#password_inconsistency").css("color", "white");
      } else {
        $("#password_inconsistency").css("color", "red");
      }
    }
  })
</script>


<script>
// 해시태그 스크립트

var index = 0;
$("#hashId").focusout(function() {
    // 태그 개수
    var count = $("ul#hashUl li").length;

    // 해시태그 내용
    var hashtag = $("#hashId").val();

    // 태그는 3개까지 허용하며, 빈 칸인 경우 추가하지 않는다.
    if (count < 3 && hashtag != '') {
        $("#hashUl").append("<li>" + "#" + hashtag + "</li>");

        // 새로 추가될 때마다 입력창을 비운다.
        $("#hashId").val('');

        // 삭제하고자 하는 태그를 클릭 시 삭제된다.
        $("ul#hashUl li").click(function() {
            console.log(this);
            $(this).remove();
        });

    } else if (count > 2 && hashtag != '') {
        alert("더 이상 추가할 수 없습니다.");
        $("#hashId").val('');
    }

})
</script>




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

  $('div.gallery').on('click', 'img', function() {
    var id = $(this).attr("data-id");
    reset($('#' + id));
    $(this).remove();
  });

  $('.photo-add').on('change', function() {
    imagesPreview('div.gallery');
  });
});
</script>

<script>
  // 텍스트 에디터 스크립트
  CKEDITOR.replace('content', {
    width : 874,
    height : 330,
  });
</script>

<script>
  // 기업분야 셀렉트 박스 초기화 
  var department = [
    "가사, 가정",'건설', '공공행정, 국방', '광업', '교육서비스', '국제, 외교기관', '금융', '기타 서비스업', '농림, 어업', '물류, 운송업',
    '보건, 사회복지', '부동산', '사업지원', '상수도, 환경', '숙박, 음식점', '예술, 스포츠, 여가','전기, 가스', '전문, 과학기술',
    'IT, 컨텐츠, 네트워크', '제조', '판매, 유통'
  ];
  for( arr of department){
    document.querySelector('#c_department').innerHTML += '<option value="'+ arr +'">'+arr+'</option>';
  }
</script>


<script>
  // 주소찾기 스크립트
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



<!-- 완료 하는 스크립트 -->
<script>
  function update() {

  }
</script>



</body>
</html>