<%@page import="model.PremierServiceDto"%>
<%@include file ="../../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
	PremierServiceDto dto = (PremierServiceDto)request.getAttribute("dto");
%>

<div class="profile-wrap">
  <div class="detail-wrapper">
    <div class="detail-info clfix">
      <div class="detail-title"><%= dto.getServiceName() %></div>
      <div class="info-box">
        <div>이용가격<span class="price"></span></div>
        <div>이용기간<span><%=dto.getPeriod() %></span></div>
        <div>서비스내용<span><%=dto.getServiceInfo() %></span></div>
        <div class="btn" onclick="goPaying(<%=dto.getServiceSeq() %>)">결제하기</div>
      </div>
    </div>
    <div class="detail-content">
    	<%=dto.getContent() %>
    </div>
  </div>
  <div id="back-btn" onclick="javascript:history.back()">목록보기</div>
</div>
<script>
$('.price').text(changeValue(<%=dto.getPrice()%>))
//세자리 이상 숫자에 , 붙이기 
function changeValue( number ){
	number = String(number);
    return number.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}
// 결제하기 버튼
function goPaying( seq ) {
	//alert("seq = " + seq);
	location.href="/Pickme/c_mypage/paymentDetail.do?seq="+seq;	// 서비스 시퀀스를 가지고 결제 페이지로 이동
}

</script>
<style>
.detail-wrapper{  }
.detail-wrapper .detail-info{ height: 200px; margin-bottom: 20px; border-bottom: 1px solid #eaeaea;}
.detail-wrapper .detail-info .detail-title{ width: 300px; height: 180px; line-height: 180px; margin-right: 20px;font-size: 40px; text-align: center; float: left;}
.detail-wrapper .detail-info .info-box{}
.detail-wrapper .detail-info .info-box > div {width: 700px; float: right; margin-top: 10px; position: relative; margin-bottom: 5px;}
.detail-wrapper .detail-info .info-box > div > span {position: absolute; left: 110px;}
.detail-wrapper .detail-info .info-box > div.btn {  cursor: pointer; width: 200px; height: 40px; line-height: 40px; text-align: center; background: #4356b3; border-radius: 20px; color: #fff; }
.detail-wrapper .detail-content{ margin: 50px 0;}
/* back-btn */
#back-btn{ cursor: pointer; background: #4356b3; width: 300px; height: 40px; color: #fff; line-height: 40px; text-align: center; margin: 10px auto;}
</style>

<%@include file ="../../../../include/footer.jsp" %>