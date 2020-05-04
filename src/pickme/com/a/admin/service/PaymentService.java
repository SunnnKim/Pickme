package pickme.com.a.admin.service;

import java.util.List;

import model.PaymentDto;
import model.PaymentParam;
import model.PremierMemDto;
import model.PremierServiceDto;

public interface PaymentService {

	public List<PremierMemDto> getPremierMember();
	public List<PremierServiceDto> getPremierService();
	public boolean insertService(PremierServiceDto serviceDto);
	public boolean updateService(PremierServiceDto dto);
	public boolean deleteService(List<Integer> seqList);
	public List<PaymentParam> getStatistics();
	public int getNewPremierMember();
	public int getRefundNumber();
	// 결제내역 모두 불러오기
	public List<PaymentDto> getAllPayments();
	// 환불내역 모두 불러오기
	public List<PaymentDto> getAllRefund();
	// 환불하기 - 환불내역 삭제하기 
	public boolean deleteRefund(List<Integer> seqList);
	
	
	// 환불하기 - 환불에 필요한 데이터 확인하기
	public PaymentDto checkRefundData(String impUid);
	// 환붏 후 두개의 테이블 바꾸기
	public boolean updateRefund(PaymentDto dto);
	// 환불 - 환불할 서비스 가져오기
	public PaymentDto getRefundableService(int seq);
		
	
}
