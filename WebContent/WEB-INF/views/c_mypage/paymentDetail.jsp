<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<form id="frm" method=post action="setPaymentInfo.do">
	   <input type="hidden" name="impUid" value="">         <!-- 아임포트 거래 고유 번호 -->
	   <input type="hidden" name="totalPay" value="">      <!-- 결제금액 -->
	   <input type="hidden" name="paymentId" value="">      <!-- 가맹점에서 생성/관리하는 고유 주문번호 -->
	   <input type="hidden" name="serviceName" value="">   <!-- 결제서비스명(주문명) -->
	   <input type="hidden" name="serviceSeq" value="">   <!-- 결제서비스명(주문명) -->   
   	</form>
   	
	<div class="allWrap">
		<p class="allWrapTitle">결제를 진행합니다</p>
	</div>
	<div class="payInfoWrap">
		어떻게 결제하시겠습니까?
	</div>
		<button class="Method_card">
			<i class="far fa-credit-card"></i> 카드
		</button>
		<button class="Method_account">
			<i class="fas fa-exchange-alt"></i> 계좌이체
		</button>
		
		<div class="payDetail_card">
			<input type="radio" class="personal" name="card"> 개인카드
			<input type="radio" class="corporation" name="card"> 법인카드
			<div>
				<button type="button" class="pay_card_Btn" id = "check_module1"> 결제 </button>
			</div>
		</div>
		
		<div class="payDetail_account">
			<button type="button" class="pay_account_Btn" id = "check_module2"> 결제 </button>
		</div>
		
		
		<script>
			$(".allWrapTitle").hide();
			$(".payInfoWrap").hide();

			$(document).ready(function() {

				$(".allWrapTitle").fadeIn(1000);
				$(".payInfoWrap").fadeIn(2000);
				
				$(".payDetail_card").hide();
				$(".payDetail_account").hide();

				// 카드 결제 선택
				$(".Method_card").click(function () {
					$(".payDetail_account").hide();
					$('.payDetail_card').fadeIn();
				})

				// 계좌 이체 선택
				$(".Method_account").click(function () {
					$(".payDetail_card").hide();
					$('.payDetail_account').fadeIn();
				})
			})
		</script>
		
		
		<!--====================================== 결제 ======================================-->

		<script>
		    $("#check_module1").click(function () {
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
		            name: '${premierDTO.serviceName }',                // 결제창에서 보여질 이름
		            amount: 100,                         //가격 
		            buyer_email: `${memberDto.email }`,
		            buyer_name: `${memberDto.name }`,
		            buyer_tel: `${memberDto.tel }`,         //(필수항목) 누락되거나 blank일 때 일부 PG사에서 오류 발생
		            buyer_addr: `${memberDto.address }`
		            /*  
		                모바일 결제시,
		                결제가 끝나고 랜딩되는 URL을 지정 
		                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
		                */
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {      // 실제 결제승인이 이뤄졌거나, 가상계좌 발급이 성공된 경우, True
		                var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		                msg += '주문명 : ' + rsp.name;

		            
		            // 페이지 처음 들어왔을 때 선택한 서비스 번호 가져오기  
		            var serviceSeq = <%=request.getParameter("seq")%>
		            // DB로 보낼 데이터 저장
		            $("input[name=impUid]").val(rsp.imp_uid);
		            $("input[name=paymentId]").val(rsp.merchant_uid);
		            $("input[name=totalPay]").val(rsp.paid_amount);
		            $("input[name=serviceName]").val(rsp.name);
		            $("input[name=serviceSeq]").val(serviceSeq);
			
		            $("form").submit();

		            Swal.fire({
		        			position: 'center',
		        			icon: 'success',
		        			title: '결제가 완료되었습니다!',
		        			text: '잠시 후 결제내역 페이지로 이동됩니다.',
		        			timer: 4000
		        		})
		               
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                Swal.fire({
		        			position: 'center',
		        			icon: 'error',
		        			title: '결제에 실패했습니다.',
		        			timer: 4000
		        		})
		            }
		        });
		    });
		</script>
		
		<script>
		    $("#check_module2").click(function () {
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp11863886'); 
		        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		        IMP.request_pay({
		            pg:'inicis', // version 1.1.0부터 지원.
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
		            pay_method: 'trans',
		            /* 
		                'samsung':삼성페이, 
		                'card':신용카드, 
		                'trans':실시간계좌이체,
		                'vbank':가상계좌,
		                'phone':휴대폰소액결제 
		            */
		            merchant_uid: 'merchant_' + new Date().getTime(),
		            name: '결제테스트',                // 결제창에서 보여질 이름
		            amount: 150,                         //가격 
		            buyer_email: `${memberDto.email }`,
		            buyer_name: `${memberDto.name }`,
		            buyer_tel: `${memberDto.tel }`,         //(필수항목) 누락되거나 blank일 때 일부 PG사에서 오류 발생
		            buyer_addr: `${memberDto.address }`
		            /*  
		                모바일 결제시,
		                결제가 끝나고 랜딩되는 URL을 지정 
		                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
		                */
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {      // 실제 결제승인이 이뤄졌거나, 가상계좌 발급이 성공된 경우, True
		                var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		                msg += '주문명 : ' + rsp.name;

		            
		            // 페이지 처음 들어왔을 때 선택한 서비스 번호 가져오기  
		            var serviceSeq = ${seq};
		            
		            // DB로 보낼 데이터 저장
		            $("input[name=impUid]").val(rsp.imp_uid);
		            $("input[name=paymentId]").val(rsp.merchant_uid);
		            $("input[name=totalPay]").val(rsp.paid_amount);
		            $("input[name=serviceName]").val(rsp.name);
		            $("input[name=serviceSeq]").val(serviceSeq);
			
		            $("form").submit();

		            Swal.fire({
	        			position: 'center',
	        			icon: 'success',
	        			title: '결제가 완료되었습니다!',
	        			text: '잠시 후 결제내역 페이지로 이동됩니다.',
	        			timer: 4000
	        		})
		            
		               
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                Swal.fire({
		        			position: 'center',
		        			icon: 'error',
		        			title: '결제에 실패했습니다.',
		        			timer: 4000
		        		})
		            }
		        });
		    });
		</script>

<style>
.allWrap{font-size:40px;color:#4f6eff;text-align:center;padding-top:100px;padding-bottom:50px;border-bottom:1px solid #D8D8D8;}
.payInfoWrap{margin-top:150px;margin-bottom:50px;margin-left:389px;font-size:25px;}
.Method_card{margin-left:214px;width:300px;height:100px;line-height:100px;border-radius:7px 7px 7px 7px;border:1px solid #999;text-align:center;font-size:18px;}
.Method_account{margin-left:20px;width:300px;height:100px;line-height:100px;border-radius:7px 7px 7px 7px;border:1px solid #999;text-align:center;font-size:18px;}
.Method_card:hover{background-color:#A9D0F5;}
.Method_account:hover{background-color:#A9D0F5;}

.Method_card i{margin-right:10px;}
.Method_account i{margin-right:10px;}

.payDetail_card{text-align:center;margin-top:60px;}
.pay_card_Btn{width:100px;height:50px;border:1px solid #999;margin-top:100px;}
.personal{margin-left:10px;margin-right:10px;}
.corporation{margin-left:90px;margin-right:10px;}

.payDetail_account{text-align:center;margin-top:100px;}
.pay_account_Btn{width:100px;height:50px;border:1px solid #999;}
</style>

<%@include file ="../../../include/footer.jsp" %>