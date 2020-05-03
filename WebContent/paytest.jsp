<%@include file ="include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<div class="profile-wrap">


<button type="test" id="pay" style="">
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
</div>

<div id="payment-info-container">
	<div id="info-btn" style="width: 100px; height: 40px; border: 1px solid blue;">결제 조회</div>
	<div id="infos" style="border: 1px solid springgreen">
	</div>
</div>

<script>
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp11863886"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

$('#info-btn').click(function() {
	const $this = $(this);
    $.ajax({
        "url": "/Pickme/admin/paymentCancel.do",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          // "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
          //imp_292773983115, merchant_1588487773805
          "imp_uid": "imp_292773983115", // 주문번호
          "cancel_request_amount": "100", // 환불금액
          "reason": "테스트 결제 환불", // 환불사유
          "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
          "refund_bank": "97", // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번) 카카오페이 97번
          // "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
        }),
        "dataType": "json"
     });
	$this.siblings('#infos').append('<div>ads</div>');
});

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
	
})





</script>

<%@include file ="include/footer.jsp" %>