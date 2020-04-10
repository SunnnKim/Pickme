package pickme.com.a.c_apply.dao;

import java.util.List;

import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageParam;

public interface CApplyDao {
	
	public List<CvRequestDto> getRequestList(int c_seq);

	public List<CvRequestDto> getRequestList(MessageParam param);
	
	public int requestDelete(String seq);

	public List<CvRequestDto> requestLike(int c_seq);

	public boolean addLike(FavoriteDto dto);

	public boolean delLike(FavoriteDto dto);

	public boolean requestCancel(String cv_seq);

	public int getTotalRecordCount(MessageParam param);

}
