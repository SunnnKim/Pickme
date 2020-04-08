package pickme.com.a.c_apply.service;

import java.util.List;

import model.CvRequestDto;
import model.FavoriteDto;

public interface CApplyService {

	public List<CvRequestDto> getRequestList();
	
	public int requestDelete(String checkRow);

	public List<CvRequestDto> requestLike();

	public boolean addLike(FavoriteDto dto);

	public boolean delLike(FavoriteDto dto);

	public boolean requestCancel(String cv_seq);
}
