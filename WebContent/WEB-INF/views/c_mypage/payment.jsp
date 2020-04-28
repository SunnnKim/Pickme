<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>    


<div class="allWrap">
   현재 이용중인 서비스가 없습니다.
   <div class="allWrapDetail">
      합리적인 가격으로 최대의 혜택을 누리세요.
      <div class="buttonCls">
         <button type="button" onclick="goPage()"> 서비스 둘러보기 </button>
      </div>
      <div class="previous">
         <label> 과거 결제 내역 </label>
      </div>
   </div>
</div>
<form id="frm" method="post">
   <input type="hidden" name="imp_uid" value="">			<!-- 아임포트 거래 고유 번호 -->
   <input type="hidden" name="merchant_uid" value="">		<!-- 가맹점에서 생성/관리하는 고유 주문번호 -->
   <input type="hidden" name="paid_amount" value="">		<!-- 결제금액 -->
   <input type="hidden" name="apply_num" value="">			<!-- 카드사 승인번호 -->
</form>
<p> 
   결제 테스트
   <button id="check_module" type="button">결제</button>
</p>

<script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp11863886'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: '주문명:결제테스트',                //결제창에서 보여질 이름
            amount: 10,                         //가격 
            buyer_email: '${dto.email }',
            buyer_name: '${dto.name }',
            buyer_tel: '${dto.tel }',
            buyer_addr: '${dto.address }',
            m_redirect_url: 'http://www.naver.com'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                // DB로 보낼 데이터 작성 

				




   				
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>


<script>
   function goPage() {
      location.href="/Pickme/customer/paidService.do"
}
</script>



<style>
/* 결제 내역 없을 때5 화면 */
.allWrap{text-align:center;font-size:30px;margin-top:100px;}
.allWrapDetail{font-size:19px;margin-top:50px;}
.buttonCls button{margin-top:50px; width:200px; height: 50px; color:#fff; background-color:#4f6eff; border-radius:5px 5px 5px 5px;}
.buttonCls button:hover{background-color:#859aff;}
.previous label{margin-top:120px;text-decoration:underline;}

/* 결제 내역 있을 때 화면 */

</style>


<%@include file ="../../../include/footer.jsp" %>