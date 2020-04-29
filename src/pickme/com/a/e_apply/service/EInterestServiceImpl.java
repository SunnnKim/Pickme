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

	@Override
	public int removefav(EInterestParam param) {
		
		return dao.removefav(param);
	}

	@Override
	public List<EInterestDto> getInterComRecruitList(EInterestParam param) {
		
		return dao.getInterComRecruitList(param);
	}

	@Override
	public int getTotalinterComRecruit(EInterestParam param) {
	
		return dao.getTotalinterComRecruit(param);
	}

	@Override
	public int applychk(EInterestParam param) {
		
		return dao.applychk(param);
	}

	@Override
	public List<EInterestDto> getLikeRecruitList(EInterestParam param) {
		
		return dao.getLikeRecruitList(param);
	}

	@Override
	public int getTotallikeRecruitCount(EInterestParam param) {
	
		return dao.getTotallikeRecruitCount(param);
	}

	@Override
	public List<EInterestDto> getRecentLikeRecruit(String email) {
		
		return dao.getRecentLikeRecruit(email);
	}
	
	
}
