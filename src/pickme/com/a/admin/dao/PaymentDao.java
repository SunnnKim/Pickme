package pickme.com.a.admin.dao;

import java.util.List;

import model.PaymentDto;
import model.PaymentParam;
import model.PremierMemDto;
import model.PremierServiceDto;

public interface PaymentDao {
	
	// 관리자 
	// 유료회원 모두 불러오기
	public List<PremierMemDto> getPremierMember();
	// 유료 서비스 목록 불러오기
	public List<PremierServiceDto> getPremierService();
	// 유료 서비스 등록하기 
	public boolean insertService(PremierServiceDto serviceDto);
	// 유료 서비스 수정하기
	public boolean updateService(PremierServiceDto dto);
	// 유료 서비스 삭제하기
	public boolean deleteService(List<Integer> seqList);
	// 유료 서비스 통계
	public List<PaymentParam> getStatistics();
	// 신규 이용고객 통계
	public int getNewPremierMember();
	// 신규 환불고객 통계
	public int getRefundNumber();
	// 결제내역 모두 불러오기
	public List<PaymentDto> getAllPayments();
	// 환불내역 모두 불러오기
	public List<PaymentDto> getAllRefund();
	
	
	// 환불하기 
	// 환불하기 - 환불에 필요한 데이터 확인하기
	public PaymentDto checkRefundData(String impUid);
	// 환불하기 - 환불 후 payment 테이블 수정하기
	public boolean updateRefundPayment(PaymentDto dto);
	// 환불하기 - 환불 후 premiere_mem 테이블 수정하기
	public boolean updateRefundPremiereMem(PaymentDto dto);
	// 환불하기 - 환불내역 삭제하기 
	public boolean deleteRefund(List<Integer> seqList);
	
	
	// 환불 - 환불할 서비스 가져오기
	public PaymentDto getRefundableService(int seq);
	
	
	
}
