package pickme.com.a.e_apply.dao;

import java.util.List;

import model.EInterestDto;
import model.EInterestParam;

public interface EInterestDao {
	
	public List<EInterestDto> getInterComList(EInterestParam param);

	public int getTotalInterComCount(EInterestParam param);
}
