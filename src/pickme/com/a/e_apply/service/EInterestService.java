package pickme.com.a.e_apply.service;

import java.util.List;

import model.EInterestDto;
import model.EInterestParam;

public interface EInterestService {
	
	public List<EInterestDto> getInterComList( EInterestParam param);
	
	public int getTotalInterComCount(EInterestParam param);

}
