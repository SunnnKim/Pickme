package pickme.com.a.e_apply.service;

import java.util.List;

import model.EInterestDto;
import model.EInterestParam;

public interface EInterestService {
	
	public List<EInterestDto> getInterComList( EInterestParam param);
	
	public int getTotalInterComCount(EInterestParam param);
	
	public int removefav(EInterestParam param);
	
	public List<EInterestDto> getInterComRecruitList(EInterestParam param);
	
	public int getTotalinterComRecruit(EInterestParam param);
	
	public int applychk(EInterestParam param);
	
	public List<EInterestDto> getLikeRecruitList(EInterestParam param);
	
	public int getTotallikeRecruitCount(EInterestParam param);
	
	public List<EInterestDto> getRecentLikeRecruit(String email);

}
