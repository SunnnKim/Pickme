<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더호출 -->
<%@include file="../../../include/header.jsp"%>
<style>
        .c_introWrap {

        }

        .c_introTop {

        }

        .c_introTop .c_introSlider {
          float: left;
          width: 600px;
          height: 480px;
          background: #ccc;
          background: url("../images/sub/c_company.jpg") no-repeat center / cover;
        }

        .c_introTop .c_introInfo {
          float: right;
          width: 420px;
        }
        .c_introInfo .tit {
          
        }

        .c_introInfo .tit h3 {
          line-height: 80px;
          font-size: 23px;
        }

        /* 로고 */
        .c_introInfo .tit h3 img {
          width: 80px;
          height: 80px;
          border : 1px solid #ddd;
          margin-right : 15px;
        }

        .c_introInfo ul {
          margin-top: 20px;
        }

        .c_introInfo ul li {
          font-size: 18px;
          position: relative;
          margin-top: 22px;
          padding-left: 120px;
        }

        .c_introInfo ul li span {
          display: block;
          position: absolute;
          top:0;
          left:0;
          font-weight: bold;
        }

        .followBtnWrap {
          margin-top: 50px;
        }

        .followBtnWrap span {
          display: block;
          text-align: center;
          height: 50px;
          background-color: #4f6eff;
          color: #fff;
          line-height: 50px;
          font-size: 24px;
          cursor: pointer;
        }

        .followBtnWrap span i {
          margin-left: 10px;
          display: none;
        }

        .followBtnWrap span input {
          width: 0;
          height: 0;
          display:none;
        }


        .c_introBtm {
          margin-top: 30px;
        }

        .c_introBtm h4 {
          font-size: 22px;
        }
        .c_introBtm h4 > span {
          display:inline-block;
          margin-left:30px;
        }
        .c_introBtm h4 > span > span {
          display:inline-block;
          padding:5px 15px;
          font-size:15px;
          color:#fff;
          background:#999;
          border-radius:3px;
          margin-right:10px;
        }

        .c_introBtm .cont {
          margin-top: 20px;
          font-size: 18px;
        }

      </style>
      

<div class="profile-wrap">
        <div class="c_introWrap">
          <div class="c_introTop clfix">
            <div class="c_introSlider">
            </div>  <!-- // c_introSlider -->
            <div class="c_introInfo">
                <div class="tit">
                  <h3><img src="https://static.wanted.co.kr/images/wdes/0_4.ce4fd8b1.jpg" alt="logo">원티드</h3>
                </div>
                <ul>
                  <li><span>기업분야</span>IT</li>
                  <li><span>규모</span>대기업</li>
                  <li><span>대표자 성명</span>김철수</li>
                  <li><span>전화번호</span>02-1234-1234</li>
                  <li><span>이메일</span>sadf@naver.com</li>
                  <li><span>주소</span>서울특별시 어쩌구 저쩌구</li>
                </ul>
                <div class="followBtnWrap">
                  <label>
                    <span>팔로우<i class="fas fa-check"></i> <input type="checkbox"></span>
                  </label>
                </div>
            </div>  <!-- // c_introInfo -->
          </div> <!-- // c_introTop -->      

          <div class="c_introBtm"> 
            <h4>회사소개 <span><span>#자유로운</span><span>#간식비지원</span><span>#수평적인</span></span></h4>
            <div class="cont">
              
              ‘원티드랩’은 전 세계 모든 기업과 직장인의 고민을 해결하기 위한 HR 스타트업입니다. 직장인의 90%는 이직을 생각하지만, 어떤 기업이 자신에게 최선의 선택인지 알지 못한 채 업무에 자신을 맞추고 있습니다. 기업은 누군가에 의해 검증된 인재를 채용하고 싶지만, 그 비용과 시간이 만만치 않아 잡포털 광고와 오프라인 헤드헌팅에 의존하고 있습니다. 

우리는 단순한 채용 서비스가 되려는 것이 아닙니다. 우리는 ‘좋은 일자리와 숨은 인재를 연결하는 가장 효율적이고 인간적인 방법’이라는 문제를 풀고자 합니다. 인재에게는 자신의 역량을 유감없이 발휘할 수 있는 일자리를 추천하고, 기업에게는 필요한 자리에 딱 맞는 인재를 추천하는 서비스입니다. 이를 위해 모바일 / 소셜 네트워크 / 빅데이터에 기반한 HR 솔루션들을 하나씩 만들어나가고 있습니다. 우리의 시선은 한국에 머물러 있지 않습니다. 

2015년 5월 서비스를 시작하여, 2020년 3월 현재 7,000+개 기업, 120만+ 유저가 이용 중에 있습니다. 총 누적 투자금 217억원을 유치하였으며, 한국 / 일본 / 대만 / 싱가폴 / 홍콩 오피스에 80여명의 구성원들과 함께 아시아 HR 시장을 선도하고자 합니다.
 
