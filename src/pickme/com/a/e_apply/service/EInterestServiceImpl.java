package pickme.com.a.e_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.EInterestDto;
import model.EInterestParam;
import pickme.com.a.e_apply.dao.EInterestDao;

@Service
public class EInterestServiceImpl implements EInterestService {

	@Autowired
	EInterestDao dao;

	@Override
	public List<EInterestDto> getInterComList(EInterestParam param) {
		
		return dao.getInterComList(param);
	}

	@Override
	public int getTotalInterComCount(EInterestParam param) {
		
		return dao.getTotalInterComCount(param);
	}
	

}
