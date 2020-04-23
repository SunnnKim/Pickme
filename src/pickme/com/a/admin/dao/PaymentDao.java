package pickme.com.a.admin.dao;

import java.util.List;

import model.PaymentParam;
import model.PremierMemDto;
import model.PremierServiceDto;

public interface PaymentDao {
	
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
	
}