2015년 아시아 최초로 설립된 Google Campus의 첫 번째 입주기업으로 선발되었으며, 2016년 KMA 대한민국모바일어워드 대상 수상, 2017년 AWS의 떠오르는 스타트업 선정, Facebook Korea가 선정한 대표적인 파트너십 사례로 소개, 2018년 Forbes가 선정한 2018년 주목해야 할 한국 스타트업으로 선정되었고, 또한 Google TensorFlow를 활용하여 매칭 서비스를 하고 있는 국내 첫 사례로 구글 개발자 행사에서 사례를 발표하기도 하였습니다.
 
• 이력서는 PDF로 제출바랍니다.
• 이력서에는 현재 연봉/희망 연봉 등 직무와 무관한 개인정보는 기재하지 말아주세요.

주요업무
 • 클라우드(AWS) 환경에서 데이터 분석/모델링 환경 구축 및 운영
 • ETL, ELT 작업
 • 데이터 레이크 및 데이터 파이프라인 설계, 개발 및 운영
 • 데이터 분석 환경 제공을 위한 도구 적용 및 관련 인프라 설계, 개발 및 운영
 • 데이터 분석 및 비즈니스 요구사항에 대한 데이트 마트 개발
 • 배치 / 준실시간 데이터 처리
 • 데이터 분석가 / 서버 개발자 / DevOps 와 협업

자격요건
 • AWS 기반의 클라우드 서버 환경에 대한 이해와 경험
 • Python 3.4 이상 사용 및 중급 이상
 • 표준 SQL 중급 이상
 • Git 중급 이상
 • 새로운 지식 및 경험을 배우는데 열려있으신 분
 • 지식 및 문제 해결 경험 공유를 중요시 하는 분
 • 자신의 의견을 말하고 토론하여 의사결정 하는 데 익숙하신 분

우대사항
 • Github 링크 등 코드 샘플 첨부하시는 분
 • 자동화가 안 되어 있으면 답답함을 느끼시는 분
 • 데이터 레이크 / 웨어하우스 / 마트 구축 및 운영 경험이 있으신 분
 • 데이터 파이프라인 구축 및 운영 경험이 있으신 분
 • 주어진 비즈니스 서비스에 적절한 인프라를 설계하시는 분
 • 크롤러 프로젝트 경험이 있으신 분
 • Python 3.8 이상 버전에 능숙하신 분
 • Pandas 라이브러리에 능숙하신 분
 • 함수형 프로그래밍에 익숙하신 분
 • Third Party API 사용에 능숙하신 분
 • Bash 스크립트에 능숙하신 분
 • Amazon web services 서비스 사용 경험이 풍부하신 분
 • Airflow 운용 경험이 있거나 이해도가 높으신 분
 • 서버 개발 경험 혹은 개발 프로세스에 익숙하신 분
 • 서버리스 환경에 익숙하신 분
 • BigQuery 작성에 익숙하신 분
 • Presto 쿼리 작성에 익숙하신 분
 • 데이터 시각화 또는 BI 툴 활용 경험 (Tableau, Superset, PowerBI, Redash 등)
 • 알고리즘 및 디자인 패턴에 지식이 있으신 분
 • 머신러닝 및 딥러닝에 대한 이해가 있으신 분
 • 이벤트 데이터 수집 경험이 있으신 분
 • 구글 Analytics / Tag manager 사용 경험이 있으신 분
 • ELK 또는 커스텀 로그 시스템 구축 및 운영 겅험이 있으신 분
 • Docker 사용 경험이 있으신 분
 • Infra as Code 툴(Terraform) 사용 경험이 있으신 분
 • 새로운 지식 습득을 위해 자기 계발을 계속 하시는 분

혜택 및 복지
 • 하루 8시간, 야근없이 집중하는 문화 정착
 • 편리한 출퇴근 (역삼역 3번 출구 도보 10초)
 • 자율적 업무환경 (위워크 사무실, 라운지/부스, 수평적 조직, 맥주 무한대)
 • 휴가다운 휴가 (사유나 승인없이 스스로 휴가 계획, 3/5/7년 만근시 2주 리프레시 휴가)
 • 점심식대 지원
 • 업무관련 컨퍼런스/교육/도서구매비 지원
 • 월 1회 팀/TF 식사 및 티타임 제공
 • 연 1회 건강검진 및 독감예방 접종 지원
 • 경조 휴가 및 경조금 지원 (결혼/출산/사망 등)
 • 명절 상품권 지급
 • 본인 생일, 명절 직전 영업일 조기 퇴근
 • 반려동물, 휴대가능한 악기, 자전거와 동반출근 가능
 • 직무 수행에 필요한 최신장비/소프트웨어 제공
 • 최고의 업무 환경인 Wework 역삼역점 입주사입니다. 안락한 환경, 국내/외 지점 자유로운 이용, 맥주와 커피 무한제공, 수시 이벤트 등의 서비스를 제공합니다.

            </div>
          </div> <!-- // c_introBtm -->


        </div> <!-- // c_introWrap -->


        <script>
          $(".followBtnWrap input[type='checkbox']").click(function(){
            if($(this).is(":checked")){
             $('.followBtnWrap span i').show();
            }else {
              $('.followBtnWrap span i').hide();
            }

          });
			var c_title = '<%= company.getName()%>';
          $('#company-logo').append('<span>'+c_title+'</span>')
        </script>





</div><!-- // wrap -->


<%@include file="/include/footer.jsp"%>