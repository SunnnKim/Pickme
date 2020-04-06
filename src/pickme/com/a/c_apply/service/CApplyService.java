package pickme.com.a.c_apply.service;

import java.util.List;

import model.CvRequestDto;

public interface CApplyService {

	public List<CvRequestDto> getRequestList();
	
	public int requestDelete(String checkRow);

	public List<CvRequestDto> requestLikeList();
}
