package pickme.com.a.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.PremierMemDto;
import model.PremierServiceDto;
import pickme.com.a.admin.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao dao;

	@Override
	public List<PremierMemDto> getPremierMember() {
		return dao.getPremierMember();
	}

	@Override
	public List<PremierServiceDto> getPremierService() {
		return dao.getPremierService();
	}
}
