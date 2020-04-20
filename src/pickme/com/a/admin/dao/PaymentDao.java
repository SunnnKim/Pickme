package pickme.com.a.admin.dao;

import java.util.List;

import model.PremierMemDto;
import model.PremierServiceDto;

public interface PaymentDao {
	
	// 유료회원 모두 불러오기
	public List<PremierMemDto> getPremierMember();
	// 유료 서비스 목록 불러오기
	public List<PremierServiceDto> getPremierService();
	
}
