<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script> 
<!-- 텍스트 에디터 -->
<!-- subCont 시작 -->
<!-- 메뉴 -->
        <div class="rec-wrapper">
          <div class="rec-caution">
            <h3 class="tit">채용등록</h3>
            <ul class="rec-ul">
              <li>채용등록주의사항1</li>
              <li>채용등록주의사항2</li>
              <li>채용등록주의사항3</li>
            </ul>
          </div><!-- rec-title -->
          <form action="" enctype="multipart/form-data">
          <div class="rec-conatainer">
            <div class="rec-top">
                <!-- 회사기본정보 -->
                <h3 class="tit">회사기본정보</h3>
                <div class="cont clfix">                    
                  <h4>대표이미지등록<span class="ess">*</span><div class=""><input type="file" name="uploadfile" id="input_imgs" multiple></div></h4>
                  <div class="imgs-wrap" id="imgs-wrap"></div>                     
                  
                    
                </div><!-- cont -->
            </div> <!-- rec-top -->    

            <div class="rec-info">
              <h3 class="tit">채용등록정보</h3>
              <h4>직군/직무<span class="ess">*</span></h4>
              <div class="cont">
                <!-- <input type="text" name="com_job" required placeholder="직무를 입력해주세요" maxlength="100" autofocus>
                <i class="far fa-check-circle"></i> -->
                <select class="jobselect" name="com_job1" id="com_job1" onchange="changeOcc(this)">
                  <option value="0">1차분류</option>
                </select>
                <select class="jobselect" name="com_job2" id="com_job2">
                  <option value="0">2차분류</option>
                </select>
              </div>
              <h4>경력<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="com_jobtype" required placeholder="신입/경력 등 원하는 경력을 입력해주세요" maxlength="100">
                <i class="far fa-check-circle"></i>
              </div>
              <h4>주요업무<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="main_task" required placeholder="주요업무를 간략하게 입력해주세요" maxlength="200">
                <i class="far fa-check-circle"></i>
              </div>
              <h4>근무형태<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="working_form" required placeholder="정규직/계약직 등 원하는 근무형태를 입력해주세요" maxlength="100">
                <i class="far fa-check-circle"></i>
              </div>
              <h4>자격요건<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="requirements"  required placeholder="학력, 스킬 등 원하는 조건을 입력해주세요." maxlength="200">
                <i class="far fa-check-circle"></i>
              </div>
              <h4>급여<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" name="salary" required placeholder="2,000~3,000만원" maxlength="25">
                <i class="far test fa-check-circle"></i>
              </div>
              <h4>내용<span class="ess">*</span></h4>
              <div class="cont">
                    <textarea id="content" name="content" cols="70" rows="50" placeholder="복지 등 업무소개를 더 자세하게 입력가능합니다."></textarea>
              </div>
              <h4>태그<span class="ess">*</span></h4>
              <div class="cont">
                <input type="text" id="hashtag" required placeholder="태그는 최대 3개까지 입력가능합니다." maxlength="10"><button type="button" id="hashadd" onclick="tagappend()" >추가</button>
                <div class="inhash"></div>
              </div>
              <div class="rec-buttons">
                <button type="button" id="rec-insert">등록</button>
                <button type="reset">취소</button>
              </div>
            </div><!-- rec-info-->
          </div><!-- rec-conatainer -->
          </form>
        </div> <!-- rec-wrapper -->

  <script type="text/javascript">
    // 직무 카테고리
    var json_url = './../util/rec-joblist.json';
    var keyArr = new Array();
    var valArr = new Array();
  
    var json;
    var jsonArr = [];
    $.getJSON(json_url, function(data){
        for( var i in data){
          json = JSON.stringify(data[i])
          json = JSON.parse(json);
          jsonArr.push(json)
          for( key in json ){
           // console.log(key);
            $("#com_job1").append("<option value='"+key+"'>"+key+"</option>");
            // console.log("key:"+key+", value:"+json[key]);
            keyArr.push(key);
            valArr.push(json[key]);
            // map.put(key, json[key]);
          }
        }
            // console.log(jsonArr)

    });
    
      function changeOcc( onedepth ){
        var i=0;
        console.log(onedepth.value);
        $("#com_job2").html('');
        $("#com_job2").append("<option value='0'>2차분류</option>")
        for( arr of jsonArr ){
          // console.log(arr)
          for(key in arr){
              if( key.trim() == onedepth.value.trim() ){
                for( i = 0; i < arr[key].length; i++ ){
                  $("#com_job2").append("<option value='"+arr[key]+"'>"+arr[key][i]+"</option>");
                }
               
              }
          }
        }
      }

    

    // v 체크 불 들어오게

   var com_jobtype = $("input[name='com_jobtype']");
   var main_task = $("input[name='main_task']");
   var working_form = $("input[name='working_form']");
   var requirements = $("input[name='requirements']");
   var salary = $("input[name='salary']");

    //boolean
  var b_com_jobtype;
  var b_main_task;
  var b_working_form;
  var b_requirements;
  var b_salary;
  var addHashtext;



    //경력
    $(com_jobtype).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>1){
      $(this).next("i").css("color","green");
      b_com_jobtype=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //주요업무
    $(main_task).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>10){
      $(this).next("i").css("color","green");
      b_main_task=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //근무형태
    $(working_form).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>5){
      $(this).next("i").css("color","green");
      b_working_form=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //자격요건
    $(requirements).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>20){
      $(this).next("i").css("color","green");
      b_requirements=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });
    //급여
    $(salary).keyup(function(){
     var inputLength = $(this).val().length;
    console.log(inputLength);
    if(inputLength>3){
      $(this).next("i").css("color","green");
      b_salary=true;
      } else {
      $(this).next("i").css("color","#bbb");
      }
   });



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
     const str = "<button type='button' class='hashbtn' name='hashtag' value='"+hashtext+"' style='margin-right:8px;'>#"+hashtext+"<i class='fas fa-times close' onclick='remove(this)'></i></button>";
     if(hashtext.trim() != ""){
      $(".inhash").append(str);
      document.getElementById('hashtag').value="";
      element_count++;
      hashTagCount();

     } else {
       alert("태그를 입력해주세요.");
     }
    }

    function remove( element ){  
      element.parentNode.parentNode.removeChild(element.parentNode);
      element_count--;
      hashTagCount();
    // alert(element_count);
    };

    function hashTagCount(){
      if(element_count >= 3){
         $("#hashtag").attr("readonly","readonly");
         $("#hashadd").attr("disabled",true);
      } else {
        $("#hashtag").removeAttr("readonly");
        $("#hashadd").attr("disabled",false);
      }
    }
    //텍스트에디터
    CKEDITOR.replace( 'content' );
    

    // 이미지 프리뷰
    var sel_files = [];

    $(document).ready(function() {
        $("#input_imgs").on("change", handleImgsFilesSelect);
    }); 

    function handleImgsFilesSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

            var reader = new FileReader();
            reader.onload = function(e) {
               var img_html = "<img width='240px' src=\"" + e.target.result + "\" />";
                //var bannerw = $(".imgs-wrap");
                //bannerw.style.removeProperty("background-color");
                $(".imgs-wrap").append(img_html);
                $(".imgs-wrap").css("background-color","");
            }
            reader.readAsDataURL(f);
        });
        $('input:file').MultiFile('reset')
    }


    var tags = document.getElementsByTagName("hashtag");

    //등록눌렀을때
    $("#rec-insert").on("click",function(){
      console.log("직군:"+$("#com_job1 option:selected").val() );
      console.log("직무:"+$("#com_job2 option:selected").val() );
    //console.log("에디터:"+CKEDITOR.instances.content.getData());

    	
/*        if( b_com_job==true && b_com_jobtype==true && b_main_task==true && b_working_form==true && b_working_form==true && b_requirements==true && b_salary==true ){
         alert("등록가능");
       } else {
         alert("등록x");
       }  */

    });

    
</script>
 

<!-- subCont 끝 -->

<%@include file="/include/footer.jsp"%>

