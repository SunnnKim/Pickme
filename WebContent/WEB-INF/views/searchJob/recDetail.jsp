<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 헤더호출 -->
<c:import url="../../../include/header.jsp"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>
  <form method="post">
  	<input type="hidden" name="seq" value="${recDto.seq }">
  	<input type="hidden" name="comSeq" value="${recDto.comSeq }">
  </form>
  <div class="recTop clfix">
          <div class="infoImg">
            <div class="slider">
              <div class="slide-viewer">
                  <div class="slide-group">
                      <div class="slide slide-1"><img src="/Pickme/images/sub/rec-detail-testimg1.jpg" alt=""></div>
                  </div>
              </div>
          </div>
          </div><!-- div.infoImg -->
          <div class="infoCom">
            <h4>요약</h4>
            <table class="summary-table">
              <tbody>
                <tr>
                  <td class="t-icon"><i class="fas fa-file-signature"></i></td>
                  <td class="t-label">직무</td>
                  <td class="t-content">${recDto.comJob }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-building"></i></td>
                  <td class="t-label">근무형태</td>
                  <td class="t-content">${recDto.workingForm }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-laptop-code"></i></td>
                  <td class="t-label">경력</td>
                  <td class="t-content">${recDto.comJobType }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-calendar-alt"></i></td>
                  <td class="t-label">기간</td>
                  <td class="t-content">${recDto.wdate }부터 ${recDto.edate } 까지</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-map-marker-alt"></i></td>
                  <td class="t-label">위치</td>
                  <td class="t-content">${comAddr }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-dollar-sign"></i></td>
                  <td class="t-label">연봉</td>
                  <td class="t-content">${recDto.salary }</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-tags"></i></td>
                  <td class="t-label">태그</td>
                  <td class="t-content">
                    <div class="inhash">
                      <button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>
                        #가족분위기
                      </button>
                      <button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>
                        #스타트업
                      </button>
                      <button type='button' class='hashbtn' name='hashtag' style='margin-right:8px;'>
                        #IT,컨텐츠
                      </button>
                  </div>
                  </td>
                </tr>
              </tbody>
            </table>
            <span class="likes">
              <button type="button" class="likebtn" onclick="likech(this)"><i class="fas fa-heart unliked"></i>23</button>
            </span>
          </div><!-- div.infoCom -->
        </div><!-- dvi.recTop -->
        
        <div class="rec-content clfix">
  			${recDto.content }
        </div><!--div.infoContent-->

        <div class="rec-location">

        </div><!-- rec-location -->

<script>
	$("#detailApply").on("click", function(){
		alert("지원하기 버튼");
	});

	$("#sendMsg").on("click", function(){
		alert("메시지보내기 클릭");
	});

	//회사이름, 제목 
	$(".recTit").text("${recDto.title }");
	$(".recSubTit").text("${recDto.comName }");
    //좋아요 
    function likech(btn){
    console.log($(btn).children('i'));
     if( $(btn).children('i').hasClass('unliked')==true ){
       $(btn).children('i').removeClass('unliked');
       $(btn).children('i').addClass('liked');
    //   alert( "dd");

    } else if($(btn).children(':first').hasClass('liked')) {
        $(btn).children(':first').removeClass('liked');
        $(btn).children(':first').addClass('unliked');
     }
  }




</script>
<c:import url="../../../include/footer.jsp"/> 
