<%@include file ="../../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    


<div class="profile-wrap">
  <div class="refund-title">
      <div>서비스 환불신청</div>
      <p>
          * 서비스 환불 신청 페이지입니다.<br>
          * 환불요청 정보를 작성하여 요청하시면 검토 후 환불처리를 완료합니다.<br>
          * 서비스 이용일 기준 하루이내 환불요청시 전액을, 7일이전 요청시 결제금액의 50% 환불가능합니다.<br>
          * 서비스 이용일 기준 8일 이후로 환불이 불가능하니 유의해주시기 바랍니다.
      </p>
  </div>
  <div class="refund-contents">
      <div class="usedService">
          <div class="title">이용서비스확인</div>
          <div class="wrapper">
              <div>서비스명 : <span>${payService.serviceName }</span></div>
              <div>주문자명 : <span>${payService.buyerName }</span></div>
              <div>결제금액 : <span>${payService.totalPay }원</span></div>
              <div>결제방법 :  <span>카드결제</span></div>
              <div>결제일 : <span>${payService.payDate }</span></div>
              <!-- <div>주문번호 : <span></span></div> -->
          </div>
      </div>
  </div>
  <div class="refund-info">
      <div class="title">환불정보입력</div>
      <div class="info-content">
          <div class="info-label"> * 환불방법<span>카드</span></div>
          <div class="info-label"> * 환불가능금액<span>${payService.totalPay }원</span></div>
          <div class="info-label">* 환불사유
            <span>
              <select name="reason">
                <option value="단순변심">단순변심</option>
                <option value="다른서비스이용">다른서비스이용</option>
                <option value="결제방식오류">결제방식오류</option>
                <option value="재결제를위함">재결제를위함</option>
                <option value="폐업">폐업</option>
                <option value="기타">기타</option>
              </select>
            </span>
          </div>
      </div>
  </div>
  <div class="warning-box">
    <p>* 서비스 환불과 관련하여 일정 금액의 카드 수수료가 부과될 수 있습니다.<br>
     환불이 진행되는 건은 환불요청 취소가 불가합니다.<br>
     환불 승인 이후에 카드사에 따라 2~7일의 처리기간이 소요될 수 있습니다.<br>
    </p>
    <label>
      Pick Me 의 환불절차에 동의하십니까?<input type="checkbox" id="agreement">
    </label>
    <button id="refund">환불요청하기</button>
  </div>
	
</div>
<script>
$('#refund').click(function(){
	if( $('#agreement').is(':checked') === false ){
		alert('환불절차에 동의해주세요')
		return false;
	}

	//JSON.stringify()
	var sendData = {
	        "imp_uid": "${payService.impUid}", // 주문번호
	        "cancel_request_amount": "${payService.totalPay}", // 환불금액
	        "reason": $('select[name=reason]').val(), // 환불사유
	        "refund_bank": "97"// [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번) 카카오페이 97번
	      }

/* 	JSON.stringify({
        // "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
        //imp_292773983115, merchant_1588487773805
        "imp_uid": "${payService.impUid}", // 주문번호
        "cancel_request_amount": "${payService.totalPay}", // 환불금액
        "reason": "테스트 결제 환불", // 환불사유
        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
        "refund_bank": "97", // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번) 카카오페이 97번
        // "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
      }) */
	
	// 환불진행 
	const $this = $(this);
    $.ajax({
        "url": "/Pickme/admin/payment/paymentCancel.do",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify(sendData),
        "dataType": "json",
        "success" : function(data){
			if(data == "nullData"){
				alert('환불할 내역이 없습니다.')
			}
			else if( data == "false"){

			}else if (data == "true"){	// 환불성공 
				alert('환불요청이 완료되었습니다.')
				location.href="/Pickme/c_mypage/goPayment.do";
			}
        },
        "error":function(err){
			alert("왜에러")
			console.log(err)
       }
     });
	//$this.siblings('#infos').append('<div>ads</div>');
})

</script>



<style>
.refund-title{ 
    /* border:1px solid; */
    margin-bottom: 30px;
}
.refund-title div{ font-size: 30px; color:#333;} 
.refund-title p{ font-weight: 300; margin: 10px 0; border-bottom: 1px solid #eaeaea; padding-bottom: 30px;} 
    
/* contents */
.refund-contents{
    border-bottom:1px solid #eaeaea;
}
.refund-contents .usedService{padding-bottom: 30px; }
.refund-contents .usedService .title{ font-size: 25px; margin: 25px 0; color:#333;}
.refund-contents  .usedService .wrapper{}
.refund-contents  .usedService .wrapper > div{ width: 350px;margin: 10px 20px; padding-left: 25px; }
.refund-contents  .usedService .wrapper > div > span{ margin-left: 40px; float: right; display: inline-block; width: 210px; border: 1px solid #eaeaea; text-align: center;}

/* refund-info */
.refund-info{ 
    /* border: 1px solid; */
    margin-top: 30px; border-bottom: 1px solid #eaeaea; padding-bottom: 30px;
}
.refund-info .title{ font-size: 25px; margin-bottom: 30px;}
.refund-info .info-content { 
    margin: 10px 0; padding: 0 20px;
    /* border: 1px solid #eaeaea;  */
}
.refund-info .info-content .info-label{ 
    font-size:15px; font-weight: 300; margin: 20px 0; height: 50px; line-height: 50px;
    /* border: 1px solid; */
}
.refund-info .info-content .info-label > span {  display: inline-block; width: 500px; position: absolute; left: 150px;
    margin-left: 30px; padding: 0 20px; font-weight: 600; 
}

select { margin-left: 0px; width: 250px; padding: .8em .5em; font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #eaeaea; border-radius: 0px; outline: none;}
select:focus{ border: 1px solid #bbb;}
select::-ms-expand { /* for IE 11 */ display: none;}

/* Agreement */
.warning-box{
  /* border: 1px solid; */
  margin: 50px 0; padding: 20px 0;position: relative; margin-left: 30px;
}
.warning-box p{
  margin: 10px 0; font-weight: 300;
}
.warning-box label{
  font-size: 18px; font-weight: 400; 
}
.warning-box label > input{margin: 0 10px; }

/* refund btn */
#refund{  display: block; margin: 0 auto; position: absolute; top:70px; right: 50px;
  background-color: #304edf; width: 300px; height: 40px; color: #fff; line-height: 40px; text-align: center;}
</style>
<%@include file ="../../../include/footer.jsp" %>