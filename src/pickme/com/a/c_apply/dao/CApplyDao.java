package pickme.com.a.c_apply.dao;

import java.util.List;

import model.CvRequestDto;

public interface CApplyDao {
	
	public List<CvRequestDto> getRequestList();
	
	public int requestDelete(String seq);

	public List<CvRequestDto> requestListList();
}
