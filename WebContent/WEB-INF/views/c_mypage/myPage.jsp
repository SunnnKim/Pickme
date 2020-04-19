<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <h3><img src="https://static.wanted.co.kr/images/wdes/0_4.ce4fd8b1.jpg" alt="logo"> <%=company.getName() %></h3>
                </div>
                <ul>
                
                
                  <!-- <li><button onclick = "location.href='slide.do'">슬라이드 테스트</button></li> -->
                
                
                  <li><span>기업분야</span><%=company.getDepartment() %></li>
                  <li><span>규모</span><%=company.getType() %></li>
                  <li><span>대표자 성명</span><%=company.getPresident() %></li>
                  <li><span>전화번호</span><%=company.getTel() %></li>
                  <li><span>이메일</span><%=company.getEmail() %></li>
                  <li><span>주소</span><%=company.getAddress() %></li>
                </ul>
                <div class="followBtnWrap">
                  <label>
                    <% if(member != null) { %>
                    <span>팔로우<i class="fas fa-check"></i> <input type="checkbox"></span>
                    <% } else if(company != null) { %>
                    <span><i class="fas fa-check"></i> <a href="goUpdate.do?seq=<%=company.getSeq() %>">수정</a></span>
                    <% } %>
                  </label>
                </div>
            </div>  <!-- // c_introInfo -->
          </div> <!-- // c_introTop -->      

          <div class="c_introBtm">
          
          <!--  ★★★★★★★★★★★★★★★★★★ DB 에서 해시태그 걸어야함 ★★★★★★★★★★★★★★★★ -->
          
            <h4>회사소개 <span><span>#자유로운</span><span>#간식비지원</span><span>#수평적인</span></span></h4>
            <div class="cont">
              	<%=company.getIntroduce() %>
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
			<%-- var c_title = '<%= company.getName()%>';
          $('#company-logo').append('<span>'+c_title+'</span>') --%>
        </script>





</div><!-- // wrap -->


<%@include file="/include/footer.jsp"%>