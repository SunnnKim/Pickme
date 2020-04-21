package pickme.com.a.admin.service;

import java.util.List;

import model.PremierMemDto;
import model.PremierServiceDto;

public interface PaymentService {

	public List<PremierMemDto> getPremierMember();
	public List<PremierServiceDto> getPremierService();
	public boolean insertService(PremierServiceDto serviceDto);
}
