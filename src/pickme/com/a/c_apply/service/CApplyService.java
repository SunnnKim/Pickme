package pickme.com.a.c_apply.service;

import java.util.List;

import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageParam;

public interface CApplyService {

	public List<CvRequestDto> getRequestList(int c_seq);

	public List<CvRequestDto> getRequestList(MessageParam param);
	
	public int requestDelete(String checkRow);

	public List<CvRequestDto> requestLike(int c_seq);

	public boolean addLike(FavoriteDto dto);

	public boolean delLike(FavoriteDto dto);

	public boolean requestCancel(String cv_seq);

	public int getTotalRecordCount(MessageParam param);
}
