<%@include file ="include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<div class="profile-wrap">


<button type="test" id="pay">
결제테스트
</button>
<form id="frm" method=post action="setPaymentInfo.do">
   <input type="hidden" name="impUid" value="">         <!-- 아임포트 거래 고유 번호 -->
   <input type="hidden" name="totalPay" value="">      <!-- 결제금액 -->
   <input type="hidden" name="paymentId" value="">      <!-- 가맹점에서 생성/관리하는 고유 주문번호 -->
   <input type="hidden" name="serviceName" value="">   <!-- 결제서비스명(주문명) -->
   <input type="hidden" name="serviceSeq" value="">   <!-- 결제서비스명(주문명) -->
   <!-- <input type="hidden" name="apply_num" value="">       -->   <!-- 카드사 승인번호 -->
</form>
<p> 
   결제 테스트
   <button id="check_module" type="button">결제</button>
</p>
</div>

<script>
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp11863886"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

$(document).on('click', '#pay', function(){

	//IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		  pg: "kakaopay",
		  //pay_method: "card",
		  merchant_uid: 'merchant_' + new Date().getTime(),
		  name: "노르웨이 회전 의자",
		  amount: 100,
		  buyer_email: "gildong@gmail.com",
		  buyer_name: "홍길동",
		  buyer_tel: "010-4242-4242",
		  buyer_addr: "서울특별시 강남구 신사동",
		  buyer_postcode: "01181"
	}, function (rsp) { // callback
		if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		      // jQuery로 HTTP 요청
		      jQuery.ajax({
		          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
		          method: "POST",
		          headers: { "Content-Type": "application/json" },
		          data: {
		              imp_uid: rsp.imp_uid,
		              merchant_uid: rsp.merchant_uid
		          }
		      }).done(function (data) {
		        // 가맹점 서버 결제 API 성공시 로직
			        console.log(data)
		      })
		    } else {
		      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    }
	});

    jQuery.ajax({
        url: "https://www.myservice.com/payments/complete", // 가맹점 서버
        method: "POST",
        headers: { "Content-Type": "application/json" },
        data: {
            imp_uid: rsp.imp_uid,
            merchant_uid: rsp.merchant_uid
        }, success : function(data){
				console.log(data)
          }
    });
	
})





</script>

<%@include file ="include/footer.jsp" %>