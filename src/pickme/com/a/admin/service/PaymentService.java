package pickme.com.a.admin.service;

import java.util.List;

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
	
}
