package pickme.com.a.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.PaymentDto;
import model.PaymentParam;
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

	@Override
	public boolean insertService(PremierServiceDto serviceDto) {
		return dao.insertService(serviceDto);
	}

	@Override
	public boolean updateService(PremierServiceDto dto) {
		return dao.updateService(dto);
	}

	@Override
	public boolean deleteService(List<Integer> seqList) {
		return dao.deleteService(seqList);
	}

	@Override
	public List<PaymentParam> getStatistics() {
		return dao.getStatistics();
	}

	@Override
	public int getNewPremierMember() {
		return dao.getNewPremierMember();
	}

	@Override
	public int getRefundNumber() {
		return dao.getRefundNumber();
	}

	@Override
	public PaymentDto checkRefundData(String impUid) {
		return dao.checkRefundData(impUid);
	}

	@Override
	public boolean updateRefund(PaymentDto dto) {
		boolean check = dao.updateRefundPayment(dto);
		if(!check) {
			System.out.println("updateRefundPayment error");
			return false;
		}
		check = dao.updateRefundPremiereMem(dto);
		if(!check) {
			System.out.println("updateRefundPremiereMem error");
			return false;
		}
		return true;
	}

	@Override
	public PaymentDto getRefundableService(int seq) {
		return dao.getRefundableService(seq);
	}

	@Override
	public List<PaymentDto> getAllPayments() {
		return dao.getAllPayments();
	}

	@Override
	public List<PaymentDto> getAllRefund() {
		return dao.getAllRefund();
	}

	@Override
	public boolean deleteRefund(List<Integer> seqList) {
		return dao.deleteRefund(seqList);
	}
}
