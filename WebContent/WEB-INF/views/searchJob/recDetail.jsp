<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--font-awesome-->
<script src="https://kit.fontawesome.com/e11681bffc.js"	crossorigin="anonymous"></script>

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
                  <td class="t-content">서버/백엔드, 머신러닝, 시스템/네트워크</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-building"></i></td>
                  <td class="t-label">근무형태</td>
                  <td class="t-content">정규직</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-laptop-code"></i></td>
                  <td class="t-label">경력</td>
                  <td class="t-content">5년이상</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-calendar-alt"></i></td>
                  <td class="t-label">기간</td>
                  <td class="t-content">2020-04-01 16:23 부터 2020-04-10 19:00 까지</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-map-marker-alt"></i></td>
                  <td class="t-label">위치</td>
                  <td class="t-content">서울 서초구 서초대로38길 12, (서초동, 마제스타시티, 힐스테이트 서리풀) 타워2, 8층</td>
                </tr>
                <tr>
                  <td class="t-icon"><i class="fas fa-dollar-sign"></i></td>
                  <td class="t-label">연봉</td>
                  <td class="t-content">3,000~4,000만원</td>
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
          채용등록할때 입력한 내용
        </div><!--div.infoContent-->

        <div class="rec-location">

        </div><!-- rec-location -->

<script>
	

	//회사이름, 제목 
	$(".recTit").text("공고 제목");
	$(".recSubTit").text("회사명");
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
<%@include file="/include/footer.jsp"%>